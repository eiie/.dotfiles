#!/usr/bin/env bash

if [[ -d ~/.dotfiles  ]]; then
	# vim
	if [[ -d ~/.dotfiles/vim ]]; then
		mkdir -p ~/.vim/{view,undo,spell,pack/plugins/{start,opt}}
		for i in $(ls ~/.dotfiles/vim/plugins); do
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
	# dunst
	if [[ -d ~/.dotfiles/dunst ]]; then
		mkdir -p ~/.config/dunst
		[[ -f ~/.dotfiles/dunst/dunstrc ]] && ln -sf ~/.dotfiles/dunst/dunstrc ~/.config/dunst/dunstrc
	fi

	# readline
	if [[ -d ~/.dotfiles/readline ]]; then
		mkdir -p ~/.config/readline
		[[ -f ~/.dotfiles/readline/inputrc ]] && ln -sf ~/.dotfiles/readline/inputrc  ~/.config/readline/inputrc
	fi
fi

# TODO
# add aliases
# add .bashrc
# add .tmuxrc
# make a function to check if link / absent, etc. and make the link
