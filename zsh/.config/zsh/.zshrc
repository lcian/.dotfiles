#setopt autocd             # change directory just by typing its name
#setopt correct            # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt
setopt noclobber

WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word

# configure keybindings
bindkey -d                                        # delete all bindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^U' backward-kill-line                   # ctrl + u
bindkey '^R' history-incremental-search-backward  # ctrl + r
bindkey 'α' history-incremental-search-forward   # ctrl + n
bindkey '^L' forward-word                         # ctrl + l
bindkey '^H' backward-kill-word                   # ctrl + h
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[3;5~' backward-kill-word              # ctrl + backspace
bindkey 'θ' backward-word                         # ctrl + shift + h (Alacritty)
bindkey '^[[Z' reverse-menu-complete              # shift + tab previous autocomplete choice
bindkey '^K' up-line-or-history
bindkey '^J' down-line-or-history
bindkey -r '^O'
autoload -U edit-command-line
bindkey '^Xe' edit-command-line

# enable completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# enable autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999,underline'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#8a8a8a,underline'

#autoload predict-on
#predict-on

# history
setopt SHARE_HISTORY
HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
#setopt hist_ignore_dups       # ignore duplicated commands history list
#setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
#setopt share_history         # share command history data

# force zsh to show the complete history
alias history="history 0"

# configure `time` format
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    export LS_COLORS="$LS_COLORS:ow=30;44:" # fix ls color for folders with 777 permissions

    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'

    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[1m'        # reset underline

    # Take advantage of $LS_COLORS for completion as well
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# syntax highlightning
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
#ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[default]=fg=white
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[path]=bold
ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[command-substitution]=none
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[process-substitution]=none
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[assign]=none
ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
ZSH_HIGHLIGHT_STYLES[named-fd]=none
ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout

# command not found
# if [ -f /etc/zsh_command_not_found ]; then
#     . /etc/zsh_command_not_found
# fi

# some environment vars
export BROWSER="google-chrome"
export TERM="xterm-256color" # for vim and Alacritty correct colors
export EDITOR="/usr/bin/nvim"
export VISUAL=$EDITOR
export PATH="$HOME/bin:$PATH"

# prompt
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# hide EOL
PROMPT_EOL_MARK=""

# aliases
source $ZDOTDIR/alias.zsh

# cargo
export PATH="$HOME/.cargo/bin:$PATH"

# other hooks
source $HOME/.zshrc

# zoxide
eval "$(zoxide init zsh)"

# npm global nosudo 
# https://github.com/sindresorhus/guides/blob/main/npm-global-without-sudo.md
NPM_PACKAGES="${HOME}/.npm-global"
export PATH="$PATH:$NPM_PACKAGES/bin"
# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

export PYTHONSTARTUP=$HOME/.pythonrc.py

# disable Ctrl+S
if [[ -t 0 && $- = *i* ]]
then
    stty -ixon
fi

export GOPATH="/home/lorenzo/lib/go"
export PATH="$PATH:$GOPATH/bin"

export JAVA_HOME="/usr/lib64/jvm/java-22-openjdk-22"

eval "$(direnv hook zsh)"

source /usr/share/nvm/init-nvm.sh
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#compdef projen
###-begin-projen-completions-###
#
# yargs command completion script
#
# Installation: projen completion >> ~/.zshrc
#    or projen completion >> ~/.zprofile on OSX.
#
_projen_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" projen --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _projen_yargs_completions projen
###-end-projen-completions-###
#
export ANDROID_HOME="/home/lorenzo/lib/Android/Sdk"

source $ZDOTDIR/secrets.zsh

# echo >> /home/lorenzo/.zshrc
# echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/lorenzo/.zshrc
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
#
eval "$(uv generate-shell-completion zsh)"

clear
