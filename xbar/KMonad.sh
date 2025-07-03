#!/usr/bin/env bash

CONFIGDIR="${HOME}/Code/kmonad-config"
PLUGINSDIR="${HOME}/Library/Application Support/xbar/plugins"
SLEEP=1

opts="shell='${PLUGINSDIR}/$(basename "$0")' | terminal=true | refresh=true"

if [[ -z "$1" ]]; then
  sleep "${SLEEP}"
  echo "⌥"
  # echo "⌃⌥⌘⇧"
  echo "---"

  config=$(pgrep -lf 'sudo kmonad' | cut -w -f 6)
  case $config in
    *apple*) echo "Apple Internal Keyboard / Trackpad ✓" ;;
    *)       echo "Apple Internal Keyboard / Trackpad | ${opts} | param1=apple" ;;
  esac
  case $config in
    *magic-keyboard*) echo "Magic Keyboard ✓" ;;
    *)                echo "Magic Keyboard | ${opts} | param1=magic-keyboard" ;;
  esac
  
  echo "---"
  echo "Kill" "${config:+| ${opts} | param1=kill}"

  exit 0
fi

sudo pkill kmonad
if [[ "$1" != "kill" ]]; then
  sleep "${SLEEP}"
  sudo kmonad --start-delay 0 "${CONFIGDIR}/$1.kbd" &
fi
