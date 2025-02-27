{ config, inputs, ... }:
{
  imports = [ inputs.nix-rosetta-builder.darwinModules.default ];

  nix-rosetta-builder = {
    enable = true;

    withRosetta = false;
    cores = 8;
    memory = "6GiB";
    diskSize = "100GiB";
    onDemand = true;
    allowExtraConfig = true;

    extraConfig = {
      imports = [ inputs.lix-module.nixosModules.default ];

      nix = {
        optimise.automatic = true;
        settings = {
          access-tokens = [ "github=@${config.sops.secrets.github_token.path}" ];
          extra-substituters = [ "https://quinneden.cachix.org" ];
          extra-trusted-public-keys = [
            "quinneden.cachix.org-1:1iSAVU2R8SYzxTv3Qq8j6ssSPf0Hz+26gfgXkvlcbuA="
          ];
          warn-dirty = false;
        };
      };
    };
  };
}
