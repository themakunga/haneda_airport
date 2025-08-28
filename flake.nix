{
  description = "Multi Host Nix and Nix-darwin config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    mac-app-util = {
      url = "github:hraban/mac-app-util";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { self, nixpkgs, darwin, sops-nix, nix-homebrew, mac-app-util, ...}@inputs:

  let
    supportedSystems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" ];

    forAllSystems  = nixpkgs.lib.genAttrs supportedSystems;

    common = import ./hosts/common.nix;
    userDefault = {
      enable = true;
      name = "nicolas";
      description = "Nicolas Martinez";

    };
    overlays = [
      (final: prev: {
        myDevShell = self.packages.${prev.system}.dev-shell;
        feedr = self.packages.${prev.system}.feedr;
      })
    ];

    mkNixosSystem = {system, host, user, hostname, extraModules ? []}:
      nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          (./hosts/linux + "/${host}.nix")
          sops-nix.nixosModules.sops
          {nixpkgs.overlays = overlays;}
          common
        ] ++ extraModules;
        specialArgs = {inherit inputs;};
      };

    mkDarwinSystem = {system, host, user, hostname, extraModules ? []}:
      darwin.lib.darwinSystem {
        inherit system;
        modules = [
          (./hosts/darwin + "/${host}.nix")
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
                enable = true;
                autoMigrate = true;
                user = user.name;
            };
          }
          sops-nix.darwinModules.sops
          ./modules/homebrew.nix
          mac-app-util.darwinModules.default
          {nixpkgs.overlays = overlays;}
          common
        ] ++ extraModules;
          specialArgs = { inherit inputs;};
      };
  in
  {
    nixosConfigurations = {
      mediacenter = mkNixosSystem {
        system = "x86_64-linux";
        host = "mediacenter";
      };
      homelab = mkNixosSystem {
        system = "x86_64-linux";
        host = "homelab";
      };
      steamMachile = mkNixosSystem {
        system = "x86_64-linux";
        host = "steamMachine";
      };
      rpi = mkNixosSystem {
        system = "aarch64-linux";
        host = "rpi";
        user = userDefault;
      };
      rpizero = mkNixosSystem {
        system = "aarch64-linux";
        host = "rpizero";
      };
    };

    darwinConfigurations = {
      kanagawa = mkDarwinSystem {
        system = "aarch64-darwin";
        host = "kanagawa";
        user = userDefault;
        hostname = {
            enable = true;
            name = "kanagawa";
          };
      };
      outer-heaven = mkDarwinSystem {
        system = "aarch64-darwin";
        host = "outer-heaven";
        hostname = {
            enable = true;
            name = "outer-heaven";
        };
        user = {
          name = "nicolas";
          description = "Nicolas Villarroel";
          enable = true;
        };
      };
    };

    packages = forAllSystems (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = overlays;
        };
      in {
        dev-shell = pkgs.callPackage ./modules/dev-shell.nix {};
        feedr = pkgs.callPackage ./packages/feedr.nix {};
      });
    devShells = forAllSystems (system: {
      default = self.packages.${system}.dev-shell;
    });

    apps = forAllSystems (system: {
        feedr = {
        type = "app";
        program = "${self.packages.${system}.feedr}/bin/feedr";
      };
      });
  };



}
