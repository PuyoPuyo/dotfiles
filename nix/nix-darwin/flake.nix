{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
        url = "github:LnL7/nix-darwin";
        inputs.nixpkgs.follows = "nixpkgs";
	};
	home-manager = {
		url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows =  "nixpkgs";
	};
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager}:
  let
    
  in 
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#TLV-M-SimeonT
    darwinConfigurations."TLV-M-SimeonT" = nix-darwin.lib.darwinSystem {
      specialArgs = inputs;
      modules = [ 
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
		  users.users."simeon.tsatskin" = {
		    name = "simeon.tsatskin";
		    home = "/Users/simeon.tsatskin";
		  };
          home-manager.users."simeon.tsatskin" = import ../home-manager/default.nix;
        }
        ./configuration.nix
		];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."TLV-M-SimeonT".pkgs;
  };
}
