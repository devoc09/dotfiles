#!/bin/bash

# sh -c "$(curl -fsSL https://git.io/get-zi)" --
cp ~/dotfiles/zsh/.zshrc ~/.zshrc
. ~/.zshrc

# after install plugins
mkdir -p ~/.config/fsh
cp ~/dotfiles/zsh/my-fsh-theme.ini ~/.config/fsh/my-theme.ini
fast-theme ~/.config/fsh/my-theme.ini
