## How it looks

![image](https://github.com/user-attachments/assets/a45025cd-2e5a-4b5b-b931-2e6c89f8db4b)

## Installation

There are now two branches that will be updated separately and kept somewhat in sync. I won't update the `master` branch anymore.
See https://github.com/lcian/.dotfiles/tree/linux and https://github.com/lcian/.dotfiles/tree/darwin.

First, choose the right branch for your system. 

You can check if everything is installed using `packages.sh`.

To symlink dotfiles for each program, just run `stow <program>`.

For Gnome, you need to run `dconf load / < gnome/dconf.ini`.
