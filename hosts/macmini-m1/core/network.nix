{ lib, ... }:
{
  systemd.services.NetworkManager-wait-online.enable = false;

  networking = {
    hostName = "macmini-m1";

    useDHCP = lib.mkDefault false;
    interfaces.wlan0.useDHCP = lib.mkDefault true;
    wireless.iwd = {
      enable = true;
      settings = {
        IPv6.Enabled = true;
        Settings.AutoConnect = true;
        General.EnableNetworkConfiguration = true;
      };
    };

    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
  };

  services.blueman.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}
