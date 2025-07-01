{
  description = "first flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, stylix, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      userSettings = rec {
        username = "titor";
        theme = "HollowPurple";
        wm = "hyprland";
        term = "kitty";
        font = "Intel One Mono";
      };
    in
  {
    homeConfigurations = {
      titor = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./hosts/BigBoy/home.nix
        ];
        extraSpecialArgs = {
          inherit userSettings;
          inherit inputs;
        };
      };
    };

    nixosConfigurations = {
      BigBoy = lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/BigBoy/configuration.nix
#          stylix.nixosModules.stylix
          ./system/stylix/stylix.nix
        ];
        specialArgs = {
          inherit userSettings;
          inherit inputs;
        };
      };
    };
  };
}
