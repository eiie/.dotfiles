#!/usr/bin/env bash

config_link() {
	config_dir=$1
	config_file=$2
	if [[ -d "$HOME/.dotfiles/$config_dir" ]]; then
		mkdir -p "$HOME/.config/$config_dir"
		[[ -f "$HOME/.dotfiles/$config_dir/$config_file" ]] && ln -sf "$HOME/.dotfiles/$config_dir/$config_file"  "$HOME/.config/$config_dir/$config_file"
	fi
}

if [[ -d ~/.dotfiles  ]]; then
	# vim
	if [[ -d ~/.dotfiles/vim ]]; then
		mkdir -p ~/.vim/{view,undo,spell,pack/plugins/start}
		for i in "$HOME/.dotfiles/vim/plugins/*"; do
			[[ -r ~/.dotfiles/vim/plugins/"$i" ]] && ln -sf ~/.dotfiles/vim/plugins/"$i" ~/.vim/pack/plugins/start/"$i"
		done
		[[ -f ~/.dotfiles/vim/vimrc ]] && ln -sf ~/.dotfiles/vim/vimrc  ~/.vim/vimrc
	fi

	# bash
	if [[ -d ~/.dotfiles/bash ]]; then
		# bash_aliases
		if [[ -f ~/.dotfiles/bash/bash_aliases ]]; then
			if [ -L ~/.bash_aliases ]; then
				ln -sf ~/.dotfiles/bash/bash_aliases ~/.bash_aliases
			elif [ ! -f ~/.bash_aliases ]; then
				ln -sf ~/.dotfiles/bash/bash_aliases ~/.bash_aliases
			else
				while true; do
					read -p "A precedent configuration of .bash_aliases has been foud, do you want to erase it ? (Y/n)" yn
					yn=${yn:-y}
					case $yn in
						[Yy]* ) ln -sf ~/.dotfiles/bash/bash_aliases ~/.bash_aliases; break;;
						[Nn]* ) echo ".bash_aliases installation have been skipped" ; break;;
						* ) continue;
					esac
				done
			fi
		fi
	fi
	# bashrc
	#	if [[ -f ~/.dotfiles/bash/bashrc ]]; then
	#	fi
	config_link dunst dunstrc
	config_link readline inputrc
	config_link tmux tmux.conf
fi

# TODO
# add aliases
# add .bashrc
# add. .dir_colors (move in .config)
# add .tmuxrc
# make a function to check if link / absent, etc. and make the link
