# dotfiles #

dotfiles management for my personal use.

## vim ##

### plugins ###

Plugins are added via git submodule in vim/plugins directory.

`git submodule add https://github.com/honza/vim-snippets.git vim/plugins/vim-snippets`


```
git submodule add https://github.com/prabirshrestha/vim-lsp.git vim/plugins/vim-lsp
```


The installation script make a symbolic link with absolute path in vim configuration folder.

We can easily update all plugins by pulling git submodules recursively

`git submodule update --init --recursive`
