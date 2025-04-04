{ pkgs, ... }:
let
  pythonEnv = pkgs.python3.withPackages (
    ps: with ps; [
      beautifulsoup4
      boto3
      colorama
      ipykernel
      ipython
      jedi
      pip
      pycodestyle
      pyflakes
      pytest
      pyyaml
      requests
      rope
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
    ];

    extraThemes = [
      ./themes/AyuQ.json
      ./themes/MonolithHighlighted.json
    ];

    # extensions = [
    #   "basher"
    #   "dockerfile"
    #   "env"
    #   "git-firefly"
    #   "html"
    #   "ini"
    #   "justfile"
    #   "lua"
    #   "make"
    #   "markdown-oxide"
    #   "marksman"
    #   "nix"
    #   "oh-lucy"
    #   "panda-theme"
    #   "pylsp"
    #   "superhtml"
    #   "swift"
    #   "symbols"
    #   "toml"
    # ];
  };
}
