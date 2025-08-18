#!/usr/bin/env bash

# Get artist and title safely
artist=$(playerctl --player=spotify metadata artist 2>/dev/null)
title=$(playerctl --player=spotify metadata title 2>/dev/null)

# Fallback if nothing is playing
if [ -n "$artist" ] && [ -n "$title" ]; then
    track=" $artist - $title"
else
    track=" nothing playing..."
fi

escape_html() {
    echo "$1" | sed \
        -e 's/&/\&amp;/g' \
        -e 's/</\&lt;/g' \
        -e 's/>/\&gt;/g' \
        -e 's/\"/\&quot;/g' \
        -e "s/'/\&#39;/g"
}

track=$(escape_html "$track")

# Output JSON, properly escaped
jq -n --arg t "$track" '{"text":$t}' --unbuffered --compact-output
