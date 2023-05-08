#!/bin/bash
direction="\$1"
current_display=$(yabai -m query --displays --display | jq -r '.id')
next_display=$(yabai -m query --displays --display "$(($current_display % $(yabai -m query --displays | jq -r 'length') + 1))" | jq -r '.id')

if [[ $(yabai -m query --windows --space | jq -r 'map(select(."frame"."x" > .frame.x))[-1:] | .[].id') != "null" ]]; then
  yabai -m window --focus "$(yabai -m query --windows --space | jq -r 'map(select(."frame"."x" > .frame.x))[-1:] | .[].id')"
else
  yabai -m window --focus "$(yabai -m query --windows --display $next_display | jq -r 'map(select(."frame"."x" < .frame.x))[0] | .id')"
fi

