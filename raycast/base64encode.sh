#!/bin/bash

# Raycast Script Command Template
#
# Duplicate this file and remove ".template." from the filename to get started.
# See full documentation here: https://github.com/raycast/script-commands
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Base64 Encode
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Raycast Scripts
# @raycast.argument1 { "type": "text", "placeholder":"text", "percentEncded": true}

echo "Encoding $1"
encoded=$(echo -n "$1" | base64)
echo $encoded
echo $encoded | pbcopy
