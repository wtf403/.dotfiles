#!/bin/bash

LATITUDE=55.576482
LONGITUDE=39.513407

# Get the current date
DATE=$(date +"%Y-%m-%d")

# Retrieve the sunrise and sunset times from the API
SUNRISE=$(curl -s "https://api.sunrise-sunset.org/json?lat=${LATITUDE}&lng=${LONGITUDE}&date=$DATE" | /opt/homebrew/bin/jq -r '.results.sunrise')
SUNSET=$(curl -s "https://api.sunrise-sunset.org/json?lat=${LATITUDE}&lng=${LONGITUDE}&date=$DATE" | /opt/homebrew/bin/jq -r '.results.sunset')

# Parse the sunrise and sunset times into Unix timestamps
SUNRISE_UNIX=$(date -j -f "%I:%M:%S %p" "$SUNRISE" +"%s")
SUNSET_UNIX=$(date -j -f "%I:%M:%S %p" "$SUNSET" +"%s")

# Get the current Unix timestamp
NOW_UNIX=$(date +"%s")

# Check if it's currently daytime or nighttime
if [ $NOW_UNIX -gt $SUNRISE_UNIX ] && [ $NOW_UNIX -lt $SUNSET_UNIX ]
then
    # It's daytime, so set the macOS theme to Light
    osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to false'
else
    # It's nighttime, so set the macOS theme to Dark
    osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'
fi
