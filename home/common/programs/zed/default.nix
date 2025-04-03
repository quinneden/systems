{ pkgs, ... }:
let
  pythonEnv = pkgs.python3.withPackages (
    ps: with ps; [
      beautifulsoup4
      boto3
      ipykernel
      ipython
      pip
      pylsp-rope
      python-lsp-server
      pyyaml
      requests
      rope
      venvShellHook
      yapf
    ]
  );
in
{
  programs.zed-editor = {
    enable = true;
    extraPackages = with pkgs; [
      markdown-oxide
      marksman
      nixd
      nixfmt-rfc-style
      pythonEnv
      superhtml
      vscode-langservers-extracted
    ];

    extraThemes = [
      ./themes/AyuQ.json
      ./themes/MonolithHighlighted.json
    ];

    extensions = [
      "basher"
      "dockerfile"
      "env"
      "git-firefly"
      "html"
      "ini"
      "justfile"
      "lua"
      "make"
      "markdown-oxide"
      "marksman"
      "nix"
      "oh-lucy"
      "panda-theme"
      "pylsp"
      "superhtml"
      "swift"
      "symbols"
      "toml"
    ];

    userKeymaps.enable = false;
    userSettings.enable = false;
  };
}
