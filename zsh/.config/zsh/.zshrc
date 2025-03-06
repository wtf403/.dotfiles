### Should stay close to the top of ~/.zshrc ###
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# default editor
EDITOR="/Users/wtf403/.asdf/shims/nvim"


export PATH=/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

HISTFILESIZE=10000
HISTORY_IGNORE="(*[\n]*|exit|ls|bg|fg|history|clear)"
MAILCHECK=0


plugins=(
  asdf
  docker
  docker-compose
  kubectl
  git
  web-search
  zsh-autosuggestions
  zsh-vi-mode
  copypath
  copyfile
  copybuffer
  colored-man-pages
  npm
  undollar
)
source $ZSH/oh-my-zsh.sh

# McFly
bindkey '^R' mcfly-history-widget
eval "$(mcfly init zsh)"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
 export EDITOR='vi'
else
 export EDITOR='nvim'
fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

function fuck {
    TF_PYTHONIOENCODING=$PYTHONIOENCODING;
    export TF_SHELL=zsh;
    export TF_ALIAS=fuck;
    TF_SHELL_ALIASES=$(alias);
    export TF_SHELL_ALIASES;
    TF_HISTORY="$(fc -ln -10)";
    export TF_HISTORY;
    export PYTHONIOENCODING=utf-8;
    TF_CMD=$(
        thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
    ) && eval $TF_CMD;
    unset TF_HISTORY;
    export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
    test -n "$TF_CMD" && print -s $TF_CMD
}

export LDFLAGS="-L/opt/homebrew/opt/postgresql@15/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@15/include"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="/Users/wtf403/Library/Python/3.9/bin:$PATH"
export PATH=$PATH:~/.spoof-dpi/bin

source ~/.asdf/plugins/golang/set-env.zsh
export GOROOT=$ASDF_DIR/shims/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

source "$HOME/.cargo/env"

#source /Users/wtf403/.config/broot/launcher/bash/br

source ~/.iterm2_shell_integration.zsh

# suggestion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

# Remove forward-char widgets from ACCEPT
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#forward-char}")
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#vi-forward-char}")

# Add forward-char widgets to PARTIAL_ACCEPT
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(forward-char)
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(vi-forward-char)

# Add custom widget to complete partial if cursor is at end of buffer
autosuggest_partial_wordwise () {   
if (( $CURSOR == $#BUFFER )); then
# if cursor is at end of buffer invoke forward-word widget
    zle forward-word
else
# if cursor is not at end of buffer invoke forward-char widget
    zle forward-char
fi
}
zle -N autosuggest_partial_wordwise 

export TLDR_AUTO_UPDATE_DISABLED=1

# Add autosuggest_partial_wordwise to IGNORE
export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)
ZSH_AUTOSUGGEST_IGNORE_WIDGETS+=(autosuggest_partial_wordwise)
export ZSH_AUTOSUGGEST_HISTORY_IGNORE="(cd *|ls *|l *|cat *|man *|rm *|mv *|chmod *|cp *|rmdir *)"

export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@15/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@15/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@15/lib/pkgconfig"
export HOMEBREW_NO_INSTALL_CLEANUP=true
export HOMEBREW_NO_ENV_HINTS=true


if [[ "$(defaults read -g AppleInterfaceStyle 2&>/dev/null)" != "Dark" ]]; then
    export MCFLY_LIGHT=TRUE
fi

# McFly

# completion.zsh
source $ZSH/completions/completion.zsh

# shift+enter (and send hex: 0x0A keybinding)
zvm_after_init_commands+=('bindkey "^J" self-insert')

# ALIASES
precmd() {
  source ~/.config/zsh/aliases
}

bindkey '^M' accept-line

source "$HOME/.asdf/asdf.sh"

PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

export LDFLAGS="-L/opt/homebrew/opt/mysql-client/lib"
export CPPFLAGS="-I/opt/homebrew/opt/mysql-client/include"

export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql-client/lib/pkgconfig"
export PATH="/opt/homebrew/opt/qt/bin:$PATH"

GPG_TTY=$(tty)
export GPG_TTY


if [[ "$TERM_PROGRAM" == "ghostty" ]]; then
  tmux source-file ~/.config/tmux/tmux.conf && tmux new-session -A -s ghostty  
fi

