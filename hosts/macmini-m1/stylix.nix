{
  inputs,
  pkgs,
  ...
}:
{
  stylix = {
    enable = true;

    # colors = inputs.tinted-nix.schemes.base16.framer.palette;

    base16Scheme = pkgs.base16-schemes + "/share/themes/framer.yaml";

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
        name = "SFProText Nerd Font Regular";
      };

      serif = {
        package = inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd;
        name = "SFProText Nerd Font Regular";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        applications = 13;
        desktop = 14;
        popups = 12;
        terminal = 13;
      };
    };

    polarity = "dark";

    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/anotherhadi/nixy-wallpapers/refs/heads/main/wallpapers/black-moutains.png";
      hash = "sha256-tKBdN4qUWa3F0kGJsOq/7999Z0YAx2k92Y+uWecMmt0=";
    };
  };
}
