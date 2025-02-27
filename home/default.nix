{
  inputs,
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

  programs.home-manager.enable = true;
}
