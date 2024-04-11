emulate sh
source ~/.profile
emulate zsh

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(/opt/homebrew/bin/brew shellenv)"

PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"

export PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export MANPATH="/opt/local/share/man:$MANPATH"

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

# for user scripts
export PATH="$HOME/bin:$PATH"

#bindkey -r "^M"

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

