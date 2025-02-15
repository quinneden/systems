{
  inputs,
  lib,
  pkgs,
  ...
}:
let
  inherit (pkgs.stdenv) isDarwin;

  vscodiumDummy =
    pkgs.runCommand "vscodium-dummy"
      {
        inherit (pkgs.vscodium)
          passthru
          pname
          version
          meta
          ;
      }
      ''
        mkdir -p "$out/bin"
        echo "true" > "$out/bin/codium"
        chmod +x "$out/bin/codium"
      '';
in
{
  programs.vscode = {
    enable = true;
    package = if isDarwin then vscodiumDummy else pkgs.vscodium;

    extensions = import ./extensions.nix { inherit inputs pkgs; };
    keybindings = import ./keybindings.nix { inherit lib pkgs; };
    userSettings = import ./settings.nix { inherit lib pkgs; };
  };
}
