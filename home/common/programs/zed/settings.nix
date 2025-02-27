{
  assistant = {
    default_model = {
      model = "o3-mini";
      provider = "copilot_chat";
    };
  };

  base_keymap = "VSCode";
  buffer_font_family = "CaskaydiaCove Nerd Font";
  buffer_font_size = 15.5;
  buffer_line_height = {
    custom = 1.6;
  };

  features = {
    edit_prediction_provider = "copilot";
  };

  git = {
    inline_blame = {
      delay_ms = 600;
      enabled = false;
    };
  };

  icon_theme = "Symbols";

  languages = {
    Nix = {
      language_servers = [
        "nixd"
        "!nil"
      ];
    };
  };

  load_direnv = "direct";

  lsp = {
    nil = {
      initialization_options = {
        formatting = {
          command = [
            "nixfmt"
            "--quiet"
            "--"
          ];
        };
      };
      settings = {
        nix = {
          flake = {
            autoArchive = true;
          };
        };
      };
    };

    nixd = {
      initialization_options = {
        formatting = {
          command = [
            "nixfmt"
            "--quiet"
            "--"
          ];
        };
      };
    };
  };

  project_panel = {
    auto_fold_dirs = false;
  };

  tab_size = 2;

  telemetry = {
    diagnostics = false;
    metrics = false;
  };

  terminal = {
    blinking = "on";
    cursor_shape = "bar";
    default_height = 420;
    default_width = 640;
    detect_venv = {
      on = {
        activate_script = "default";
        directories = [
          ".env"
          "env"
          ".venv"
          "venv"
        ];
      };
    };

    dock = "bottom";

    font_family = "CaskaydiaCove Nerd Font Mono";
    font_size = 15;

    line_height = "comfortable";

    max_scroll_history_lines = 1000;

    scrollbar = {
      show = "never";
    };

    shell = "system";

    toolbar = {
      breadcrumbs = false;
    };
  };

  theme = {
    dark = "Monolith Dark";
    mode = "dark";
  };

  ui_font_family = ".SystemUIFont";
  ui_font_size = 16.5;
}
