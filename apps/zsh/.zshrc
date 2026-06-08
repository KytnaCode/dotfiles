#!/usr/bin/env bash
# All environment ZSH_CUSTOM_* variables are mean to be set in variablesFile to adjust platform dependent behaviours
# like get antidote path.

# Helpers
source_if_exists() {
  if [[ -f "$1" ]]; then
    source "$1"
  fi
}

variablesFile="$HOME/.variables.zsh"
overridesFile="$HOME/.nix-overrides.zshrc"

source_if_exists "$variablesFile" 

if [[ -f "$ZSH_CUSTOM_ANTIDOTE_PATH" ]]; then
  source "$ZSH_CUSTOM_ANTIDOTE_PATH"
  antidote load
fi

if (( $+commands[direnv] )); then
  eval "$(direnv hook zsh)"
fi

if (( $+commands[starship] )); then
  eval "$(starship init zsh)"
fi

# Keybindings
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search

# Configuration
COMPLETION_WAITING_DOTS="true"

## Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# Aliases
alias zsh-plugin-reload='antidote bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.zsh'
alias useflake='echo "use_flake" > .envrc'
alias jrctl='journalctl -xeb'

source_if_exists "$overridesFile"
