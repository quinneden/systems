{ pkgs, ... }:
{
  fonts.packages = with pkgs.nerd-fonts; [
    caskaydia-cove
    hack
    fira-code
    jetbrains-mono
    iosevka
    iosevka-term
    symbols-only
    noto
    operator-mono-nerd-font
    victor-mono
  ];
}
