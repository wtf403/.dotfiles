#!/usr/bin/env bash

WIN_ID=$(yabai -m query --windows --window | jq '.id')
CUR_DISPLAY=$(yabai -m query --windows --window | jq '.display')
LEFT_WIN_ID=$(yabai -m query --windows --display $CUR_DISPLAY | jq 'map(select(.frame.x < .frame.x)) | .[-1].id')

if [ -z "$LEFT_WIN_ID" ]; then
  PREV_DISPLAY=$(yabai -m query --displays --display | jq '.index - 1')
  LEFT_WIN_ID=$(yabai -m query --windows --display $PREV_DISPLAY | jq 'min_by(.frame.x) | .id')
fi

# Perform any action on the left window using $LEFT_WIN_ID

terminal-notifier -message "$LEFT_WIN_ID"

$(yabai -m window --focus west || yabai -m display --focus west || yabai -m window --focus east || yabai -m display --focus east)
$(yabai -m window --focus "$curWindowId")
