#!/usr/bin/env bash

curWindowId="$(yabai -m query --windows --window | jq -re ".id")"
curSpaceLayout="$(yabai -m query --spaces --space | jq -re ".type")"

if [ "$curSpaceLayout" != "stack" ]; then
  $(yabai -m window --display next || yabai -m window --display first)
fi

$(yabai -m window --focus "$curWindowId")
