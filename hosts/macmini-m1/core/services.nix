{ config, pkgs, ... }:
{
  services = {
    gnome.gnome-keyring.enable = true;

    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --asterisks --container-padding 2 --time --time-format '%I:%M %p | %a • %h | %F' --cmd Hyprland";
          user = "greeter";
        };
      };
    };

    xserver = {
      enable = true;
      xkb.layout = config.var.keyboardLayout;
      xkb.variant = "";
    };

    dbus.enable = true;
    gvfs.enable = true;
    libinput.enable = true;
    upower.enable = true;
    udisks2.enable = true;

    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };

    logind.extraConfig = ''
      # don’t shutdown when power button is short-pressed
      HandlePowerKey=ignore
    '';
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };

  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";

}
