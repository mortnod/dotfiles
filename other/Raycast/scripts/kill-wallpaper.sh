#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Kill Wallpaper
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Kills the wallpaper process, which frequently ruins battery life
# @raycast.author mortnod
# @raycast.authorURL https://raycast.com/mortnod

# pgrep Wallpaper | xargs kill -9
# date >> /Users/mortnod/Projects/dotfiles/scripts/kill-wallpaper.log
echo "💀 Wallpaper killed"

