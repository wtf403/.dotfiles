#!/usr/bin/env bash

curWindowId="$(yabai -m query --windows --window | jq -re ".id")"

# Swap the window and store the resulting space id
targetSpaceId=$(
  yabai -m window --swap south || \
  yabai -m window --display south || \
  yabai -m window --swap north || \
  yabai -m window --display north \
  | grep -oP '(?<=space )\d+'
)

# Focus on the target space
yabai -m space --focus "$targetSpaceId"

# Focus on the original window
yabai -m window --focus "$curWindowId"
