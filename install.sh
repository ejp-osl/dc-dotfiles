#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sudo apt-get update && sudo apt-get install -y vim

LINKS=(
 .vim
 .vimrc
 .bash_aliases
 .bash_functions
)

# symlink.sh links relative to $(pwd), so run it from the dotfiles dir
for dotfile in "${LINKS[@]}"; do
  (cd "$DOTFILES_DIR" && bash ./symlink.sh "$dotfile")
done

line="[ -f \"$DOTFILES_DIR/.bashrc.devcontainer\" ] && . \"$DOTFILES_DIR/.bashrc.devcontainer\""
touch "$HOME/.bashrc"
grep -qxF "$line" "$HOME/.bashrc" || echo "$line" >> "$HOME/.bashrc"
