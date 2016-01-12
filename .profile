# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

unset SSH_ASKPASS

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -f "$HOME/.aliases" ]; then
    . "$HOME/.aliases"
fi

export CCACHE_NOCOMPRESS=1
export CXX='ccache g++'
export CC='ccache gcc'
export SVN_EDITOR=vi

PATH=/sbin:~/scripts:$PATH

PS1='\[\e[0;32m\]\u@$HOSTNAME $(uname) \t\[\e[m\]\[\e[1;35m\] $(git branch 2> /dev/null | grep -e ^* | cut -c3-)\[\e[m\]\[\e[1;33m\]\n\w\[\e[m\]>'

