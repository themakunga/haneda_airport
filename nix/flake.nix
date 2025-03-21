{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    # nvf.url = "github:notashelf/nvf";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nix-darwin,
    nixpkgs,
    mac-app-util,
    nix-homebrew,
    # nvf,
    home-manager,
  }: {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations.kanagawa = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        mac-app-util.darwinModules.default
        ./modules/darwin
        ./modules/homebrew
        ./modules/home-manager
        ./modules/stow
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            user = "nicolas";
            autoMigrate = true;
          };
        }
        # nvf.nixosModules.default
        # ./modules/nvf
        home-manager.darwinModules.home-manager
      ];
    };
  };
}
