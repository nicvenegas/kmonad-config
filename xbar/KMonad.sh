#!/usr/bin/env bash

CONFIGDIR="${HOME}/Code/kmonad-config"
PLUGINSDIR="${HOME}/Library/Application Support/xbar/plugins"
SLEEP=1

opts="shell='${PLUGINSDIR}/$(basename $0)' | terminal=true | refresh=true"

if [[ -z "$1" ]]; then
  sleep "${SLEEP}"
  echo "⌃⌥⌘⇧"
  echo "---"

  runinfo=$(pgrep -lf 'sudo kmonad')
  case $runinfo in
    *apple*) echo "Apple Internal Keyboard / Trackpad ✓" ;;
    *)       echo "Apple Internal Keyboard / Trackpad | ${opts} | param1=apple" ;;
  esac
  case $runinfo in
    *kinesis*) echo "Kinesis Freestyle Pro ✓" ;;
    *)         echo "Kinesis Freestyle Pro | ${opts} | param1=kinesis" ;;
  esac
  case $runinfo in
    *magic-keyboard*) echo "Magic Keyboard ✓" ;;
    *)                echo "Magic Keyboard | ${opts} | param1=magic-keyboard" ;;
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
if [[ "$1" != "kill" ]]; then
  sleep "${SLEEP}"
  sudo kmonad --start-delay 0 "${CONFIGDIR}/$1.kbd" &
fi
