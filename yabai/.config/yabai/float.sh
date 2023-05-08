#!/usr/bin/env bash

DISPLAY=$(yabai -m query --displays --display | jq '.id')


if [[ $DISPLAY -eq 2 ]]; then
  yabai -m window --toggle float --grid 4:6:2:1:2:2
elif [[ $DISPLAY -eq 1 ]]; then
  yabai -m window --toggle float --grid 8:12:2:1:8:6
fi

terminal-notifier -message "$DISPLAY"

