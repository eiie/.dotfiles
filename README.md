# dotfiles #

dotfiles management for my personal use.

## vim ##

### plugins ###

Plugins are added via git submodule in vim/plugins directory.

`git submodule add https://github.com/honza/vim-snippets.git vim/plugins/vim-snippets`

The installation script make a symbolic link with absolute path in vim configuration folder.

We can easily update all plugins by pulling git submodules recursively

`git submodule update --init --recursive`
