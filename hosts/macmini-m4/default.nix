{
  inputs,
  lib,
  pkgs,
  self,
  ...
}:
{
  imports = (lib.custom.scanPaths ./.) ++ [
    ../common
    inputs.mac-app-util.darwinModules.default
  ];

  users.users.quinn = {
    description = "Quinn Edenfield";
    home = "/Users/quinn";
    shell = pkgs.zsh;
  };

  nix.daemonProcessType = "Adaptive";

  nixpkgs.overlays = [
    inputs.nh.overlays.default
    self.overlays.darwin
  ];

  security.pam.services.sudo_local.touchIdAuth = true;
}
