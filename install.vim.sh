#!/bin/bash
source $DOTFILES/util/fn.sh

link_to $DOTFILES/vim/autoload $DOTHOME/.vim/autoload
link_to $DOTFILES/vim/plugin $DOTHOME/.vim/plugin
link_to $DOTFILES/vim/.vimrc $DOTHOME/.vimrc
link_to $DOTFILES/vim/.gvimrc $DOTHOME/.gvimrc
