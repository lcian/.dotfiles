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
alias gpr="gh pr view --web"
alias py="python3"
alias ipy="ipython3"

# dotfiles
alias aliasc="$EDITOR $ZDOTDIR/alias.zsh"
alias zrc="$EDITOR $ZDOTDIR/.zshrc"
alias nvrc="$EDITOR ~/.config/nvim/lua/lorenzo/settings.lua"
alias nvp="$EDITOR ~/.config/nvim/lua/lorenzo/plugins.lua"
alias nvvm="$EDITOR ~/.config/nvim/lua/lorenzo/maps.lua"
alias alac="$EDITOR ~/.config/alacritty/alacritty.toml"
alias trc="$EDITOR ~/.config/tmux/tmux.conf"
alias src="$EDITOR ~/.config/starship/starship.toml"
alias rofic="$EDITOR ~/.config/rofi/config.rasi"
alias vrc="$EDITOR ~/.vimrc"
alias ivrc="$EDITOR ~/.ideavimrc"
alias gitc="$EDITOR ~/.gitconfig"

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
pwninit () {
  nc=${1:""}
  host=`cut -d: -f1 <<< $nc`
  port=`cut -d: -f2 <<< $nc`
  template=`pwn template --host $host --port $port`
  if [ ! -f "solve.py" ]; then
    echo "$template" > solve.py
  fi
  ghidra.py `pwd`
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
alias rover="/home/lorenzo/lib/rust-rover/RustRover-2024.1.2/bin/rustrover.sh >/dev/null 2>&1 & disown"
alias postman="/home/lorenzo/lib/postman/./Postman >/dev/null 2>&1 & disown"
alias astudio="/home/lorenzo/lib/android-studio/bin/studio.sh >/dev/null 2>&1 & disown"
alias unreal="/home/lorenzo/lib/unreal/Engine/Binaries/Linux/UnrealEditor >/dev/null 2>&1 & disown"

alias jgit='java -jar /home/lorenzo/projects/jgit/target/jgit.jar "$@"'

alias obsidian="/home/lorenzo/lib/Obsidian-1.6.5.AppImage >/dev/null 2>&1 & disown"

#alias npm="pnpm"

# https://gist.github.com/karpathy/1dd0294ef9567971c1e4348a90d69285
gca() {
    if [[ -z "$(git diff --cached)" ]]; then
        echo "no staged changes to commit"
        return 1
    fi

    generate_commit_message() {
       repo_name=$(basename `git rev-parse --show-toplevel`)
       git diff --staged | llm "
Write a single conventional commits style commit message for this diff in the $repo_name repo.
Keep it concise and general.
"
    }

    echo "generating commit message..."
    commit_message=$(generate_commit_message)

    git commit -e -F <(echo "$commit_message")
}

gba() {
    if [[ -z "$(git diff --cached)" ]]; then
        echo "no staged changes"
        return 1
    fi

    generate_branch_name() {
       git diff --staged | llm "
Write a concise branch name for this diff in the $repo_name repo.
It should consist of the conventional commits type, followed by a max five word description of the change.
Examples: feat/api-server-integration, fix/typo-java-docs, ref/extract-utility-function.
"
    }

    read_input() {
        if [ -n "$ZSH_VERSION" ]; then
            echo -n "$1"
            read -r REPLY
        else
            read -p "$1" -r REPLY
        fi
    }

    echo "generating branch name..."
    username=$(git config user.name | xargs)
    branch_name=$username/$(generate_branch_name)
    echo $branch_name

    read_input "(y) to accept, any other key to abort: "
    choice=$REPLY

    if [ "$choice" != "y" ]; then
        echo "aborted"
        return 1
    else
        git checkout -b $branch_name
    fi
}
