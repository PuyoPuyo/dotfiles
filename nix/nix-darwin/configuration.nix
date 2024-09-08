{ pkgs, ... }: 
{
  environment.systemPackages = with pkgs; [
    zsh
    vim
    neovim
    tmux
    ripgrep
    fzf
    starship
    zoxide
    bat
    jq
    atuin
    maccy
    radare2
	sketchybar
  ];
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

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
    NSGlobalDomain."com.apple.mouse.tapBehavior" = 1; 
    NSGlobalDomain.AppleInterfaceStyle = "Dark";
  };

  services.sketchybar.enable = true;

  homebrew.enable = true;
  homebrew.casks = [
    "wireshark"
    "nikitabobko/tap/aerospace"
  ];
}
