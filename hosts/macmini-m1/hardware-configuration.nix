{ lib, modulesPath, ... }:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [ "xhci_pci" ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/50cc11f0-8980-43a6-b910-c641be4a4f35";
    fsType = "btrfs";
    options = [
      "compress=zstd"
      "subvol=@root"
      "noatime"
    ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/50cc11f0-8980-43a6-b910-c641be4a4f35";
    fsType = "btrfs";
    options = [
      "compress=zstd"
      "subvol=@nix"
      "noatime"
    ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/12CE-A600";
    fsType = "vfat";
    options = [
      "dmask=0022"
      "fmask=0022"
    ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/50cc11f0-8980-43a6-b910-c641be4a4f35";
    fsType = "btrfs";
    options = [
      "compress=zstd"
      "subvol=@home"
    ];
  };

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
}
