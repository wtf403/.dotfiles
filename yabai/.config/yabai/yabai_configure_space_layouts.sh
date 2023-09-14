#!/bin/bash

# Get information about displays using JSON format
displays=$(yabai -m query --displays)

# Extract the list of spaces on the primary display
primary_display_spaces=($(echo "$displays" | jq -r '.[0].spaces[]'))

# Extract the list of spaces on the secondary displays
secondary_display_spaces=($(echo "$displays" | jq -r '.[1:][] | .spaces[]'))

# Configure spaces on the primary display to use the float layout
for space in "${primary_display_spaces[@]}"; do
  yabai -m space $space --layout stack
done

# Configure spaces on the secondary displays to use the bsp layout
for space in "${secondary_display_spaces[@]}"; do
  yabai -m space $space --layout bsp
done

