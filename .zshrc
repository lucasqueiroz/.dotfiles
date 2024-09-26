fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

export ZSH_TMUX_AUTOSTART=false
export ZSH_TMUX_DEFAULT_SESSION_NAME="workspace"

export ZSH="$HOME/.oh-my-zsh"

plugins=(git asdf brew zsh-autosuggestions zsh-syntax-highlighting tmux)

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
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
eval "$(fzf --zsh)"

# autoload -U compinit; compinit
source ~/.oh-my-zsh/custom/plugins/fzf-tab/fzf-tab.plugin.zsh

# Zoxide
eval "$(zoxide init zsh)"

export EDITOR="nvim"

# Oh-my-posh
eval "$(oh-my-posh init zsh --config '~/.oh-my-posh.toml')"

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
