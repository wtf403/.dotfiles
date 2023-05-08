#!/usr/bin/env bash

CURRENT_WINDOW=$(yabai -m query --windows --window | jq -r '.[].id')
WEST_WINDOW=$(yabai -m query --windows --window west of:window:${CURRENT_WINDOW} | jq -r '.[].id')

yabai -m window --focus ${WEST_WINDOW}; yabai -m query --windows --window ${WEST_WINDOW} | jq -re '(.frame.x + .frame.w / 2) | tostring + "," + (.frame.y + .frame.h / 2) | tostring' | xargs -I{} yabai -m query --windows --window ${WEST_WINDOW} | jq -re '(.display | tostring) + " {}"' | xargs -I{} yabai -m mouse --move {}
