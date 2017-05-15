#!/bin/bash
source $DOTFILES/util/fn.sh

link_to $DOTFILES/vim/autoload $HOME/.vim/autoload
link_to $DOTFILES/vim/plugin $HOME/.vim/plugin
link_to $DOTFILES/vim/.vimrc $HOME/.vimrc
link_to $DOTFILES/vim/.gvimrc $HOME/.gvimrc
