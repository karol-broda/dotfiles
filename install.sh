#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

CONFIG_FILE="install.conf.yaml"

if [[ "$1" == "no-nvim" ]]; then
  CONFIG_FILE="install_no_nvim.conf.yaml"

  git -C "$DIR" submodule update --init --recursive --exclude="./config/nvim"
else
  git -C "$DIR" submodule update --init --recursive
fi

"$DIR/dotbot/bin/dotbot" -c "$DIR/$CONFIG_FILE" "$@"
