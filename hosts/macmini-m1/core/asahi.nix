{ pkgs, ... }:
{
  hardware = {
    asahi = {
      enable = true;
      setupAsahiSound = false;
      useExperimentalGPUDriver = true;
      extractPeripheralFirmware = true;
      peripheralFirmwareDirectory = pkgs.fetchzip {
        url = "https://f.qeden.me/fw/asahi_fw_2025-1-15.tgz";
        hash = "sha256-5FdsoUJZqHLSecJpst95418kFTouaxo4wmC5rEXskMk=";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    asahi-bless
    asahi-btsync
    asahi-fwextract
  ];
}
