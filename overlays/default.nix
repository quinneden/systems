{ inputs, ... }:
{
  default =
    final: prev:
    (
      prev.lib.packagesFromDirectoryRecursive {
        callPackage = prev.lib.callPackageWith final;
        directory = ../pkgs/common;
      }
      // {
        pure-prompt = prev.pure-prompt.overrideAttrs {
          src = prev.fetchFromGitHub {
            owner = "quinneden";
            repo = "pure";
            rev = "refs/heads/nix3-shell-prompt";
            hash = "sha256-dv2neCnIGaIJm0ez9O9VORaDSJ4O9GAegwgo5G7rWeA=";
          };
        };

        neovim = inputs.nixvim.packages.${prev.system}.default;
      }
    );

  darwin =
    final: prev:
    (prev.lib.packagesFromDirectoryRecursive {
      callPackage = prev.lib.callPackageWith final;
      directory = ../pkgs/darwin;
    });

  linux =
    final: prev:
    (
      prev.lib.packagesFromDirectoryRecursive {
        callPackage = prev.lib.callPackageWith final;
        directory = ../pkgs/linux;
      }
      // {
        base16-schemes = prev.base16-schemes.overrideAttrs {
          version = "spec-0.11";
          src = prev.fetchFromGitHub {
            owner = "tinted-theming";
            repo = "schemes";
            rev = "refs/heads/spec-0.11";
            hash = "sha256-sR4K+OVFKeUOvNIqcCr5Br7NLxOBEwoAgsIyjsZmb8s=";
          };
        };
      }
    );
}
