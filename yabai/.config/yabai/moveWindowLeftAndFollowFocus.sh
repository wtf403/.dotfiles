#!/usr/bin/env bash

curWindowId="$(yabai -m query --windows --window | jq -re ".id")"
curLayout="$(yabai -m query --spaces --space | jq -re ".type")"

if [[ "$curLayout" == "stack" ]]; then
  yabai -m window --focus next
else
  yabai -m window --display next || yabai -m window --display first
  yabai -m window --focus "$curWindowId"
fi
