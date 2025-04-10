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
  imports =
    (lib.custom.scanPaths ./.)
    ++ (with inputs; [
      ../../modules/${platform}
      home-manager.${platformModules}.default
      lix-module.nixosModules.default
      sops-nix.${platformModules}.default
    ]);

  home-manager = {
    backupFileExtension = "hmbak";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs platform; };
    users.quinn = import ../../home;
  };

  environment.etc = lib.mapAttrs' (name: value: {
    name = "nix/path/${name}";
    value.source = value.flake;
  }) config.nix.registry;

  nix = {
    enable = true;
    distributedBuilds = true;
    nixPath = [ "/etc/nix/path" ];
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

    overlays = [
      inputs.shellpers.overlays.default
      self.overlays.default
    ];
  };
}
