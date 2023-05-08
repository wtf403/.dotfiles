#!/usr/bin/env bash

#yabai -m window --focus west || yabai -m display --focus west

WIN_ID=$(yabai -m query --windows --window | jq '.id') 

yabai -m window --display recent

$(yabai -m window --focus "$WIN_ID")
