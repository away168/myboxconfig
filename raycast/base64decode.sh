#!/bin/bash

# Raycast Script Command Template
#
# Duplicate this file and remove ".template." from the filename to get started.
# See full documentation here: https://github.com/raycast/script-commands
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Base64 Decode
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Raycast Scripts
# @raycast.argument1 { "type": "text", "placeholder":"b64enc", "percentEncded": true}

echo "Decoding $1"
decoded=$(echo "$1" | base64 -d)
echo $decoded
echo $decoded | pbcopy
