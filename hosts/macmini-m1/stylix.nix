{ inputs, pkgs, ... }:
{
  theme = rec {
    rounding = 12;
    gaps-in = 4;
    gaps-out = gaps-in * 1.5;
    active-opacity = 1;
    inactive-opacity = 0.96;
    blur = true;
    border-size = 2;
    animation-speed = "medium"; # "fast" | "medium" | "slow"
    fetch = "neofetch"; # "nerdfetch" | "neofetch" | "pfetch" | "none"
    bar = {
      position = "top";
      transparent = true;
      transparentButtons = false;
      floating = true;
    };
  };

  stylix = {
    enable = true;

    base16Scheme = pkgs.base16-schemes + "/share/themes/hardcore.yaml";

    cursor = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-dark";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.caskaydia-cove;
        name = "CaskaydiaCove Nerd Font Mono";
      };

      sansSerif = {
        package = inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd;
        name = "SFProDisplay Nerd Font";
      };

      serif = {
        package = inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd;
        name = "SFProDisplay Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        applications = 14;
        desktop = 13;
        popups = 13;
        terminal = 13;
      };
    };

    polarity = "dark";

    image = pkgs.fetchurl {
      url = "https://github.com/anotherhadi/nixy-wallpapers/blob/main/wallpapers/mountains-black.png?raw=true";
      hash = "sha256-L5uGI6QNnlIrJJOzGHRhkYYb51JrVqFME1+LyTimUgs=";
    };
  };
}
