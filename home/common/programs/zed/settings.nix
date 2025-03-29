{
  assistant = {
    default_model = {
      model = "claude-3-5-sonnet";
      provider = "copilot_chat";
    };
    editor_model = {
      model = "claude-3-5-sonnet";
      provider = "copilot_chat";
    };
    version = "2";
  };
  auto_install_extensions = {
    git-firefly = true;
    nix = true;
    oh-lucy = true;
    panda-theme = true;
    pylsp = true;
    symbols = true;
    toml = true;
    xy-zed-theme = true;
  };
  auto_update = false;
  base_keymap = "VSCode";
  buffer_font_family = "CaskaydiaCove Nerd Font";
  buffer_font_size = 15.5;
  buffer_line_height = {
    custom = 1.6;
  };
  centered_layout = {
    left_padding = 0.2;
    right_padding = 0.2;
  };
  confirm_quit = true;
  current_line_highlight = "all";
  edit_predictions = {
    copilot = {
      proxy = null;
      proxy_no_verify = null;
    };
    disabled_globs = [ "secrets.yml,secrets.yaml" ];
    enabled_in_assistant = false;
    mode = "eager";
  };
  extend_comment_on_newline = false;
  features = {
    edit_prediction_provider = "zed";
  };
  git = {
    inline_blame = {
      delay_ms = 600;
      enabled = false;
    };
  };
  icon_theme = "Symbols";
  languages = {
    HTML = {
      formatter = {
        language_server = {
          name = "superhtml";
        };
      };
      language_servers = [
        "vscode-html-language-server"
        "superhtml"
      ];
    };
    JSON = {
      tab_size = 4;
    };
    Markdown = {
      language_servers = [ "marksman" ];
    };
    Nix = {
      language_servers = [ "nixd" ];
    };
    Python = {
      language_servers = [ "pylsp" ];
      tab_size = 4;
    };
    Rust = {
      tab_size = 4;
    };
  };
  load_direnv = "direct";
  lsp = {
    nixd = {
      initialization_options = {
        formatting = {
          command = [
            "nixfmt"
            "--quiet"
            "--"
          ];
        };
        options = {
          darwin = {
            expr = "(builtins.getFlake (\"git+file://\" + toString ./.)).darwinConfigurations.macmini-m4.options";
          };
          home-manager = {
            expr = "(builtins.getFlake (\"git+file://\" + toString ./.)).darwinConfigurations.macmini-m4.options.home-manager.users.type.getSubOptions";
          };
          nixos = {
            expr = "(builtins.getFlake (\"git+file://\" + toString ./.)).nixosConfigurations.macmini-m1.options";
          };
        };
      };
    };
  };
  private_files = [
    "**/.env*"
    "**/*.pem"
    "**/*.key"
    "**/*.cert"
    "**/*.crt"
    "**/secrets.y.*ml"
  ];
  project_panel = {
    auto_fold_dirs = false;
  };
  pylsp = {
    settings = {
      rope = {
        ropeFolder = null;
      };
    };
  };
  scroll_sensitivity = 1.3;
  tab_size = 2;
  tabs = {
    file_icons = false;
    git_status = true;
  };
  telemetry = {
    diagnostics = false;
    metrics = false;
  };
  terminal = {
    blinking = "on";
    cursor_shape = "bar";
    default_height = 760;
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
    dark = "Ayu Q";
    light = "Monolith Dark";
    mode = "dark";
  };
  ui_font_family = ".SystemUIFont";
  ui_font_size = 17;
  when_closing_with_no_tabs = "keep_window_open";
}
