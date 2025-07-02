#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Append to Daily Note
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "Placeholder" }

# Documentation:
# @raycast.description Appends something to today's note in Obsidian

TIME=$(date "+%H:%M")

for arg in "$@"; do
    MESSAGE+="$arg "
done

if [ "$MESSAGE" = "" ]; then
    open "obsidian://actions-uri/note/create?vault=ProjectSzil&periodic-note=daily"
else
    MESSAGE="$TIME: $@"

    open "obsidian://actions-uri/note/append?vault=ProjectSzil&silent=true&periodic-note=daily&ensure-newline=true&content=$MESSAGE"
fi