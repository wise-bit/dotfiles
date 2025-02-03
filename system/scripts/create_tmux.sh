#!/bin/bash

SESSION_NAME="auto_work"

DIRECTORIES=(
    "$HOME/"
    "$HOME/repos/dotfiles/"
)

tmux has-session -t "$SESSION_NAME" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "Session $SESSION_NAME already exists. Attaching to it."
    tmux attach-session -t "$SESSION_NAME"
    exit 0
fi

tmux new-session -d -s "$SESSION_NAME" -c "${DIRECTORIES[0]}" -n "w0"

for ((i = 1; i < ${#DIRECTORIES[@]}; i++)); do
    tmux new-window -t "$SESSION_NAME" -c "${DIRECTORIES[i]}" -n "w$i"
done

tmux select-window -t "$session_name:1"
tmux attach-session -t "$SESSION_NAME"

