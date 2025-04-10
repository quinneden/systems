{ config, ... }:
{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    includes = [ "config.d/*.conf" ];
    matchBlocks = {
      "oc-runner" = {
        hostname = "129.146.66.178";
        user = "root";
        identityFile = config.sops.secrets."private_keys/oc-runner".path;
      };

      "picache" = {
        hostname = "10.0.0.101";
        user = "qeden";
      };

      "macmini-m1".hostname = "10.0.0.235";
      "nixos-macmini".hostname = "10.0.0.245";
    };
  };
}
