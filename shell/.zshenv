export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

export PATH=$PATH:$HOME/.local/bin
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export VIMINIT=":source $XDG_CONFIG_HOME/vim/vimrc"
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export MAILCAPS="$XDG_CONFIG_HOME"/mutt/mailcap
export LESSHISTFILE=-
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history
