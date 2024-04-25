#!/bin/bash

# Raycast Script Command Template
#
# Duplicate this file and remove ".template." from the filename to get started.
# See full documentation here: https://github.com/raycast/script-commands
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Get envID
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Raycast Scripts

echo "env0 URL: $(pbpaste)"

# Extract the path part of the URL
guid=$(pbpaste | awk -F'/' '{print $7}' | awk -F'?' '{print $1}')

echo "GUID after 'environments': $guid (copied to clipboard)"
echo $guid | pbcopy