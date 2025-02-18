{
  config,
  inputs,
  lib,
  pkgs,
  self,
  ...
}:
{
  imports = (lib.custom.scanPaths ./.) ++ [
    ../common
    inputs.nixos-apple-silicon.nixosModules.default
    inputs.stylix.nixosModules.stylix
  ];

  console.keyMap = config.var.keyboardLayout;

  environment.variables = {
    XDG_DATA_HOME = "$HOME/.local/share";
    EDITOR = "micro";
  };

  theme = rec {
    rounding = 12;
    gaps-in = 4;
    gaps-out = gaps-in * 1.5;
    active-opacity = 1;
    inactive-opacity = 0.96;
    blur = true;
    border-size = 2;
    animation-speed = "medium"; # "fast" | "medium" | "slow"
    fetch = "neofetch"; # "nerdfetch" | "neofetch" | "pfetch" | "none"
    bar = {
      position = "top";
      transparent = true;
      transparentButtons = false;
      floating = true;
    };
  };

  users = {
    defaultUserShell = pkgs.zsh;
    users.quinn = {
      description = "Quinn Edenfield";
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJyLtibXqcDXRQ8DzDUbVw71YA+k+L7fH7H3oPYyjFII"
      ];
    };
    users.root.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJyLtibXqcDXRQ8DzDUbVw71YA+k+L7fH7H3oPYyjFII"
    ];
  };

  nix.settings = {
    extra-substituters = [
      "https://hyprland.cachix.org"
    ];
    extra-trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  nixpkgs.overlays = [
    inputs.hyprpanel.overlay
    inputs.nh.overlays.default
    self.overlays.darwin
  ];

  security.sudo.wheelNeedsPassword = false;
  system.stateVersion = "25.05";

  time.timeZone = config.var.timeZone;
  i18n.defaultLocale = config.var.defaultLocale;

  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };
}
