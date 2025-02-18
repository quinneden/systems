{ lib, ... }:

with lib;
{
  options.theme =
    mkOption {
      type = types.attrs;
      default = { };
    }
    // {
      rounding = mkOption {
        type = types.int;
        default = null;
      };

      gapsIn = mkOption {
        type = types.int;
        default = null;
      };

      gapsOut = mkOption {
        type = types.int;
        default = cfg.gapsIn * 2;
      };

      activeOpacity = mkOption {
        type = types.numbers.between 0 1;
        default = 1;
      };

      inactiveOpacity = mkOption {
        type = types.numbers.between 0 1;
        default = null;
      };

      blur = mkOption {
        type = types.bool;
        default = null;
      };

      borderSize = mkOption {
        type = types.int;
        default = null;
      };

      animationSpeed = mkOption {
        type =
          with types;
          oneOf [
            (strMatching "fast")
            (strMatching "medium")
            (strMatching "slow")
          ];
        default = "medium";
      };

      fetch = mkOption {
        type =
          with types;
          oneOf [
            (strMatching "neofetch")
            (strMatching "nerdfetch")
            (strMatching "none")
            (strMatching "pfetch")
          ];
        default = "none";
      };

      bar = mkOption {
        type =
          with types;
          attrsOf (submodule {
            options = {
              position = mkOption { type = either (strMatching "top") (strMatching "bottom"); };
              transparent = mkOption { type = bool; };
              transparentButtons = mkOption { type = bool; };
              floating = mkOption { type = bool; };
            };
          });

        default = { };
      };
    };
}
