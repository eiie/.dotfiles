# Dotfiles #

Dotfiles management for my personal use.

## Installation ##

Clone the repository wih submodules then launch the installation script.

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

## Bash ##

The installation script make a symbolic link with absolute path in the home folder for the following files.

- .bash_aliases
> - .bashrc
