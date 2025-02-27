{
  description = "NixOS(-Apple-Silicon) and Nix-darwin configurations.";

  outputs =
    inputs@{
      nix-darwin,
      nixpkgs,
      self,
      ...
    }:
    let
      forEachSystem =
        f:
        inputs.nixpkgs.lib.genAttrs
          [
            "aarch64-darwin"
            "aarch64-linux"
          ]
          (
            system:
            f {
              pkgs = import nixpkgs {
                inherit system;
                overlays = [ self.overlays.default ];
              };
            }
          );

      lib = nixpkgs.lib.extend (self: super: { custom = import ./lib { inherit (nixpkgs) lib; }; });
    in
    {
      darwinConfigurations = {
        macmini-m4 = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = {
            inherit inputs lib self;
            platform = "darwin";
          };
          modules = [ ./hosts/macmini-m4 ];
        };
      };

      formatter = forEachSystem ({ pkgs }: pkgs.nixfmt-rfc-style);

      nixosConfigurations = {
        macmini-m1 = lib.nixosSystem {
          system = "aarch64-linux";
          specialArgs = {
            inherit inputs lib self;
            platform = "nixos";
          };
          modules = [ ./hosts/macmini-m1 ];
        };
      };

      overlays = import ./overlays { inherit inputs; };
    };

  inputs = {
    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprcursor-phinger.url = "github:jappie3/hyprcursor-phinger";
    hyprland.url = "github:hyprwm/hyprland";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    hyprpolkitagent.url = "github:hyprwm/hyprpolkitagent";

    lix = {
      url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
      flake = false;
    };

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.lix.follows = "lix";
    };

    mac-app-util.url = "github:hraban/mac-app-util";
    nh.url = "github:viperml/nh";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-rosetta-builder = {
      url = "github:quinneden/nix-rosetta-builder?ref=opinionated";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nixd.url = "github:nix-community/nixd";

    nixos-apple-silicon = {
      url = "github:tpwrules/nixos-apple-silicon";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixvim.url = "github:quinneden/nixvim";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    secrets = {
      url = "git+ssh://git@github.com/quinneden/secrets.git?ref=main&shallow=1";
      inputs = { };
    };

    shellpers.url = "github:quinneden/shellpers?ref=dev";

    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
    zen-browser.url = "github:quinneden/zen-browser-flake";
  };
}
