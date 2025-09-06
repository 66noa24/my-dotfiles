#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

dotfiles="$HOME/other/git/my-dotfiles"

install_i3() {
  sudo ln -s /etc/sv/emptty /var/service/
  echo "Emptty enabled"
  echo "Copying i3 config..."
  install -D "$dotfiles/.config/i3/config" "$HOME/.config/i3/config"
  echo "i3 config linked."
  echo "REBOOT SYSTEM TO USE EMPTTY"
}

install_other() {
  echo "Linking other app config..."
  echo "Installing helix"
  install -D "$dotfiles/.config/helix/config.toml" "$HOME/.config/helix/config.toml"
  echo "Copied helix config"
  sudo install -D "$dotfiles/.etc/conky/conky.conf" "/etc/conky/conky.conf"
  echo "Copied conky files"
  sudo install -D "$dotfiles/.etc/polybar/config.ini" "/etc/polybar/config.ini"
  echo "Copied polybar config"
  echo "==============================="
  echo "other config linked."
}

cp_resolution() {
  echo "Copying over the file"
  cp "$dotfiles/.resolution-set" "$HOME/.resolution-set"
}

echo "What do you want to do?"
echo "  a) Install i3 config | emptty, and i3 config"
echo "  b) Install other app config | helix, conky, polybar"
echo "  c) Copy over .resolution-set to home for funky resolution. May break"
read -r -p "Choice (a/b/c): " ch

case "$ch" in
  a|A) install_i3 ;;
  b|B) install_other ;;
  c|C) cp_resolution ;; 
  *) echo "No valid choice, exiting." ;;
esac

