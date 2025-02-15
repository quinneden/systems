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
            hash = "sha256-y5s/qBZWLKNMnrbN7qGXNJD87yuMtw2EuvrLVvX9qmI=";
          };
        };
      }
    );

  darwin =
    final: prev:
    (
      prev.lib.packagesFromDirectoryRecursive {
        callPackage = prev.lib.callPackageWith final;
        directory = ../pkgs/common;
      }
      // {
        qemu = prev.qemu.overrideAttrs {
          patches = prev.qemu.patches ++ [
            (prev.fetchpatch {
              url = "https://raw.githubusercontent.com/utmapp/UTM/acbf2ba8cd91f382a5e163c49459406af0b462b7/patches/qemu-9.1.0-utm.patch";
              sha256 = "sha256-S7DJSFD7EAzNxyQvePAo5ZZyanFrwQqQ6f2/hJkTJGA=";
            })
          ];
        };
      }
    );

  linux = final: prev: { };
}
