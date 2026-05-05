#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Kill Jitouch
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.author mortnod
# @raycast.authorURL https://raycast.com/mortnod

pgrep Jitouch | xargs kill -9
echo "💀 Jitouch killed"

