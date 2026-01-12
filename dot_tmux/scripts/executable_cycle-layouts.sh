#!/bin/bash
# Cycle through custom layouts with prefix + Space

# Define your layouts here (use names or exact layout strings)
layouts=(
    "main-vertical"
    "main-horizontal"
    "tiled"
)

# Get current index for this window (default 0)
window_id=$(tmux display-message -p "#{window_id}")
idx=$(tmux show-environment -g "LAYOUT_IDX_$window_id" 2>/dev/null | cut -d= -f2)
idx=${idx:-0}

# Move to next layout
idx=$(( (idx + 1) % ${#layouts[@]} ))

# Apply layout
tmux select-layout "${layouts[$idx]}"

# Save index
tmux set-environment -g "LAYOUT_IDX_$window_id" "$idx"
