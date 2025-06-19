#!/usr/bin/env bash
nl -ba ~/.zsh_history | tac | fzf --preview '~/.config/tmux/scripts/search-history-preview.sh {}'
