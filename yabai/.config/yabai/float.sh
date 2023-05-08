#!/usr/bin/env bash

DISPLAY=$(yabai -m query --displays --display | jq '.id')

terminal-notifier -message "$DISPLAY"

if [[ $DISPLAY -eq 2 ]]; then
  yabai -m window --toggle float --grid 4:6:2:1:2:2
else if [[ $DISPLAY -eq 1 ]]
  yabai -m window --toggle float --grid 4:4:1:1:2:2
fi

