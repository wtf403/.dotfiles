#!/usr/bin/env bash

curWindowId="$(yabai -m query --space --window | jq -re ".id")"

$(yabai -m window --swap west || yabai -m window --display west || yabai -m window --swap east || yabai -m window --display east)
$(yabai -m window --focus "$curWindowId")
