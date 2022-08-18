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
					read -p "A precedent configuration of $config_file has been foud, do you want to erase it ? (Y/n) (d to see diff)" yn
					yn=${yn:-y}
					case $yn in
						[Yy]* )
							[[ $config_file_type = "link" ]] && ln -sf "$HOME/.dotfiles/$config_base_dir/$config_base_file" "$HOME/$config_dir/$config_file"
							[[ $config_file_type = "file" ]] && cp "$HOME/.dotfiles/$config_base_dir/$config_base_file" "$HOME/$config_dir/$config_file" ; break;;
						[Nn]* ) echo "$config_file installation have been skipped" ; break;;
						[Dd]* ) diff "$HOME/.dotfiles/$config_base_dir/$config_base_file" "$HOME/$config_dir/$config_file" ; continue ;;
						* ) continue;
					esac
				done
			fi
		fi
	fi
}

if [[ -d $HOME/.dotfiles  ]]; then
	# vim
	if [[ -d $HOME/.dotfiles/vim ]]; then
		mkdir -p "$HOME/.vim/{view,undo,spell,pack/plugins/start}"
		for i in "$HOME/.dotfiles/vim/plugins/"*; do
			[[ -r "$HOME/.dotfiles/vim/plugins/$i" ]] && ln -sf "$HOME/.dotfiles/vim/plugins/$i" "$HOME/.vim/pack/plugins/start/$i"
		done
		[[ -f "$HOME/.dotfiles/vim/vimrc" ]] && ln -sf "$HOME/.dotfiles/vim/vimrc" "$HOME/.vim/vimrc"
	fi

	config dunst dunstrc xdg
	config readline inputrc xdg
	config tmux tmux.conf xdg
	config bash bash_aliases classic link
fi

# TODO
# add .bashrc
# add. .dir_colors (move in .config)
