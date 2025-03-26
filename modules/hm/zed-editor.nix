{ config, lib, ... }:
let
  cfg = config.programs.zed-editor;
in

with lib;

{
  options.programs.zed-editor = {
    extraThemes = lib.mkOption {
      type = with types; nullOr (listOf (either str path));
      default = null;
    };
  };

  config = mkIf (cfg.enable && (cfg.extraThemes != null)) {
    home.file = listToAttrs (
      forEach cfg.extraThemes (
        theme:
        let
          baseName = builtins.baseNameOf theme;
          cleanName = match ".*/[a-z0-9]+-(.*)" baseName;
          fileName = if (cleanName != null) then (elemAt cleanName 0) else baseName;
        in
        {
          name = ".config/zed/themes/${fileName}";
          value = {
            source = theme;
          };
        }
      )
    );
  };
}
