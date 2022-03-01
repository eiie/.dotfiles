# Dotfiles #

Dotfiles management for my personal use.

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

To remove a plugin simply remove the directory and commit.

```
rm -rf ~/.dotfiles/vim/plugins/vim-lsp
```

Dont forget to remove undesired links in your .vim config folder.

```
find ../.vim/pack/plugins/start -xtype l | xargs  rm -rf
```
