{
  description = "squish's first ever special snowflake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   };
  };

  # remember to add `home-manager` to this list if you start using it
  outputs = { self, nixpkgs, ... }:

  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
  in

    {

    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
      };
    };

    # homeConfigurations = {
    #   squish = home-manager.lib.homeManagerConfiguration {
    #     inherit system;
    #     modules = [ ./home.nix ];
    #   };
    # };

  };

}
