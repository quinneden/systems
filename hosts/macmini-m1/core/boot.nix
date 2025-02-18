{ pkgs, ... }:
{
  boot = {
    bootspec.enable = true;
    consoleLogLevel = 0;
    initrd.verbose = false;

    kernelParams = [
      "quiet"
      "splash"
      "vga=current"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];

    loader = {
      efi.canTouchEfiVariables = false;
      systemd-boot = {
        enable = true;
        configurationLimit = 8;
      };
    };

    m1n1CustomLogo = pkgs.fetchurl {
      url = "https://f.qeden.me/bootlogo-snowflake-white.png";
      hash = "sha256-6VpPDZSYD57m4LZRPQuOWtR7z70BQ0A2f2jZgjXDiKs=";
    };

    tmp.cleanOnBoot = true;
  };
}
