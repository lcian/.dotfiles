#!/bin/bash
rows=$(tmux display-message -p '#{pane_height}' | xargs)
curr_line=$(echo $1 | cut -d' ' -f1)
start=$((curr_line - rows / 2))
end=$((curr_line + rows / 2))
cat ~/.zsh_history | nl -ba | sed -n "${start},${end}p"
