#!/usr/bin/env bash

config_dir="${XDG_CONFIG_HOME}"

if [[ -z "$XDG_CONFIG_HOME" ]]; then
  config_dir="${HOME}/.config"
fi

if ! (( $# == 0 )); then
  echo "$1"
  config_dir="$1"
fi 

script_dir="$(realpath "$(dirname "$0")")"

# make a soft link to nvim config dir
ln -s "$script_dir" "${config_dir}" || exit 1 

echo "Config applied! start a new neovim instance to see the changes"
