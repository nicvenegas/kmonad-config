#!/usr/bin/env bash

CONFIGDIR="${HOME}/Code/kmonad-config"
PLUGINSDIR="${HOME}/Library/Application Support/xbar/plugins"

script="${PLUGINSDIR}/$(basename $0)"
opts="shell='${script}' | terminal=true"

if [[ -z "$1" ]]; then
  echo "⌃⌥⌘⇧"
  echo "---"
  echo "Apple Internal Keyboard / Trackpad | ${opts} | param1=apple"
  echo              "Kinesis Freestyle Pro | ${opts} | param1=kinesis"
  echo                     "Magic Keyboard | ${opts} | param1=magic-keyboard"
  echo "---"
  if [[ -z "$(pgrep kmonad)" ]]; then
    echo "Kill"
  else
    echo "Kill | ${opts} | param1=kill"
  fi;

  exit 0
fi


sudo pkill kmonad
sleep 1

case $1 in
  apple) sudo kmonad "${CONFIGDIR}/apple.kbd" & ;;
  kinesis) sudo kmonad "${CONFIGDIR}/kinesis.kbd" & ;;
  magic-keyboard) sudo kmonad --input 'iokit-name "Magic Keyboard"' "${CONFIGDIR}/apple.kbd" & ;;
esac
