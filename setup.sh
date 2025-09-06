#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

dotfiles="."

install_i3() {
  echo "Linking i3 config..."
  ln -sfn "$dotfiles/config/i3/config" "$HOME/.config/i3/config"
  echo "i3 config linked."
}

install_other() {
  echo "Linking other app config..."
  ln -sfn "$dotfiles/config/other/app.conf" "$HOME/.config/other/app.conf"
  echo "other config linked."
}

echo "What do you want to do?"
echo "  a) Install i3 config"
echo "  b) Install other app config"
read -r -p "Choice (a/b/c): " ch

case "$ch" in
  a|A) install_i3 ;;
  b|B) install_other ;;
  *) echo "No valid choice, exiting." ;;
esac

