#!/usr/bin/env bash

if [[ -d ~/dotfiles  ]]; then
    if [[ -f ~/dotfiles/vimrc ]]; then
	mkdir -p tost/{view,undo,spell,pack/{completion/{start,opt},tpope/{start,opt}}}	
	ln -sf ~/dotfiles/vimrc  ~/.vim/vimrc
    fi
fi
