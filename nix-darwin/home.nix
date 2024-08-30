# home.nix
# home-manager switch 

{ config, pkgs, ... }:

{
  home.username = "simeon.tsatskin";
  home.homeDirectory = "/Users/simeon.tsatskin";
  home.stateVersion = "24.05"; # Please read the comment before changing.

# Makes sense for user specific applications that shouldn't be available system-wide
  home.packages = [
  ];

  # Home Manager is pretty good at managing .config. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".zshrc".source = ~/.config/zshrc/;
    ".config/starship".source = ~/.config/starship;
    ".config/nvim".source = ~/.config/nvim;
    ".config/nix".source = ~/.config/nix;
    ".config/nix-darwin".source = ~/.config/nix-darwin;
    ".config/tmux".source = ~/.config/tmux;
    ".config/karabiner".source = ~/.config/karabiner;
    ".config/atuin".source = ~/.config/atuin;
    ".config/aerospace".source = ~/.config/aerospace;
  };

  home.sessionVariables = {
  };

  home.sessionPath = [
    "/run/current-system/sw/bin"
      "$HOME/.nix-profile/bin"
  ];
  programs.home-manager.enable = true;
  programs.neovim.vimAlias = true;
  programs.zsh = {
    enable = true;
    initExtra = ''
      # Add any additional configurations here
      export PATH=/run/current-system/sw/bin:$HOME/.nix-profile/bin:$PATH
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi
    '';
  };
}
