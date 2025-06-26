{

  description = "first flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      BigBoy = lib.nixosSystem {
        inherit system;
        modules = [ ./hosts/BigBoy/configuration.nix ];
      };
    };

    homeConfigurations = {
      titor = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/BigBoy/home.nix ];
      };
    };
  };

}
