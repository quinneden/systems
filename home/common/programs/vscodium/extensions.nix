{
  inputs,
  pkgs,
}:
let
  inherit (inputs.nix-vscode-extensions.extensions.${pkgs.system})
    vscode-marketplace
    vscode-marketplace-release
    open-vsx
    ;

  marketplace = with vscode-marketplace; [
    astro-build.astro-vscode
    hermitter.oh-lucy-vscode
    jnoortheen.nix-ide
    miguelsolorio.symbols
    ms-python.black-formatter
    ms-python.python
    shd101wyy.markdown-preview-enhanced
    timonwong.shellcheck
    tinkertrain.theme-panda
    vue.volar
    tintedtheming.base16-tinted-themes
  ];

  marketplace-release = with vscode-marketplace-release; [
    github.copilot
    github.copilot-chat
  ];

  openvsx = (
    with open-vsx;
    [
      jeanp413.open-remote-ssh
    ]
  );
in
# ++ (with open-vsx."3timeslazy"; [ vscodium-devpodcontainers ]);
[ ] ++ marketplace ++ marketplace-release ++ openvsx
