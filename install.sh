#!/usr/bin/env bash

config () {
	config_dir=".config/$1"
	config_base_dir=$1
	config_file=$2
	config_type=$3 # xdg or classic
	if [[ -d "$HOME/.dotfiles/$config_dir" ]]; then
	case $config_type in
		xdg) mkdir -p "$HOME/$config_dir" ;;
		classic) config_dir="" ;;
	esac
		if [[ -f "$HOME/.dotfiles/$config_base_dir/$config_file" ]]; then
			if [[ -L "$HOME/$config_dir/$config_file" ]]; then
				ln -sf "$HOME/.dotfiles/$config_base_dir/$config_file" "$HOME/$config_dir/$config_file"
			elif [[ ! -f "$HOME/$config_dir/$config_file" ]]; then
				ln -sf "$HOME/.dotfiles/$config_base_dir/$config_file" "$HOME/$config_dir/$config_file"
			elif [[ -z $(diff "$HOME/.dotfiles/$config_base_dir/$config_file" "$HOME/$config_dir/$config_file") ]]; then
				while true; do
					read -p "A precedent configuration of $config_file has been foud, do you want to erase it ? (Y/n) (d to see diff)" yn
					yn=${yn:-y}
					case $yn in
						[Yy]* )
							[[ $config_type = "xdg" ]] && ln -sf "$HOME/.dotfiles/$config_base_dir/$config_file" "$HOME/$config_dir/$config_file"
							[[ $config_type = "classic" ]] && cp "$HOME/.dotfiles/$config_base_dir/$config_file" "$HOME/$config_dir/$config_file" ; break;;
						[Nn]* ) echo "$config_file installation have been skipped" ; break;;
						[Dd]* ) diff "$HOME/.dotfiles/$config_base_dir/$config_file" "$HOME/$config_dir/$config_file" ; continue ;;
						* ) continue;
					esac
				done
			fi
		fi
	fi
	# echo $config_dir
	# echo $config_base_dir
	# echo $config_file
	# echo $config_type
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
	config bash bash_aliases classic
fi

# TODO
# add .bashrc
# add. .dir_colors (move in .config)
