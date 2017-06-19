#!/bin/bash
set -e

echo "---installing powerline packages---"

mkdir -p $DOTHOME/.config

if [[ ! -e $DOTHOME/.config/powerline ]] ; then
    ln -s $DOTFILES/.config/powerline $DOTHOME/.config/
fi

if [[ "$(type -P brew)" ]] ; then
    brew install python
fi

if [[ ! "$(type -P pip)" ]] ; then
    echo "---error: could not find pip. please install python/pip---"
    exit 1
fi

pip install --user powerline-status powerline-gitstatus

echo "---done installing powerline---"
