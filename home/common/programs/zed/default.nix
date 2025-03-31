{
  pkgs,
  ...
}:
let
  pythonEnv = pkgs.python3.withPackages (
    ps: with ps; [
      beautifulsoup4
      boto3
      ipykernel
      ipython
      pip
      python-lsp-server
      requests
      rope
    ]
  );
in
{
  programs.zed-editor = {
    enable = true;
    extraPackages = with pkgs; [
      nixd
      nixfmt-rfc-style
      pythonEnv
      superhtml
      vscode-langservers-extracted
      marksman
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
      "marksman"
      "nix"
      "oh-lucy"
      "panda-theme"
      "pyslp"
      "superhtml"
      "swift"
      "symbols"
      "toml"
    ];

    userKeymaps.enable = false;
    userSettings.enable = false;
  };
}
