SHELL := /bin/bash

zshset:
	# sh -c "$(curl -fsSL https://git.io/get-zi)" --
	# cp ~/dotfiles/zsh/.zshrc ~/.zshrc
	# source ~/.zshrc
	sh ~/dotfiles/zsh/setup.sh
	mkdir -p ~/bin
	ln -sf ~/dotfiles/bin/* ~/bin/
	chmod 755 ~/dotfiles/bin/*
starshipset:
	mkdir -p ~/.config
	ln -sf ~/dotfiles/shell/starship.toml ~/.config/starship.toml
tmuxset:
	ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
nvimset:
	# neovim
	mkdir -p ~/.config/nvim
	ln -sf ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
	ln -sf ~/dotfiles/nvim/lua ~/.config/nvim/lua
alacrittyset:
	mkdir -p ~/.config/alacritty
	ln -sf ~/dotfiles/terminals/alacritty.yml ~/.config/alacritty/
weztermset:
	ln -sf ~/dotfiles/terminals/wezterm/.wezterm.lua ~/.wezterm.lua
