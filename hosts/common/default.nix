{
  config,
  inputs,
  lib,
  platform,
  self,
  ...
}:
let
  platformModules = "${platform}Modules";
in
{
  imports = (lib.custom.scanPaths ./.) ++ [
    ../../modules/${platform}
    inputs.home-manager.${platformModules}.default
    inputs.lix-module.nixosModules.default
    inputs.sops-nix.${platformModules}.default
  ];

  home-manager = {
    backupFileExtension = "hm-backup";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs platform; };
    users.quinn = import ../../home;
  };

  nix = {
    enable = true;
    distributedBuilds = true;
    nixPath = [
      "home-manager=${inputs.home-manager}"
      "nix-darwin=${inputs.nix-darwin}"
      "nixpkgs=${inputs.nixpkgs}"
    ];
    optimise.automatic = true;
    registry = lib.mapAttrs (_: flake: { inherit flake; }) (
      lib.filterAttrs (_: lib.isType "flake") inputs
    );
    settings = {
      accept-flake-config = true;
      access-tokens = [ "github=@${config.sops.secrets.github_token.path}" ];
      always-allow-substitutes = true;
      builders-use-substitutes = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      extra-substituters = [
        "https://quinneden.cachix.org"
        "https://nix-community.cachix.org"
      ];
      extra-trusted-public-keys = [
        "quinneden.cachix.org-1:1iSAVU2R8SYzxTv3Qq8j6ssSPf0Hz+26gfgXkvlcbuA="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      trusted-users = [
        "quinn"
        "root"
      ];
      warn-dirty = false;
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [ self.overlays.default ];
  };
}
