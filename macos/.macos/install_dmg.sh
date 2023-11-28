#!/usr/bin/env bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 /path/to/your/application.dmg"
    exit 1
fi

# Get the DMG file path from the command-line argument
dmg_path="$1"

# Mount the DMG
hdiutil attach "$dmg_path"

# Get the name of the mounted volume
volume_name=$(ls /Volumes/* | grep -m 1 -i ".app")

# Copy the application to the Applications folder
cp -R "/Volumes/$volume_name" /Applications/

# Eject the DMG
hdiutil detach "/Volumes/$volume_name"

echo "Installed $volume_name"
