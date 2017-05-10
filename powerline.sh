# the location of pip installed assets on OSX
python_bin=$HOME/Library/Python/2.7/bin
powerline_dir=$HOME/Library/Python/2.7/lib/python/site-packages/powerline

export PATH="$PATH:$python_bin"
powerline-daemon -q
export POWERLINE_COMMAND=powerline
export POWERLINE_CONFIG_COMMAND=powerline-config
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. $powerline_dir/bindings/bash/powerline.sh