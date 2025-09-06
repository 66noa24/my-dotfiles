#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

dotfiles="$HOME/other/git/my-dotfiles"

install_i3() {
  echo "Linking i3 config..."
  install -D "$dotfiles/.config/i3/config" "$HOME/.config/i3/config"
  echo "i3 config linked."
}

install_other() {
  echo "Linking other app config..."
  install -D "$dotfiles/.config/helix/config.toml" "$HOME/.config/helix/config.toml"
  echo "Copied helix config"
  sudo install -D "$dotfiles/.etc/conky/conky.conf" "/etc/conky/conky.conf"
  echo "Copied conky files"
  sudo install -D "$dotfiles/.etc/polybar/config.ini" "/etc/polybar/config.ini"
  echo "Copied polybar config"
  echo "==============================="
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

