#!/usr/bin/env bash

CONFIGDIR="${HOME}/Code/kmonad-config"
PLUGINSDIR="${HOME}/Library/Application Support/xbar/plugins"
SLEEP=1

script="${PLUGINSDIR}/$(basename $0)"
opts="shell='${script}' | terminal=true | refresh=true"

if [[ -z "$1" ]]; then
  sleep "${SLEEP}"
  echo "⌃⌥⌘⇧"
  echo "---"

  runinfo=$(pgrep -lf 'sudo kmonad' | cut -d ' ' -f 6)
  case $runinfo in
    *apple.kbd) echo "Apple Internal Keyboard / Trackpad ✓" ;;
    *)          echo "Apple Internal Keyboard / Trackpad | ${opts} | param1=apple" ;;
  esac
  case $runinfo in
    *kinesis.kbd) echo "Kinesis Freestyle Pro ✓" ;;
    *)            echo "Kinesis Freestyle Pro | ${opts} | param1=kinesis" ;;
  esac
  case $runinfo in
    --input) echo "Magic Keyboard ✓" ;;
    *)       echo "Magic Keyboard | ${opts} | param1=magic-keyboard" ;;
  esac
  echo "---"
  if [[ -z "${runinfo}" ]]; then
    echo "Kill"
  else
    echo "Kill | ${opts} | param1=kill"
  fi

  exit 0
fi


sudo pkill kmonad
sleep "${SLEEP}"

case $1 in
  apple) sudo kmonad --start-delay 0 "${CONFIGDIR}/apple.kbd" & ;;
  kinesis) sudo kmonad --start-delay 0 "${CONFIGDIR}/kinesis.kbd" & ;;
  magic-keyboard) sudo kmonad --start-delay 0 --input 'iokit-name "Magic Keyboard"' "${CONFIGDIR}/apple.kbd" & ;;
esac
