#!/usr/bin/env bash
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
ln -sfn "$DIR" ~/.dotfiles

host="$(scutil --get LocalHostName 2>/dev/null || hostname -s)"

case "$host" in
  WKT-MAC-0110) flake_config="wkt" ;;
  *)
    echo "error: unknown machine '$host'; no flake configuration mapped" >&2
    exit 1
    ;;
esac

exec sudo nix run nix-darwin -- switch --flake ~/.dotfiles#"$flake_config"
