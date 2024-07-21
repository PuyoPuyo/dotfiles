#======Inits======
# Init starship 
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Init fzf
source <(fzf --zsh)

# Init zoxide
eval "$(zoxide init zsh)"
bindkey "ç" fzf-cd-widget

# Init histfile
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt appendhistory

if ! command -v "atuin" > /dev/null; then
  # install foobar here
  curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
fi

# Init atuin
eval "$(atuin init zsh)"

#======Exports======
# Default editor nvim
export EDITOR=/opt/homebrew/bin/nvim


path+=('/Applications/Xcode.app/Contents/Developer/Toolchains/xcodeDefault.xctoolchain/usr/bin/sourcekit-lsp')
export PATH
export TOOLCHAIN_PATH=/Applications/Xcode.app/Contents/Developer/Toolchains/xcodeDefault.xctoolchain


# Fzf options
export FZF_DEFAULT_OPTS="
--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'
--bind 'ctrl-e:execute(echo {+} | xargs -o nvim)'
--bind 'F2:toggle-preview'
--bind 'ctrl-j:down,ctrl-k:up,ctrl-h:preview-down,ctrl-l:preview-up'
"


#======Aliases======
alias startmtn="shortcuts run 'Start My Next Meeting'"
alias v=nvim
alias ll="ls -la" 
alias lm="ls -lma"
alias cls="clear"
alias md="mkdir"
alias fzfp="fzf --preview 'bat --color=always {}'" 

# Add ssh keys to keychain
eval "$(ssh-add --apple-use-keychain ~/.ssh/id_ed25519)"

#======Functions======
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

fzg() {
	# Switch between Ripgrep mode and fzf filtering mode (CTRL-T)
	rm -f /tmp/rg-fzf-{r,f}
	RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
	INITIAL_QUERY="${*:-}"
	fzf --ansi --disabled --query "$INITIAL_QUERY" \
		--bind "start:reload:$RG_PREFIX {q}" \
		--bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
		--bind 'ctrl-t:transform:[[ ! $FZF_PROMPT =~ ripgrep ]] &&
		  echo "rebind(change)+change-prompt(1. ripgrep> )+disable-search+transform-query:echo \{q} > /tmp/rg-fzf-f; cat /tmp/rg-fzf-r" ||
		  echo "unbind(change)+change-prompt(2. fzf> )+enable-search+transform-query:echo \{q} > /tmp/rg-fzf-r; cat /tmp/rg-fzf-f"' \
		--color "hl:-1:underline,hl+:-1:underline:reverse" \
		--prompt '1. ripgrep> ' \
		--delimiter : \
		--header 'CTRL-T: Switch between ripgrep/fzf' \
		--preview 'bat --color=always {1} --highlight-line {2}' \
		--preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
		--bind 'enter:become(vim {1} +{2})'
}

. "$HOME/.atuin/bin/env"

