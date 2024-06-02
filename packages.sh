#!/bin/bash

echo ""
echo "Checking for installed packages..."

commands=(
    # Core
    "git"
    "curl"
    "wget"
    "tar"
    "zip"
    "unzip"

    # Core terminal
    "zsh"
    "nvim"
    "tmux"
    "alacritty"
    "starship"
    "rofi"
    "greenclip"
    
    # Terminal tools
    "logo-ls"
    "rg"
    "difft"
    "bat"
    "dust"
    "duf"
    "htop"
    "tree"
    "neofetch"
    "jq"

    # Development
    "gcc"
    "g++"
    "make"
    "cmake"
    "autoconf"
    "docker"
    "python3"
    "conda"
    "node"
     
    # Misc
    "google-chrome"
    "vlc"
    "fzf"
    "xdotool"
    "xclip"
    "stew"
    "parallel"
)

installed=()
missing=()

for command in "${commands[@]}"; do
    if which "$command" >/dev/null 2>&1; then
        installed+=("$command")
    else
        missing+=("$command")
    fi
done

for command in "${installed[@]}"; do
    echo -e "\e[32m✔\e[0m $command"
done
for command in "${missing[@]}"; do
    echo -e "\e[31m✖\e[0m $command"
done

if [ ${#missing[@]} -gt 0 ]; then
    echo ""
    echo "Maybe try running:"
    echo "sudo apt install ${missing[@]} -y"
else
    echo ""
    echo "All set!"
fi
