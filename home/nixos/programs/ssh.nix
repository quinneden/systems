{
  programs.ssh = {
    enable = true;

    addKeysToAgent = "yes";

    includes = [ "config.d/*.conf" ];

    matchBlocks = {
      "oc-runner" = {
        hostname = "129.146.66.178";
        user = "root";
        identityFile = "/Users/quinn/.ssh/keys/oc-runner_ssh_ed25519_key";
      };

      "macmini-m4" = {
        hostname = "10.0.0.53";
        user = "quinn";
      };
    };
  };
}
