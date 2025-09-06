#!/bin/bash
# 090525 - en6624 script for i3 and general dependencies

echo "Options: i3-1 (j i3), main-2, x11vnc-3, update system-4"
case $ch in
  1) 13_inst ;;
  2) main_inst ;;
  3) vnc_inst ;;
  4) sudo xbps-isntall -Syu ;;
  *) echo "not valid option" ;;
esac

i3_inst() {
  sudo xbps-install i3
}

main_inst() {
  sudo xbps-install i3 conky polybar emptty helix kitty nitrogen dmenu x11vnc
}

vnc_inst() {
  sudo xbps-install x11vnc
}
