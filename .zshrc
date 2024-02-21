# Starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Default editor nvim
export EDITOR=/opt/homebrew/bin/nvim

path+=('/Library/Developer/CommandLineTools/usr/bin/sourcekit-lsp')
export PATH

export TOOLCHAIN_PATH=/Library/Developer/Toolchains/swift-5.9.2-RELEASE.xctoolchain

# Init zoxide
eval "$(zoxide init zsh)"

# Add ssh keys to keychain
eval "$(ssh-add --apple-use-keychain ~/.ssh/id_ed25519)"

# Aliases
alias startmtn="shortcuts run 'Start My Next Meeting'"
alias v=nvim
alias ll="ls -la" 
alias lm="ls -lma"
alias cls="clear"
alias md="mkdir"
alias fzfp="fzf --preview cat" 


# https://github.com/Homebrew/brew/issues/3933#issuecomment-373771217
# Script used for maintaining an up to date Brewfile for configfiles
newbrew() {
  local dump_commands=('install' 'uninstall') # Include all commands that should do a brew dump
  local main_command="${1}"

  brew ${@}

  for command in "${dump_commands[@]}"; do
    [[ "${command}" == "${main_command}" ]] && brew bundle dump --file="${HOME}/.Brewfile" --force
done
}

eval "$(~/.local/bin/mise activate bash)"
export PATH="$HOME/.local/share/mise/shims:$PATH"
