#!/usr/bin/env bash

if [[ -d ~/.dotfiles  ]]; then
# vim
    if [[ -d ~/.dotfiles/vim ]]; then
	mkdir -p ~/.vim/{view,undo,spell,pack/plugins/{start,opt}}
	for i in $(ls ~/.dotfiles/vim/plugins); do
		ln -sf ~/.dotfiles/vim/plugins/"$i" ~/.vim/pack/plugins/start/"$i"
	done
	[[ -f ~/.dotfiles/vim/vimrc ]] && ln -sf ~/.dotfiles/vim/vimrc  ~/.vim/vimrc
    fi
fi

# TODO
# add aliases
# add .bashrc
# add .tmuxrc

