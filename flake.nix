{
  description = "Masihkasar's darwin config";
  inputs = {
    # base imports
    utils.url = "github:numtide/flake-utils";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-darwin.url = "flake:nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "flake:home-manager";
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
      nixpkgs.hostPlatform = "x86_64-darwin";

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
      nix.settings.experimental-features = [ "nix-command flakes" ];
      nix.linux-builder.enable = true;

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
