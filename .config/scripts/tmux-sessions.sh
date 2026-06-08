#!/bin/bash
# modified version of SylvanFranklin/.config//scripts/tmux-session-dispensary.sh

DIRS=(
    "$HOME"
    "$HOME/Development"
    "$HOME/Documents"
)
FZF_OPTS=(
    --popup center
    --no-preview
    --border-label "Sessions"
)
FD_OPTS=(
    . "${DIRS[@]}"
    --type=dir
    --max-depth=1
    --full-path
    --base-directory "$HOME"
)

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(fd "${FD_OPTS[@]}" \
        | sed "s|^$HOME/||" \
        | fzf "${FZF_OPTS[@]}"  )

    [[ $selected ]] && selected="$HOME/$selected"
fi

[[ ! $selected ]] && exit 0

selected_name=$(basename "$selected" | tr . _)

if ! tmux has-session -t "$selected_name"; then
    tmux new-session -ds "$selected_name" -n "nvim" -c "$selected" "nvim"
    tmux new-window -t "$selected_name:2" -c "$selected"
    tmux select-window -t "$selected_name:1"
fi

tmux switch-client -t "$selected_name"
