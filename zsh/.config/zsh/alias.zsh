# general
alias alert='notify-send -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# shorthands
alias v="$EDITOR"
alias h="history"
alias gs="git status -s"
alias gc="git commit"
alias gd="git difftool"
alias ga="git add"
alias gl="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)-%an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias py="python3"
alias ipy="ipython3"

# dotfiles
alias aliasc="$EDITOR $ZDOTDIR/alias.zsh"
alias zrc="$EDITOR $ZDOTDIR/.zshrc"
alias nvrc="$EDITOR ~/.config/nvim/lua/lorenzo/settings.lua"
alias nvp="$EDITOR ~/.config/nvim/lua/lorenzo/plugins.lua"
alias nvm="$EDITOR ~/.config/nvim/lua/lorenzo/maps.lua"
alias alac="$EDITOR ~/.config/alacritty/alacritty.toml"
alias trc="$EDITOR ~/.config/tmux/tmux.conf"
alias src="$EDITOR ~/.config/starship/starship.toml"
alias rofic="$EDITOR ~/.config/rofi/config.rasi"
alias vrc="$EDITOR ~/.vimrc"
alias ivrc="$EDITOR ~/.ideavimrc"

# replacements
alias cat="bat --theme='Monokai Extended Origin'"
alias du="dust"
#alias ls="ls --color=tty --group-directories-first"
alias ls="logo-ls -X"
alias l="logo-ls -X"
alias ll="logo-ls -X -l -h"
alias la="logo-ls -X -a"
alias lla="logo-ls -X -la"
#alias diff="difft"

# CTF
alias pwndbg="ln -sf $HOME/.config/gdb/pwndbg $HOME/.gdbinit"
alias gef="ln -sf $HOME/.config/gdb/gef $HOME/.gdbinit"
pwninit_bin="$HOME/bin/pwninit"
pwninit () {
  nc=${1:""}
  $pwninit_bin $nc --template-path ~/.config/pwninit/pwn.py && ghidra.py `pwd`
}
pwninit_simple () {
  nc=${1:""}
  $pwninit_bin $nc --template-path ~/.config/pwninit/pwn.py
}
alias seccomp-tools="seccomp-tools.ruby3.2"
alias one-gadget="one_gadget.ruby3.2"
# AD
alias start_sploit="$HOME/lib/DestructiveFarm/client/./start_sploit.py"
alias farm="ssh -L 6969:localhost:6969 farmer"
alias tulip="ssh -L 3000:localhost:3000 goofy"

copr() { git fetch origin "refs/pull/$1/head:pr/$1" && git checkout "pr/$1"; }

alias idea="/home/lorenzo/lib/intellij/idea-IU-241.15989.150/bin/./idea.sh >/dev/null 2>&1 & disown"
alias goland="/home/lorenzo/lib/goland/GoLand-2024.1.1/bin/./goland.sh >/dev/null 2>&1 & disown"

alias jgit='java -jar /home/lorenzo/projects/jgit/target/jgit.jar "$@"'
