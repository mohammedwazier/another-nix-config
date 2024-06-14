{
  description = "Masihkasar's darwin config";
  inputs = {
    # base imports
    utils.url = "github:numtide/flake-utils";

    # nixos/nix-darwin dependencies
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    # nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-22.11-darwin";
    # nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    # home-manager = {
    #   url = "github:nix-community/home-manager/release-22.11";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-24.05-darwin";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ self, darwin, nixpkgs-darwin, nixpkgs, home-manager, utils, ... }:
    let
      inherit (darwin.lib) darwinSystem;
      inherit (inputs.nixpkgs.lib)
        attrValues makeOverridable optionalAttrs singleton;

      defaultSystems = [ "x86_64-darwin" ];

      # Configuration for `nixpkgs`
      nixpkgsConfig = {
        config = { 
          allowUnfree = true;
          # Build x86 packages on Apple Silicon
          allowUnsupportedSystem = true;
          allowBroken = true;
        };
      };
    in {
      darwinConfigurations = rec {
        masihkasar = darwinSystem {
          system = "x86_64-darwin";
          modules = [
            # Main `nix-darwin` config
            ./darwin
            # `home-manager` module
            home-manager.darwinModules.home-manager
            ({ config, lib, pkgs, ... }:
              let primaryUser = "masihkasar";
              in {
                nixpkgs = nixpkgsConfig;
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                users.users.${primaryUser}.home = "/Users/${primaryUser}";
                home-manager.users.${primaryUser} = import ./home-manager;
              })
          ];
        };
      };

    };
}
