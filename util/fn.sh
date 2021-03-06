#!/bin/bash

link_to() {
    local src dest dest_dir
    src="$1"
    dest="$2"
    dest_dir="$(dirname $dest)"

    mkdir -p $dest_dir

    if [[ ! -e $dest ]] ; then
        ln -s $src $dest
        echo "created link from $src to $dest"
    fi
}

su() {
    local user profile
    user="$( [[ -n $1 ]] && echo "-u $1" )"
    profile=$DOTHOME/.bash_profile
    sudo -E $user SSH_CLIENT="$SSH_CLIENT" bash --rcfile $profile -E -i
}

update_dotfiles() {
    local oldwd
    oldwd=$(pwd)
    cd $DOTFILES
    git pull
    . init.sh
    bash install.sh
    cd $oldwd
}
