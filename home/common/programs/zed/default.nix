{ pkgs, ... }:
# let
#   zedDummy =
#     with pkgs;
#     stdenv.mkDerivation {
#       inherit (zed-editor) pname version;
#
#       buildCommand = ''
#         mkdir -p $out/bin
#         cat > $out/bin/zeditor <<EOF
#         if [[ -f /Applications/Zed.app/Contents/MacOS/cli ]]; then
#           exec /Applications/Zed.app/Contents/MacOS/cli
#         else
#           echo "This is a dummy executable"
#           exit 0
#         fi
#         EOF
#         chmod +x 755 $out/bin/zeditor
#       '';
#
#       meta.mainProgram = "zeditor";
#     };
# in
{
  programs.zed-editor = {
    enable = pkgs.stdenv.isLinux;

    extraPackages = with pkgs; [
      nil
      nixd
      nixfmt-rfc-style
      python3
      python3Packages.black
      python3Packages.python-lsp-server
    ];

    extraThemes = [
      ./themes/monospace-theme.json
    ];

    extensions = [
      "git-firefly"
      "toml"
      "xy-zed-theme"
      "symbols"
      "nix"
      "oh-lucy"
      "panda-theme"
      "pylsp"
    ];

    userKeymaps = import ./keymap.nix;
    userSettings = import ./settings.nix;
  };
}
