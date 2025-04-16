# So best window tiling manager
{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
let
  inherit (config.theme)
    active-opacity
    blur
    border-size
    gaps-in
    gaps-out
    inactive-opacity
    rounding
    ;

  inherit (config.var) keyboardLayout;
in
{
  imports = (lib.custom.scanPaths ./.) ++ [ inputs.hyprcursor-phinger.homeManagerModules.default ];

  programs.hyprcursor-phinger.enable = true;

  home.packages = with pkgs; [
    ags
    astal.astal3
    astal.astal4
    astal.io
    brightnessctl
    dconf
    glib
    gnome-themes-extra
    hyprpicker
    hyprpolkitagent
    hyprshot
    imv
    libsForQt5.qt5ct
    libgtop
    libva
    meson
    playerctl
    qt5.qtwayland
    qt6.qtwayland
    qt6ct
    swappy
    wayland-protocols
    wayland-utils
    wf-recorder
    wl-clipboard
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.variables = [ "all" ];
    package = null;
    portalPackage = null;

    settings = {
      "$mod" = "SUPER";
      "$modShift" = "SUPER_SHIFT";

      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user start hyprpolkitagent"
      ];

      monitor = [
        "HDMI-A-1,2560x1440@144,auto,1"
        # ",prefered,auto,1"
      ];

      env = [
        "ANKI_WAYLAND,1"
        "AQ_DRM_DEVICES,/dev/dri/card1:/dev/dri/card0"
        "CLUTTER_BACKEND,wayland"
        "DIRENV_LOG_FORMAT,"
        "DISABLE_QT5_COMPAT,0"
        "DISABLE_QT5_COMPAT,0"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "GSK_RENDERER,vulkan"
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
        # border_part_of_window = true;
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
        disable_autoreload = false;
        focus_on_activate = true;
        new_window_takes_over_fullscreen = 2;
      };

      render = {
        explicit_sync = 0;
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
        sensitivity = 0.2;
        repeat_delay = 250;
        repeat_rate = 45;
        numlock_by_default = true;

        touchpad = {
          disable_while_typing = false;
          natural_scroll = true;
          clickfinger_behavior = true;
        };
      };

    };
  };
  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
}
