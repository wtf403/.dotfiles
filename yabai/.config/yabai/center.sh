#!/usr/bin/env bash
if [ "$(yabai -m query --spaces --space | jq -r '.type')" == "float" ]; then yabai -m window --focus $(yabai -m query --windows --window | jq -r '.id') && skhd -k "ctrl - f17"; fi
