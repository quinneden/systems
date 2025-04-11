{ lib, pkgs, ... }:
{
  imports = (lib.custom.scanPaths ./.) ++ [
    ../../modules/nixos
    ../../hosts/macmini-m1/theme.nix
  ];

  stylix.targets = {
    micro.enable = false;
    vscode.enable = false;
    zed.enable = false;
  };

  home.packages = with pkgs; [
    fzf
    ripgrep
  ];
}
