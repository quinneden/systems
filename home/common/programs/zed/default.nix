{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    extraPackages = with pkgs; [
      nil
      nixd
      nixfmt-rfc-style
      python3Packages.black
      python3Packages.python-lsp-server
      python3Packages.ipykernel
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
