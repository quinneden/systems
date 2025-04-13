{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
let
  inherit (config.theme)
    bar
    border-size
    gaps-in
    gaps-out
    rounding
    ;

  inherit (config.var) location;

  accent = "#${config.lib.stylix.colors.base0D}";
  accent-alt = "#${config.lib.stylix.colors.base03}";
  background = "#${config.lib.stylix.colors.base00}";
  background-alt = "#${config.lib.stylix.colors.base01}";
  foreground = "#${config.lib.stylix.colors.base05}";
  font = config.stylix.fonts.serif.name;
  fontSize = toString config.stylix.fonts.sizes.desktop;
in
{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  programs.hyprpanel = {
    enable = true;
    hyprland.enable = true;
    overwrite.enable = true;
    overlay.enable = true;
    systemd.enable = true;

    settings = {
      bar = {
        autoHide = "fullscreen";
        bluetooth.label = false;
        clock.format = "%a, %B%_e %_l:%M %p";
        customModules.updates.pollingInterval = 1440000;
        launcher.icon = "";
        media.show_active_only = true;
        network.truncation_size = 12;
        notifications.show_total = true;
        volume.label = false;
        windowtitle.label = true;

        workspaces = {
          applicationIconEmptyWorkspace = "";
          monitorSpecific = false;
          numbered_active_indicator = "color";
          show_numbered = false;
          showApplicationIcons = true;
          showWsIcons = true;
          workspaces = 5;
        };
      };

      hyprpanel.restartAgs = true;

      layout = {
        "bar.layouts" = {
          "0" = {
            "left" = [
              "dashboard"
              "workspaces"
              "windowtitle"
            ];
            "middle" = [ "clock" ];
            "right" = [
              "systray"
              "volume"
              "bluetooth"
              "network"
              "notifications"
            ];
          };
        };
      };

      menus = {
        clock.weather.location = "${location}";
        clock.weather.unit = "imperial";

        dashboard = {
          powermenu.confirmation = false;

          shortcuts.left = {
            shortcut1 = {
              command = "zen";
              icon = "";
              tooltip = "Zen";
            };

            shortcut2 = {
              command = "caffeine";
              icon = "󰅶";
              tooltip = "Caffeine";
            };

            shortcut3 = {
              command = "night-shift";
              icon = "󰖔";
              tooltip = "Night-shift";
            };

            shortcut4 = {
              command = "menu";
              icon = "";
              tooltip = "Search Apps";
            };
          };

          shortcuts.right = {
            shortcut1 = {
              command = "hyprpicker -a";
              icon = "";
              tooltip = "Color Picker";
            };
          };
        };
      };

      tear = true;

      theme = {
        matugen = true;

        bar = {
          border_radius = "${toString rounding}px";

          buttons = {
            background_hover_opacity = 100;
            background_opacity = 100;
            borderSize = "0.08rem";
            enableBorders = true;
            monochrome = true;
            padding_x = "0.8rem";
            padding_y = "0.4rem";
            # radius = "${if bar.transparent then toString rounding else toString (rounding - 8)}px";
            radius = "14";
            spacing = "0.3em";
            style = "default";
            y_margins = "${if bar.floating && bar.transparent then "0" else "8"}px";
          };

          dropdownGap = "4.0em";
          floating = bar.floating;
          location = bar.position;

          margin_bottom = "${if bar.position == "top" then "0" else toString (gaps-in * 1.5)}px";
          margin_sides = "${toString (gaps-out - 2)}px";
          margin_top = "${if bar.position == "top" then toString (gaps-in * 1.5) else "0"}px";

          menus = {
            border = {
              radius = "${toString rounding}px";
              size = "${toString border-size}px";
            };
            card_radius = "${toString rounding}px";
            menu.media.card.tint = 90;
            monochrome = true;
          };

          outer_spacing = "${if bar.floating && bar.transparent then "0" else "8"}px";
          scaling = 85;
          transparent = bar.transparent;
        };

        font = {
          name = "${font}";
          size = "${fontSize}px";
        };

        notification.border_radius = "${toString rounding}px";

        osd = {
          enable = true;
          location = "left";
          margins = "0px 0px 0px 10px";
          muted_zero = true;
          orientation = "vertical";
          radius = "${toString rounding}px";
        };
      };

      wallpaper = {
        enable = true;
        image =
          (pkgs.fetchurl {
            url = "https://raw.githubusercontent.com/anotherhadi/nixy-wallpapers/refs/heads/main/wallpapers/black-moutains.png";
            hash = "sha256-tKBdN4qUWa3F0kGJsOq/7999Z0YAx2k92Y+uWecMmt0=";
          }).outPath;
      };
    };

    override = {
      "bar.workspaces.hideUnoccupied" = true;
      "theme.bar.background" =
        background + (lib.optionalString (bar.transparentButtons && bar.transparent) "00");
      "theme.bar.buttons.hover" = background;
      "theme.bar.buttons.icon" = accent;
      "theme.bar.buttons.notifications.background" = background-alt;
      "theme.bar.buttons.notifications.hover" = background;
      "theme.bar.buttons.notifications.icon" = accent;
      "theme.bar.buttons.notifications.total" = accent;
      "theme.bar.buttons.text" = foreground;
      "theme.bar.buttons.workspaces.active" = accent;
      "theme.bar.buttons.workspaces.available" = accent-alt;
      "theme.bar.buttons.workspaces.hover" = accent-alt;
      "theme.bar.buttons.workspaces.occupied" = accent-alt;
      "theme.bar.menus.background" = background;
      "theme.bar.menus.border.color" = accent;
      "theme.bar.menus.buttons.active" = accent;
      "theme.bar.menus.buttons.default" = accent;
      "theme.bar.menus.cards" = background-alt;
      "theme.bar.menus.check_radio_button.active" = accent;
      "theme.bar.menus.dropdownmenu.background" = background-alt;
      "theme.bar.menus.dropdownmenu.text" = foreground;
      "theme.bar.menus.iconbuttons.active" = accent;
      "theme.bar.menus.icons.active" = accent;
      "theme.bar.menus.label" = foreground;
      "theme.bar.menus.listitems.active" = accent;
      "theme.bar.menus.menu.media.background.color" = background-alt;
      "theme.bar.menus.menu.media.card.color" = background-alt;
      "theme.bar.menus.popover.background" = background-alt;
      "theme.bar.menus.popover.text" = foreground;
      "theme.bar.menus.progressbar.foreground" = accent;
      "theme.bar.menus.slider.primary" = accent;
      "theme.bar.menus.switch.enabled" = accent;
      "theme.bar.menus.text" = foreground;
      "theme.bar.menus.tooltip.background" = background-alt;
      "theme.bar.menus.tooltip.text" = foreground;
      "theme.notification.actions.background" = accent;
      "theme.notification.actions.text" = foreground;
      "theme.notification.background" = background-alt;
      "theme.notification.border" = background-alt;
      "theme.notification.label" = accent;
      "theme.notification.labelicon" = accent;
      "theme.notification.text" = foreground;
      "theme.osd.bar_color" = accent;
      "theme.osd.bar_container" = background-alt;
      "theme.osd.bar_overflow_color" = accent-alt;
      "theme.osd.icon_container" = accent;
      "theme.osd.icon" = background;
      "theme.osd.label" = accent;
    };
  };
}
