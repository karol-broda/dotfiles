#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
git -C "$DIR" submodule update --init --recursive
"$DIR/dotbot/bin/dotbot" -c "$DIR/install.conf.yaml" "$@"
