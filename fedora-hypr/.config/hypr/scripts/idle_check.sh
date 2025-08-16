#!/bin/bash
# idle-check.sh — Only run the command if not playing media or in fullscreen

# Check if media is playing
if [ "$(playerctl status 2>/dev/null)" = "Playing" ]; then
    exit 0
fi

# Check if active window is fullscreen
if hyprctl activewindow -j | grep -q '"fullscreen":true'; then
    exit 0
fi

# Run whatever was passed
"$@"
