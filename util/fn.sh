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
  user=$( [[ -n $1 ]] && echo "-u $1" )
  profile=$HOME/.bash_profile
  sudo $user bash --rcfile $profile -i
}
