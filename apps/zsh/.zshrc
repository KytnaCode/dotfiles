#!/usr/bin/env bash

overridesFile="$HOME/.nix-overrides.zshrc"

COMPLETION_WAITING_DOTS="true"

if [[ -f "$overridesFile" ]]; then
  source "$overridesFile"
fi
