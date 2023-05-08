#!/usr/bin/env bash

curWindowId="$(yabai -m query --windows --window | jq -re ".id")"

terminal-notifier -message $(yabai -m query --windows --window | jq -re ".id")

$(yabai -m window --swap west || yabai -m window --display west || yabai -m window --swap east || yabai -m window --display east)
$(yabai -m window --focus "$curWindowId")

terminal-notifier -message $(yabai -m query --windows --window | jq -re ".id")


