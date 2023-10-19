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
vimset:
	# vim
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
	ln -sf ~/dotfiles/vim/_config ~/.vim/_config
	ln -sf ~/dotfiles/vim/ftplugin ~/.vim/ftplugin
nvimset:
	# neovim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p ~/.config/nvim
	ln -sf ~/dotfiles/nvim/.init.vim ~/.config/nvim/init.vim
	ln -sf ~/dotfiles/nvim/_config ~/.config/nvim/_config
	ln -sf ~/dotfiles/nvim/ftplugin ~/.config/nvim/ftplugin
alacrittyset:
	mkdir -p ~/.config/alacritty
	ln -sf ~/dotfiles/terminals/alacritty.yml ~/.config/alacritty/
weztermset:
	ln -sf ~/dotfiles/terminals/wezterm/.wezterm.lua ~/.wezterm.lua
