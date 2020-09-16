# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

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

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

source ~/.fzf.zsh

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/root/.local/bin:$PATH"
export LC_ALL=en_US.UTF-8
export GOROOT=/usr/local/go
export GOPATH=/home/admin/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
#export GOPATH=$HOME/go

source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.zsh

function anu_git(){
    eval $(ssh-agent -s)
    ssh-add ~/git_keys/website_portfolio
}

alias recon=/opt/ReconPi/recon.sh
alias adb=/mnt/c/Users/Anubhav/AppData/Local/Android/Sdk/platform-tools/adb.exe
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/home/admin/Downloads/android-studio/bin:/home/admin/Android/Sdk/emulator:$PATH"
#export WSL_HOST_IP="$(tail -1 /etc/resolv.conf | cut -d' ' -f2)"
#export ADB_SERVER_SOCKET=tcp:$WSL_HOST_IP:5556
