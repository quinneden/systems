{ pkgs, inputs, ... }:
{

  fonts = {
    packages = with pkgs; [
      inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      openmoji-color
      source-sans
      twemoji-color-font
    ];

    enableDefaultPackages = false;

    fontconfig = {
      defaultFonts = {
        monospace = [
          "CaskaydiaCove Nerd Font Mono"
          "Noto Color Emoji"
        ];
        sansSerif = [
          "SFProDisplay Nerd Font"
          "Noto Color Emoji"
        ];
        serif = [
          "SFProDisplay Nerd Font"
          "Noto Color Emoji"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
