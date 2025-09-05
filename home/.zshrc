# zmodload zsh/zprof
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

export ZSH="$HOME/.oh-my-zsh"

plugins=(git brew zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# FZF
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"
eval "$(fzf --zsh)"

# source ~/.oh-my-zsh/custom/plugins/fzf-tab/fzf-tab.plugin.zsh

# Zoxide
eval "$(zoxide init zsh)"

export EDITOR="nvim"

export PATH="$PATH:$HOME/.local/bin"

# NPM
NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# Adds alias commands
source ~/.common_aliases
source ~/.bash_aliases

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Pure
export ZSH_THEME=""
autoload -U promptinit; promptinit
prompt pure
zstyle :prompt:pure:prompt:success color green
zstyle :prompt:pure:prompt:error color red

source "$HOME/.homesick/repos/homeshick/homeshick.sh"

### set PATH so it includes user's nix bin if it exists
if [ -d "$HOME/.nix-profile/bin" ] ; then
    PATH="$HOME/.nix-profile/bin:$PATH"
fi

### set XDG_DATA_DIR so it includes user's nix share if it exists
if [ -d "$HOME/.nix-profile/share" ] ; then
    XDG_DATA_DIRS="$HOME/.nix-profile/share:$XDG_DATA_DIRS"
fi

export PATH=/usr/local/cuda-13.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-13.0/lib64:$LD_LIBRARY_PATH
