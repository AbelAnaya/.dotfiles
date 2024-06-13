#!/usr/bin/env bash

DIRECTORIES="$HOME/ $HOME/workspace"

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(fd . $DIRECTORIES --hidden -d 1 --type d 2> /dev/null)
    selected+=$'\n'
    selected+=$(fd .git$ $DIRECTORIES --hidden -d 3 --type f 2> /dev/null | xargs -I {} dirname {})
    selected=$(echo "$selected" | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(echo "$selected" | sed "s|$HOME/||g" | tr . _)
tmux_running=$(pgrep tmux)

echo "Selected: $selected"
echo "Selected_name: $selected_name"
echo "Tmux_running: $tmux_running"

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

if [[ -z $TMUX ]] ; then
    tmux attach -t $selected_name
else
    tmux switch-client -t $selected_name
fi
