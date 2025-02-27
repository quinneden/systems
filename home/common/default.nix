{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = lib.custom.scanPaths ./.;

  home = {
    file.".hushlogin".text = "";

    packages = with pkgs; [
      cachix
      eza
      gawk
      gnutar
      inputs.shellpers.packages.${pkgs.system}.metapackage
      neovim
      nil
      nix-prefetch-git
      nix-prefetch-github
      nixd
      nixfmt-rfc-style
      qemu
      zoxide
    ];

    stateVersion = "25.05";
  };
}
