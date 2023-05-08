#!/usr/bin/env bash

curWindowId="$(yabai -m query --spaces --window | jq -re ".id")"

$(yabai -m window --swap south || yabai -m window --display south || yabai -m window --swap north || yabai -m window --display north)
$(yabai -m window --focus "$curWindowId")
