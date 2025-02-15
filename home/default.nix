{
  inputs,
  pkgs,
  platform,
  ...
}:
{
  imports = [
    ../modules/hm
    ./${platform}
    ./common
    inputs.sops-nix.homeManagerModules.sops
  ];

  home = {
    file = {
      ".hushlogin".text = "";
      # "rclone.conf" = {
      #   source = "${config.sops.secrets."plain/rclone.ini".path}";
      #   target = "${config.xdg.configHome}/rclone/rclone.conf";
      # };
    };

    stateVersion = "25.05";

    packages =
      (with pkgs.nix-shell-scripts; [
        a2dl
        alphabetize
        cfg
        clone
        colortable
        commit
        cop
        del
        diskusage
        mi
        nish
        nix-clean
        nixhash
        nixos-deploy
        readme
        rm-result
        swatch
      ])
      ++ (with pkgs; [
        cachix
        eza
        gawk
        gnutar
        nil
        nix-fast-build
        nix-prefetch-git
        nix-prefetch-github
        nixd
        nixfmt-rfc-style
        qemu
        zoxide
      ]);
  };

  programs.home-manager.enable = true;
}
