# Original: https://github.com/nix-community/home-manager/blob/master/modules/programs/zed-editor.nix
# Modified so that settings.json and keymaps.json aren't managed by home-manager.
{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.programs.zed-editor;
  jsonFormat = pkgs.formats.json { };

  mergedSettings =
    cfg.userSettings
    // (lib.optionalAttrs (builtins.length cfg.extensions > 0) {
      # this part by @cmacrae
      auto_install_extensions = lib.genAttrs cfg.extensions (_: true);
    });
in
{
  disabledModules = [ "programs/zed-editor.nix" ];

  options = {
    # TODO: add vscode option parity (installing extensions, configuring
    # keybinds with nix etc.)
    programs.zed-editor = {
      enable = mkEnableOption "Zed, the high performance, multiplayer code editor from the creators of Atom and Tree-sitter";

      package = mkPackageOption pkgs "zed-editor" { };

      extraPackages = mkOption {
        type = with types; listOf package;
        default = [ ];
        example = literalExpression "[ pkgs.nixd ]";
        description = "Extra packages available to Zed.";
      };

      extraThemes = lib.mkOption {
        type = with types; nullOr (listOf (either str path));
        default = null;
      };

      userSettings =
        {
          enable = mkEnableOption "Enable management of settings.";
        }
        // mkOption {
          type = jsonFormat.type;
          default = { };
          example = literalExpression ''
            {
              features = {
                copilot = false;
              };
              telemetry = {
                metrics = false;
              };
              vim_mode = false;
              ui_font_size = 16;
              buffer_font_size = 16;
            }
          '';
          description = ''
            Configuration written to Zed's {file}`settings.json`.
          '';
        };

      userKeymaps =
        {
          enable = mkEnableOption "Enable management of keymaps.";
        }
        // mkOption {
          type = jsonFormat.type;
          default = { };
          example = literalExpression ''
            [
              {
                context = "Workspace";
                bindings = {
                  ctrl-shift-t = "workspace::NewTerminal";
                };
              };
            ]
          '';
          description = ''
            Configuration written to Zed's {file}`keymap.json`.
          '';
        };

      extensions = mkOption {
        type = types.listOf types.str;
        default = [ ];
        example = literalExpression ''
          [ "swift" "nix" "xy-zed" ]
        '';
        description = ''
          A list of the extensions Zed should install on startup.
          Use the name of a repository in the [extension list](https://github.com/zed-industries/extensions/tree/main/extensions).
        '';
      };

      installRemoteServer = mkOption {
        type = types.bool;
        default = false;
        example = true;
        description = ''
          Whether to symlink the Zed's remote server binary to the expected
          location. This allows remotely connecting to this system from a
          distant Zed client.

          For more information, consult the
          ["Remote Server" section](https://wiki.nixos.org/wiki/Zed#Remote_Server)
          in the wiki.
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages =
      if cfg.extraPackages != [ ] then
        [
          (pkgs.symlinkJoin {
            name = "${lib.getName cfg.package}-wrapped-${lib.getVersion cfg.package}";
            paths = [ cfg.package ];
            preferLocalBuild = true;
            nativeBuildInputs = [ pkgs.makeWrapper ];
            postBuild = ''
              wrapProgram $out/bin/zeditor \
                --suffix PATH : ${lib.makeBinPath cfg.extraPackages}
            '';
          })
        ]
      else
        [ cfg.package ];

    home.file =
      mkIf (cfg.installRemoteServer && (cfg.package ? remote_server)) (
        let
          inherit (cfg.package) version remote_server;
          binaryName = "zed-remote-server-stable-${version}";
        in
        {
          ".zed_server/${binaryName}".source = lib.getExe' remote_server binaryName;
        }
      )
      // mkIf (cfg.extraThemes != null) (
        listToAttrs (
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
        )
      );

    xdg.configFile."zed/settings.json" = (
      mkIf (cfg.userSettings.enable && (mergedSettings != { })) {
        source = jsonFormat.generate "zed-user-settings" mergedSettings;
      }
    );

    xdg.configFile."zed/keymap.json" = (
      mkIf (cfg.userKeymaps.enable && (cfg.userKeymaps != { })) {
        source = jsonFormat.generate "zed-user-keymaps" cfg.userKeymaps;
      }
    );
  };
}
