{ pkgs, ... }:
{
  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
    pinentryPackage = pkgs.pinentry-curses;
    extraConfig = ''
      allow-loopback-pinentry
    '';
  };
}
