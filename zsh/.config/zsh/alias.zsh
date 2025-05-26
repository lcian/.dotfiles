# general

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
alias nvvm="$EDITOR ~/.config/nvim/lua/lorenzo/maps.lua"
alias alac="$EDITOR ~/.config/alacritty/alacritty.toml"
alias trc="$EDITOR ~/.config/tmux/tmux.conf"
alias src="$EDITOR ~/.config/starship/starship.toml"
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
##alias diff="difft"

alias alert='terminal-notifier -title "Process finished" -message "$([ $? = 0 ] && echo Success || echo Error)"'

copr() { git fetch origin "refs/pull/$1/head:pr/$1" && git checkout "pr/$1"; }

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
