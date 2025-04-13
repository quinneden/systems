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
      direnv
      eza
      gawk
      gnutar
      inputs.shellpers.packages.${pkgs.system}.metapackage
      neovim
      nix-prefetch-git
      nix-prefetch-github
      nixfmt-rfc-style
      qemu
      zoxide
    ];

    stateVersion = "25.05";
  };
}
