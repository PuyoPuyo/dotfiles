# home.nix
# home-manager switch 

{ config, pkgs, ... }:

{
  imports = [
    ../modules/cli/zsh/default.nix
  ];

  home.username = "simeon.tsatskin";
  home.homeDirectory = "/Users/simeon.tsatskin";
  home.stateVersion = "24.05"; # Please read the comment before changing.

# Makes sense for user specific applications that shouldn't be available system-wide
  home.packages = [
  ];

  # Home Manager is pretty good at managing .config. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # ".zshrc".source = ~/dotfiles/zsh/.zshrc;
    ".config/starship".source = ~/dotfiles/starship;
    ".config/nvim".source = ~/dotfiles/nvim;
    ".config/nix-darwin".source = ~/dotfiles/nix/nix-darwin;
    ".config/tmux".source = ~/dotfiles/tmux;
    ".config/karabiner".source = ~/dotfiles/karabiner;
    ".config/atuin".source = ~/dotfiles/atuin;
    ".config/aerospace".source = ~/dotfiles/aerospace;
    ".config/sketchybar".source = ~/dotfiles/sketchybar;
  };

  home.sessionVariables = {
  };

  home.sessionPath = [
    "/run/current-system/sw/bin"
      "$HOME/.nix-profile/bin"
  ];
  programs.home-manager.enable = true;
  programs.neovim.vimAlias = true;
  programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML ~/dotfiles/starship/starship.toml; 
  };
}
