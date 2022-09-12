# Dotfiles #

Dotfiles management for my personal use.

## Installation ##

Clone the repository wih submodules in your home directory then launch the installation script.

```
git clone --recurse-submodules https://github.com/eiie/.dotfiles.git
cd .dotfiles
./install.sh
```

## Vim ##

### Plugins ###

#### Adding plugins ####

Plugins are added via git submodule in vim/plugins directory.

```
git submodule add https://github.com/prabirshrestha/vim-lsp.git vim/plugins/vim-lsp
```

The installation script make a symbolic link with absolute path in vim configuration folder.

#### Updating plugins ####

We can easily update all plugins by pulling git submodules recursively

```
git submodule update --init --recursive
```

#### Removing plugins ####

To remove a plugin follow these instructions.

```
# Remove the submodule entry from .git/config
git submodule deinit -f vim/plugins/vim-lsp

# Remove the submodule directory from the superproject's .git/modules directory
rm -rf .git/modules/vim/plugins/vim-lsp

# Remove the entry in .gitmodules and remove the submodule directory located at path/to/submodule
git rm -f vim/plugins/vim-lsp
```

Dont forget to remove undesired links in your .vim config folder.

```
find ../.vim/pack/plugins/start -xtype l | xargs  rm -rf
```

### Help tags ###

Help tags should be generated after adding a new plugin within vim.

```
:helptags ALL
```

### Dependecies ###

Some programs need to be installed to enjoy all the features:

- terraform-ls: lsp server for terraform file

## Configuration ##

### Classic ###

The installation script make a symbolic link or with absolute path or copy the file in the home folder for the following files.

- .bash_aliases
- .bashrc
- .infokey

### XDG ###

Software list :
- dunst
- readline
- tmux
- bashrc and alias

The installation script make a symbolic link with absolute path or copy the file in XDG config folder : `~/.config/<config_dir>/<config_file>`.

Environment variable are needed to configure the XDG folder (included in bashrc).
```
export XDG_CONFIG_HOME=~/.config
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
```
