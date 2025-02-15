{
  programs.nh = {
    enable = true;
    flake = "/Users/quinn/.dotfiles";
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d";
  };
}
