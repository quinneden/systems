{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = (lib.custom.scanPaths ./.) ++ [
    ../../modules/nixos
    ../../hosts/macmini-m1/theme.nix
  ];

  stylix.targets = {
    micro.enable = true;
    vscode.enable = false;
    zed.enable = false;
  };

  home.packages = with pkgs; [
    inputs.acmsg.packages.${pkgs.system}.acmsg
    bat
    fzf
    ripgrep
  ];
}
