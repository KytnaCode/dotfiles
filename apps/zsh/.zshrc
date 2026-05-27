#!/usr/bin/env bash
# All environment ZSH_CUSTOM_* variables are mean to be set in variablesFile to adjust platform dependent behaviours
# like get antidote path.

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

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

COMPLETION_WAITING_DOTS="true"

source_if_exists "$overridesFile"


