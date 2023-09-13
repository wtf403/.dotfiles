#!/usr/bin/env bash

# Check if a file exists to store the last focused window's position
if [ -f ~/.last_window_position ]; then
    # Read the last position from the file
    read -r last_x last_y < ~/.last_window_position
else
    # If the file doesn't exist, set initial position to the center of the screen
    last_x=$(expr $(yabai -m query --displays --display | jq '.frame.x') + $(yabai -m query --displays --display | jq '.frame.w') / 2)
    last_y=$(expr $(yabai -m query --displays --display | jq '.frame.y') + $(yabai -m query --displays --display | jq '.frame.h') / 2)
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

# Move the mouse cursor to the last position if it's not the same as the focused window
if [ "$center_x" -ne "$last_x" ] || [ "$center_y" -ne "$last_y" ]; then
    cliclick m:"$last_x","$last_y"
fi

# Update the last window position
echo "$center_x $center_y" > ~/.last_window_position
