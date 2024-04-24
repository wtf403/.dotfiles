#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Run v2box
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.author mkiselev
# @raycast.authorURL https://raycast.com/mkiselev

echo "Hello World!"

yabai -m window --toggle v2box || open  -a V2BOX

