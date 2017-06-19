#!/bin/bash
set -e

DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTHOME=$HOME
export DOTHOME DOTFILES

cd $DOTFILES

bash -e $DOTFILES/install.gitconfig.sh
bash -e $DOTFILES/install.powerline.sh
bash -e $DOTFILES/install.vim.sh

# Look for a previous dotfiles install in the bash_profile
# OR if grep failed (i.e. a non-zero exit status) append the following text until EOF
grep "export DOTFILES=" $DOTHOME/.bash_profile >/dev/null 2>&1 \
    || cat >> $DOTHOME/.bash_profile <<__EOF__

# https://github.com/lady3bean/.dotfiles
export DOTFILES=$DOTFILES
export DOTHOME=$DOTHOME
. \$DOTFILES/init.sh
__EOF__
