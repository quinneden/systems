{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = lib.custom.scanPaths ./. ++ (with inputs; [ mac-app-util.homeManagerModules.default ]);

  home.packages = with pkgs; [
    ks
    vesktop
  ];

  programs = {
    man.enable = false;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
    };

    ssh = {
      enable = true;
      addKeysToAgent = "yes";
      includes = [ "config.d/*.conf" ];
      matchBlocks = {
        "oc-runner" = {
          hostname = "100.88.22.94";
          user = "root";
          identityFile = config.sops.secrets."private_keys/oc-runner".path;
        };

        "picache" = {
          hostname = "10.0.0.101";
          user = "qeden";
          identityFile = config.sops.secrets."private_keys/picache".path;
        };

        "macmini-m1".hostname = "10.0.0.235";
        "nixos-macmini".hostname = "10.0.0.243";
      };
    };
  };
}
