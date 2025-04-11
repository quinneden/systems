# So best window tiling manager
{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
let
  border-size = config.theme.border-size;
  gaps-in = config.theme.gaps-in;
  gaps-out = config.theme.gaps-out;
  active-opacity = config.theme.active-opacity;
  inactive-opacity = config.theme.inactive-opacity;
  rounding = config.theme.rounding;
  blur = config.theme.blur;
  keyboardLayout = config.var.keyboardLayout;
in
{

  # imports = (lib.custom.scanPaths ./.) ++ [ inputs.hyprcursor-phinger.homeManagerModules.default ];
  imports = [
    ./animations.nix
    ./bindings.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpanel.nix
    ./hyprpaper.nix
    ./polkitagent.nix
    inputs.hyprcursor-phinger.homeManagerModules.default
  ];

  programs.hyprcursor-phinger.enable = true;

  home.packages = with pkgs; [
    qt5.qtwayland
    qt6.qtwayland
    libsForQt5.qt5ct
    qt6ct
    hyprshot
    hyprpicker
    swappy
    imv
    wf-recorder
    wlr-randr
    wl-clipboard
    brightnessctl
    gnome-themes-extra
    libva
    dconf
    wayland-utils
    wayland-protocols
    glib
    direnv
    meson
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;

    settings = {
      "$mod" = "SUPER";
      "$shiftMod" = "SUPER_SHIFT";

      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];

      monitor = [
        "HDMI-A-1,2560x1440@144,auto,1"
        ",prefered,auto,1"
      ];

      env = [
        "ANKI_WAYLAND,1"
        "AQ_DRM_DEVICES,/dev/dri/card1:/dev/dri/card0"
        "CLUTTER_BACKEND,wayland"
        "DIRENV_LOG_FORMAT,"
        "DISABLE_QT5_COMPAT,0"
        "DISABLE_QT5_COMPAT,0"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "GSK_RENDERER,ngl"
        "GDK_BACKEND,wayland"
        "MOZ_ENABLE_WAYLAND,1"
        "NIXOS_OZONE_WL,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM=wayland,xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "SDL_VIDEODRIVER,wayland"
        "WLR_BACKEND,vulkan"
        "WLR_DRM_NO_ATOMIC,1"
        "WLR_NO_HARDWARE_CURSORS,1"
        "WLR_RENDERER,vulkan"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_TYPE,wayland"
      ];

      cursor = {
        no_hardware_cursors = true;
        default_monitor = "HDMI-A-1";
      };

      general = {
        resize_on_border = true;
        gaps_in = gaps-in;
        gaps_out = gaps-out;
        border_size = border-size;
        border_part_of_window = true;
        layout = "master";
      };

      decoration = {
        active_opacity = active-opacity;
        inactive_opacity = inactive-opacity;
        rounding = rounding;
        shadow = {
          enabled = true;
          range = 20;
          render_power = 3;
        };
        blur = {
          enabled = if blur then "true" else "false";
        };
      };

      master = {
        new_status = true;
        allow_small_split = true;
        mfact = 0.5;
      };

      gestures = {
        workspace_swipe = true;
      };

      misc = {
        vfr = true;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        disable_autoreload = true;
        focus_on_activate = true;
        new_window_takes_over_fullscreen = 2;
      };

      windowrulev2 = [
        "float, tag:modal"
        "pin, tag:modal"
        "center, tag:modal"
      ];

      layerrule = [
        "noanim, launcher"
        "noanim, ^ags-.*"
      ];

      input = {
        kb_layout = keyboardLayout;

        kb_options = "caps:escape";
        follow_mouse = 1;
        sensitivity = 0.3;
        repeat_delay = 300;
        repeat_rate = 50;
        numlock_by_default = true;

        touchpad = {
          natural_scroll = true;
          clickfinger_behavior = true;
        };
      };

    };
  };
  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
}
