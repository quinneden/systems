{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = (lib.custom.scanPaths ./.) ++ (with inputs; [ mac-app-util.homeManagerModules.default ]);

  home.packages =
    with pkgs;
    # let
    #   pythonEnv = pkgs.python3.withPackages (
    #     ps: with ps; [
    #       beautifulsoup4
    #       boto3
    #       colorama
    #       ipykernel
    #       ipython
    #       jedi
    #       pip
    #       pycodestyle
    #       pyflakes
    #       pytest
    #       pyyaml
    #       requests
    #       rope
    #       yapf
    #     ]
    #   );
    # in
    [
      markdown-oxide
      marksman
      nixd
      nixfmt-rfc-style
      # pythonEnv
      superhtml
      vesktop
    ];
}
