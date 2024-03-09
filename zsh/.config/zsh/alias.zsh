
# alert
alias alert='notify-send -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# dotfiles
alias alac="$EDITOR ~/.config/alacritty/alacritty.toml"
alias trc="$EDITOR ~/.config/tmux/tmux.conf"
alias zrc="$EDITOR $ZDOTDIR/.zshrc"
alias aliasc="$EDITOR $ZDOTDIR/alias.zsh"
alias vrc="$EDITOR ~/.vimrc"
alias nvrc="$EDITOR ~/.config/nvim/lua/lorenzo/settings.lua"
alias nvp="$EDITOR ~/.config/nvim/lua/lorenzo/plugins.lua"
alias nvm="$EDITOR ~/.config/nvim/lua/lorenzo/maps.lua"
alias rofic="$EDITOR ~/.config/rofi/config.rasi"
alias src="$EDITOR ~/.config/starship/starship.toml"
alias py="python3"
alias ipy="ipython3"

# replacements
alias v="$EDITOR"
alias h="history"
#alias vim="echo 'Use v'"
#alias nvim="echo 'Use v'"
alias cat="bat --theme='Monokai Extended Origin'"
alias du="dust"
alias diff="difft"
#alias ls="ls --color=tty --group-directories-first"
alias ls="logo-ls -X"
alias l="logo-ls -X"
alias ll="logo-ls -X -l -h"
alias la="logo-ls -X -a"
alias lla="logo-ls -X -la"
alias apt="zypper"

# CTF
pwninit_bin="$HOME/bin/pwninit"
pwninit () {
  nc=${1:""}
  $pwninit_bin $nc --template-path ~/.config/pwninit/normal.py && ghidra.py `pwd`
}
alias cryptoinit="$pwninit_bin --template-path ~/.config/pwninit/crypto.py"
adinit () {
  $pwninit_bin --template-path ~/.config/pwninit/ad.py &&  ghidra.py `pwd`
}
#alias adinit="$pwninit_bin --template-path ~/.config/pwninit/ad.py; ghidra.py `pwd`"
alias sqlmap="python3 $HOME/lib/sqlmap-dev/sqlmap.py"

alias pwndbg="ln -sf $HOME/.config/gdb/pwndbg $HOME/.gdbinit"
alias gef="ln -sf $HOME/.config/gdb/gef $HOME/.gdbinit"
alias seccomp-tools="seccomp-tools.ruby3.2"
alias one-gadget="one_gadget.ruby3.2"

alias start_sploit="$HOME/lib/DestructiveFarm/client/./start_sploit.py"

alias farm="ssh -L 6969:localhost:6969 farmer"
alias tulip="ssh -L 3000:localhost:3000 goofy"

alias gs="git status"
alias gc="git commit"
alias gd="git difftool"
alias ga="git add"
alias gl="git log"

function c() {
	builtin cd "$@" && ls
}

# advent of code quick start!
function aoc() {
    cd ~/aoc
    cargo generate lcian/cargo-generate-advent-of-code --name "d$1"
    cd "d$1"
    mv ~/Downloads/input.txt .
    tmux split-window -v -c "#{pane_current_path}"
    v src/main.rs
}
# CodeForces quick start!
function cfs() {
    mkdir $1
    cd $1
    cp ~/lib/codeforces/solve.cpp .
    #tmux split-window -v -c "#{pane_current_path}"
    v solve.cpp -c "Copilot disable" -c "7j"
}

alias ollama="docker run -d -v ollama:/root/.ollama -p 11434:11434 ollama/ollama"

alias meshlab="~/lib/MeshLab2023.12-linux.AppImage >/dev/null 2>/dev/null & disown"
alias blender="~/lib/blender-4.0.2-linux-x64/blender >/dev/null 2>/dev/null & disown"

alias cf="~/lib/go/bin/cf-tool"
