#!/bin/sh
if [ -f /tmp/current_brightness_level ]; then
  level=$(cat /tmp/current_brightness_level)
  brightnessctl set "$level"
fi

