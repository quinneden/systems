{
  programs.ssh = {
    enable = true;

    addKeysToAgent = "yes";

    includes = [ "config.d/*.conf" ];

    matchBlocks = {
      "macmini-m4" = {
        hostname = "10.0.0.53";
        user = "quinn";
      };
    };
  };
}
