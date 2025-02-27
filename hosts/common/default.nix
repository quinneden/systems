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
      sops-nix.${platformModules}.default
    ]);

  home-manager = {
    backupFileExtension = "hmbak";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs platform; };
    users.quinn = import ../../home;
  };

  nix = {
    enable = true;
    channel.enable = false;
    distributedBuilds = true;
    nixPath = [ "nixpkgs=flake:nixpkgs" ];
    optimise = {
      automatic = true;
    };
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
        "https://cache.lix.systems"
        "https://quinneden.cachix.org"
        "https://nix-community.cachix.org"
      ];
      extra-trusted-public-keys = [
        "cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o="
        "quinneden.cachix.org-1:1iSAVU2R8SYzxTv3Qq8j6ssSPf0Hz+26gfgXkvlcbuA="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      # secret-key-files = [ "${../../.secrets/keys/cache-private-key.pem}" ];
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
      inputs.nixd.overlays.default
      self.overlays.default
    ];
  };
}
