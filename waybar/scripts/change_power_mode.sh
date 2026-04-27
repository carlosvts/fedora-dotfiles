#!/bin/bash
chosen=$(echo -e "performance\nbalanced\npower-saver" | wofi --dmenu --p "Power Profile:")
if [ ! -z "$chosen" ]; then
    powerprofilesctl set "$chosen"
fi
