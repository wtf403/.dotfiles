#!/usr/bin/env bash

# Define variables to store the last known position
last_x=0
last_y=0

# Check if the last position is stored in a file
if [ -f ~/.last_window_position ]; then
  read -r last_x last_y < ~/.last_window_position
fi

# Get the focused window's ID
focused_window_id=$(yabai -m query --windows --window | jq '.id')

# Get the focused window's position and size
x=$(yabai -m query --windows --window | jq '.frame.x')
y=$(yabai -m query --windows --window | jq '.frame.y')
width=$(yabai -m query --windows --window | jq '.frame.w')
height=$(yabai -m query --windows --window | jq '.frame.h')

# Calculate the center of the focused window
center_x=$((x + width / 2))
center_y=$((y + height / 2))

# Store the current position as the last known position
echo "$center_x $center_y" > ~/.last_window_position

# Move the mouse cursor to the last known position
cliclick m:"$last_x","$last_y"
