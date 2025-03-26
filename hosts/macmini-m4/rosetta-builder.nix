{ config, inputs, ... }:
{
  imports = [ inputs.nix-rosetta-builder.darwinModules.default ];

  nix-rosetta-builder = {
    enable = true;

    cores = 8;
    diskSize = "150GiB";

    extraConfig = {
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

    memory = "8GiB";
    onDemand = true;
    withRosetta = false;
  };
}
