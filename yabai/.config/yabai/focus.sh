#!/usr/bin/env bash

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

# Move the mouse cursor to the center of the focused window
cliclick m:"$center_x","$center_y"
