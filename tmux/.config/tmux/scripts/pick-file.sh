# doesn't work
tmux capture-pane -p -J | \
  grep -oE '((\.{1,2}|~|/)?([a-zA-Z0-9_\-\.]+/)*[a-zA-Z0-9_\-\.]+)' | \ 
  sort -u | \
  fzf --prompt="Copy file: " | \
  xclip -selection clipboard
