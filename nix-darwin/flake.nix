{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
	home-manager = {
		url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows =  "nixpkgs";
	};
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager}:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
      [ 
	  pkgs.vim
	  pkgs.neovim
	  pkgs.tmux
	  pkgs.ripgrep
	  pkgs.fzf
	  pkgs.starship
	  pkgs.zoxide
	  pkgs.bat
	  pkgs.jq
	  pkgs.atuin
	  pkgs.stow
	  pkgs.maccy
      ];

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 4;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
      system.defaults = {
        dock.autohide = true;
        dock.mru-spaces = true;
        loginwindow.LoginwindowText = "Work Laptop";
        screencapture.location = "~/Pictures/screenshots";
        screensaver.askForPasswordDelay = 10;
      };

	  homebrew.enable = true;
	  homebrew.casks = [
	  	"wireshark"
        "nikitabobko/tap/aerospace"
	  ];
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#TLV-M-SimeonT
    darwinConfigurations."TLV-M-SimeonT" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration 
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.simeon = import ./home.nix;
        }
		];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."TLV-M-SimeonT".pkgs;
  };
}
