#!/bin/bash


sessions=$(tmux list-sessions -F '#S' 2>/dev/null)

selected=$(echo "$sessions" | fuzzel --dmenu \
    --prompt "sessions: " \
    --width 40)

if [[ -n "$TMUX" ]]; then
    tmux switch-client -t "$selected"
else
    tmux attach-session -t "$selected"
fi
