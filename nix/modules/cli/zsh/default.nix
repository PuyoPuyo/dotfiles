{config, pkgs, lib, inputs, ... }:
{
  programs.zsh = {
    enable = true;
    initExtra = '' 
    # Add any additional configurations here
    export PATH=/run/current-system/sw/bin:$HOME/.nix-profile/bin:$PATH
    if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    fi

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

    # Init atuin
    eval "$(atuin init zsh)"

    # Init mise
    eval "$(/Users/tester/.local/bin/mise activate zsh)"


    #======Exports======
    # Default editor nvim
    export EDITOR=/opt/homebrew/bin/nvim


    path+=('/Applications/Xcode.app/Contents/Developer/Toolchains/xcodeDefault.xctoolchain/usr/bin/sourcekit-lsp')
    export PATH
    export TOOLCHAIN_PATH=/Applications/Xcode.app/Contents/Developer/Toolchains/xcodeDefault.xctoolchain


    # Fzf options
    export FZF_DEFAULT_OPTS="
    -m
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
      local main_command="$\{1\}"

      brew $\{@\}

      for command in "$\{dump_commands[@]\}"; do
        [[ "$\{command\}" == "$\{main_command\}" ]] && brew bundle dump --file="$\{HOME\}/.Brewfile" --force
    done
    }

    fzg() {
        # Switch between Ripgrep mode and fzf filtering mode (CTRL-T)
        rm -f /tmp/rg-fzf-{r,f}
        RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
        INITIAL_QUERY="$\{*:-\}"
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
    source "~/.zsh/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh"

    # Global aliases, get expaned everywhere
    abbrev-alias -g G='| rg -i'
    abbrev-alias -g P='| tb'
    '';

    shellAliases = {

      # Pastebin (termbin.com)
      tb = "${pkgs.netcat-gnu}/bin/nc termbin.com 9999";

      # Gitignores

      git-ignore-create-go =
        "${pkgs.curl}/bin/curl 'https://www.toptal.com/developers/gitignore/api/vim,go,tags,ssh' > .gitignore";

      c = "${pkgs.bat}/bin/bat -n --decorations never";
      weather = "${pkgs.curl}/bin/curl -4 http://wttr.in/Koeln";
    };

    plugins = [
      {
        name = "zsh-abbrev-alias";
        file = "abbrev-alias.plugin.zsh";
        src = builtins.fetchGit {
          # Updated 2020-12-31
          url = "https://github.com/momo-lab/zsh-abbrev-alias";
          rev = "2f3d218f426aff21ac888217b0284a3a1470e274";
        };
      }
      {
        name = "zsh-colored-man-pages";
        file = "colored-man-pages.plugin.zsh";
        src = builtins.fetchGit {
          url = "https://github.com/ael-code/zsh-colored-man-pages";
          rev = "57bdda68e52a09075352b18fa3ca21abd31df4cb";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        file = "zsh-syntax-highlighting.zsh";
        src = builtins.fetchGit {
          url = "https://github.com/zsh-users/zsh-syntax-highlighting/";
          rev = "932e29a0c75411cb618f02995b66c0a4a25699bc";
        };
      }
      {
        name = "zsh-vim-mode";
        file = "zsh-vim-mode.zsh";
        src = builtins.fetchGit {
          url = "https://github.com/softmoth/zsh-vim-mode";
        };
      }
    ];
  };
}
