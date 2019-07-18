# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=20000
HISTFILESIZE=40000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

PS1='\w\$'

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . "$HOME/.bash_aliases"
fi

eval "$(dircolors)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#ulimit -c unlimited

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

#printf "\e[36m"
#figlet "Welcome, Linus!" -f future
#printf "\e[0m" 

export EDITOR=vim
export GTAGSLABEL=native-pygments
export NNN_COPIER=copyit
export ENHANCD_FILTER=fzy

source tmux_color.sh
source "$HOME/app/enhancd/init.sh"

# added by travis gem
[ -f /home/linusboyle/.travis/travis.sh ] && source /home/linusboyle/.travis/travis.sh

export QSYS_ROOTDIR="/home/linusboyle/intelFPGA_lite/18.1/quartus/sopc_builder/bin"

export TEXMACS_PATH="$HOME/app/TeXmacs"
export PATH="$TEXMACS_PATH/bin:$PATH"

test -r /home/linusboyle/.opam/opam-init/init.sh && . /home/linusboyle/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
eval `opam env`
