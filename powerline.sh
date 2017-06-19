# the location of pip installed assets on OSxX
if [[ -e $DOTHOME/Library/Python/2.7/bin ]] ; then
    python_bin=$DOTHOME/Library/Python/2.7/bin
    python_path=$DOTHOME/Library/Python/2.7/lib/python/site-packages
elif [[ -e $DOTHOME/.local ]] ; then
    python_bin=$DOTHOME/.local/bin
    python_path=$DOTHOME/.local/lib/python2.6/site-packages
else
    echo "could not detect location of pip user installs"
    return 1
fi
export PYTHONPATH="$PYTHONPATH:$python_path"
export PATH="$PATH:$python_bin"
powerline-daemon -q
export POWERLINE_COMMAND=powerline
export POWERLINE_CONFIG_COMMAND=powerline-config
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. $python_path/powerline/bindings/bash/powerline.sh

powerline-reload() {
    powerline-daemon --replace
}
