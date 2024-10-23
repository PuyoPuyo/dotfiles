if ! (( $+functions[zsh-defer] )); then
  fpath+=( $HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-romkatv-SLASH-zsh-defer )
  source $HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-romkatv-SLASH-zsh-defer/zsh-defer.plugin.zsh
fi
fpath+=( $HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-syntax-highlighting )
zsh-defer source $HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
fpath+=( $HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-autosuggestions )
zsh-defer source $HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
fpath+=( $HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-softmoth-SLASH-zsh-vim-mode )
source $HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-softmoth-SLASH-zsh-vim-mode/zsh-vim-mode.plugin.zsh
