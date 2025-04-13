{ lib, pkgs, ... }:
{
  imports = lib.custom.scanPaths ./.;

  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    systemd.setPath.enable = true;
  };

  documentation = {
    enable = true;
    doc.enable = false;
    man.enable = true;
    dev.enable = false;
    info.enable = false;
    nixos.enable = false;
  };

  environment.systemPackages = with pkgs; [
    bc
    curl
    fd
    gcc
    gh
    git-ignore
    wget
    xdg-utils
  ];
}
