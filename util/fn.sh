#!/bin/bash

function link_to() {
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
