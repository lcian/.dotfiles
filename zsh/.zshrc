export ZDOTDIR=~/.config/zsh
source $ZDOTDIR/.zshrc
source $ZDOTDIR/alias.zsh

defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
defaults write -g ApplePressAndHoldEnabled -bool false
