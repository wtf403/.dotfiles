#!/bin/bash
displays=$(yabai -m query --displays)
primary_display_spaces=($(echo "$displays" | jq -r '.[0].spaces[]'))
secondary_display_spaces=($(echo "$displays" | jq -r '.[1:][] | .spaces[]'))
for space in "${primary_display_spaces[@]}"; do
  echo $space >> ~/Desktop/.yabai.log
  yabai -m space $space --layout stack
done
for space in "${secondary_display_spaces[@]}"; do
  echo $space >> ~/Desktop/.yabai.log
  yabai -m space $space --layout bsp
done

