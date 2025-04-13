{ lib, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    bind =
      [
        "$mod,B, exec, zen"
        "$mod,down, movefocus, d"
        "$mod,E, exec, ${pkgs.xfce.thunar}/bin/thunar"
        "$mod,ESCAPE, exec, powermenu"
        "$mod,F, fullscreen"
        "$mod,F2, exec, night-shift"
        "$mod,left, movefocus, l"
        "$mod,Q, killactive,"
        "$mod,R, exec, menu"
        "$mod,RETURN, exec, ${pkgs.kitty}/bin/kitty"
        "$mod,right, movefocus, r"
        "$mod,T, togglefloating,"
        "$mod,up, movefocus, u"
        "$modShift,C, exec, clipboard"
        "$modShift,L, exec, ${pkgs.hyprlock}/bin/hyprlock"
        "$modShift,M, exec, hyprpanel-toggle"
        "$modShift,S, exec, query=$(wofi --dmenu -eL1); [[ -n $query ]] && zen --search \"$query\""
      ]
      ++ lib.concatLists (
        map (
          i:
          let
            ws = i + 1;
          in
          [
            "$mod SHIFT,code:1${toString i}, movetoworkspace, ${toString ws}"
            "$mod,code:1${toString i}, workspace, ${toString ws}"
          ]
        ) (lib.range 0 9)
      );

    bindm = [
      "$mod,mouse:272, movewindow"
      "$modShift,R, resizewindow"
    ];

    bindl = [
      ",XF86AudioMute, exec, sound-toggle"
      ",XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next"
      ",XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
      ",XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous"
    ];

    bindle = [
      ",XF86AudioRaiseVolume, exec, sound-up"
      ",XF86AudioLowerVolume, exec, sound-down"
      ",XF86MonBrightnessUp, exec, brightness-up"
      ",XF86MonBrightnessDown, exec, brightness-down"
    ];

  };
}
