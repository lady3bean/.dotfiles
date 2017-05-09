#!/bin/bash

DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DOTFILES

echo "export DOTFILES=$DOTFILES" >> $HOME/.bash_profile
echo ". \$DOTFILES/init.sh" >> $HOME/.bash_profile

mkdir $HOME/.config

if [ ! -f $HOME/.config/powerline ] ; then
	ln -s $DOTFILES/.config/powerline $HOME/.config/powerline
fi