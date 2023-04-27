#!/usr/bin/env bash

config () {
	config_dir=".config/$1"
	config_base_dir=$1
	config_file=$2
	config_base_file=$2
	config_type=$3 # xdg or classic
	config_file_type=$4 # link or file

	if [[ -d "$HOME/.dotfiles/$config_base_dir" ]]; then
		case $config_type in
			xdg) mkdir -p "$HOME/$config_dir" ;;
			classic) config_dir="" ; config_file=.$config_file ;;
		esac
		if [[ -f "$HOME/.dotfiles/$config_base_dir/$config_base_file" ]]; then
			if [[ -L "$HOME/$config_dir/$config_file" ]]; then
				ln -sf "$HOME/.dotfiles/$config_base_dir/$config_base_file" "$HOME/$config_dir/$config_file"
			elif [[ ! -a "$HOME/$config_dir/$config_file" ]]; then
				ln -sf "$HOME/.dotfiles/$config_base_dir/$config_base_file" "$HOME/$config_dir/$config_file"
			elif [[ -n $(diff "$HOME/.dotfiles/$config_base_dir/$config_base_file" "$HOME/$config_dir/$config_file") ]]; then
				while true; do
					read -r -p "A precedent configuration of $config_file has been foud, do you want to erase it ? (Y/n) (d to see diff)" yn
					yn=${yn:-y}
					case $yn in
						[Yy]* )
							[[ $config_file_type = "link" ]] && ln -sf "$HOME/.dotfiles/$config_base_dir/$config_base_file" "$HOME/$config_dir/$config_file"
							[[ $config_file_type = "file" ]] && cp "$HOME/.dotfiles/$config_base_dir/$config_base_file" "$HOME/$config_dir/$config_file" ; break;;
						[Nn]* ) echo "$config_file installation have been skipped" ; break;;
						[Dd]* ) vim -d "$HOME/.dotfiles/$config_base_dir/$config_base_file" "$HOME/$config_dir/$config_file" ; continue ;;
						* ) continue;
					esac
				done
			fi
		fi
	fi
}

config_vim () {
	if [[ -d "$HOME/.dotfiles/vim" ]]; then
		mkdir -p $HOME/.vim/{view,undo,spell,session,ftplugin,pack/plugins/start}
		for i in "$HOME/.dotfiles/vim/plugins/"*; do
			[[ -r "$i" ]] && ln -sf "$i" "$HOME/.vim/pack/plugins/start/$(basename $i)"
		done
		for i in "$HOME/.dotfiles/vim/ftplugin/"*; do
			[[ -r "$i" ]] && ln -sf "$i" "$HOME/.vim/ftplugin/$(basename $i)"
		done
		[[ -f "$HOME/.dotfiles/vim/vimrc" ]] && ln -sf "$HOME/.dotfiles/vim/vimrc" "$HOME/.vim/vimrc"
		[[ -f "$HOME/.dotfiles/vim/abbrev" ]] && ln -sf "$HOME/.dotfiles/vim/abbrev" "$HOME/.vim/abbrev"
		[[ -f "$HOME/.dotfiles/vim/terminal_session.vim" ]] && cp "$HOME/.dotfiles/vim/terminal_session.vim" "$HOME/.vim/terminal_session.vim"
	fi
}

if [[ -d "$HOME/.dotfiles"  ]]; then
	config dunst dunstrc xdg
	config readline inputrc xdg
	config tmux tmux.conf xdg
	config info infokey classic link
	config bash bash_aliases classic link
	config bash bashrc classic file
	config bash dir_colors classic link
	config_vim
else
	printf "Please clone the repository in your home directory"
fi
