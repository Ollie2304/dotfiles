#!/bin/bash
set -euo pipefail

SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOT_DIR"

filename="screenshot-$(date '+%Y%m%d-%H%M%S').png"
filepath="$SCREENSHOT_DIR/$filename"

selection=$(slurp -o -r -c '#e01b1b') || exit 0

grim -g "$selection" -t png - | satty \
    --filename - \
    --output-filename "$filepath"

