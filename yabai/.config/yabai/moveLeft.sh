#!/usr/bin/env bash

curWindowId="$(yabai -m query --windows --window | jq -re ".id")"

$(yabai -m window --focus west || yabai -m display --focus west || yabai -m window --focus east || yabai -m display --focus east)
$(yabai -m window --focus "$curWindowId")
