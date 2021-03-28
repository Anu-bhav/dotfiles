# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

#alias ls="ls -lah --color=auto"
alias ping="sudo ping"
alias cat="/usr/bin/bat"
alias man="/opt/bat-extras/src/batman.sh"
alias batwatch="/opt/bat-extras/src/batwatch.sh"
alias win="cd /d/Documents/WSL"
alias subl="subl.exe"
alias ghidra="/opt/ghidra/ghidraRun"
alias sqlmap="python3 /opt/sqlmap/sqlmap.py"
alias gitgot="python3 /opt/GitGot/gitgot.py"
alias tree="tree -a -C -s -h --du"
alias firefox="'/c/Program Files (x86)/Mozilla Firefox/firefox.exe'"
alias my_portfolio="cd /d/Documents/Development/website_github"

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
    eval $(ssh-agent -s) > /dev/null 2>&1
    ssh-add ~/git_keys/website_portfolio > /dev/null 2>&1
    # && echo "Git Identity Added"
}

function typora(){
    FILE=$1
    if [ ! -f "$FILE" ]; then
        touch "$FILE.md"
        eval "$(/d/Program\ Files/Typora/Typora.exe "$FILE.md" > /dev/null 2>&1 &)"
    else
        eval "$(/d/Program\ Files/Typora/Typora.exe "$FILE" > /dev/null 2>&1 &)"
    fi
}

function blog(){
    blog_path="/d/Documents/Development/website_github/Portfolio-Blog/src/routes/blog/posts/"
    static_path="/d/Documents/Development/website_github/Portfolio-Blog/static/"
    backup_dir="/d/Documents/Development/website_github/Posts/"
    cd $blog_path || return
    chmod 777 $blog_path/*
    
    FILE="$1.md"
    template="hello-world.md"
    
    if [ ! -f "$FILE" ]; then
        cp $template "$FILE"
        sed -i "s/title: .*/title: title/" "$FILE"
        today=$(date -u +"%Y-%m-%d")
        sed -i "s/date: \"2020-12-02\"/date: $today/" "$FILE"
        sed -i "s/Every .*/description/" "$FILE"
        eval "$(/d/Program\ Files/Typora/Typora.exe "$FILE" > /dev/null 2>&1)"
    else
        eval "$(/d/Program\ Files/Typora/Typora.exe "$FILE" > /dev/null 2>&1)"
    fi
    
    cp "$FILE" $backup_dir && echo "Successfully copied $FILE to backup_dir" || echo "No such file created"
    
    blog_img_dir=$(find "$blog_path" ! -path "$blog_path" -type d)
    
    if [ -d "$blog_img_dir" ]; then
        cp -afr "$blog_img_dir" $static_path && echo "Successfully copied blog_img_dir to static_path"
        cp -afr "$blog_img_dir" $backup_dir && echo "Successfully copied blog_img_dir to backup_dir"
        rm -rf "$blog_img_dir" && echo "Successfully deleted blog_img_dir from blog_path"
    fi
    
    cd - > /dev/null 2>&1 || return
}

function fixdns() {
    WSL_IP="$(ipconfig.exe | grep -A5 '(WSL):' | grep IPv4 | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')"
    echo -e "nameserver $WSL_IP\nnameserver 1.1.1.1\nnameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null 2>&1
#    powershell.exe -File "D:\Documents\WSL\fixnet.ps1"
}

fixdns
anu_git

WSL_IP="$(ipconfig.exe | grep -A5 '(WSL):' | grep IPv4 | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')"
# WSL_HOST_IP="$(ifconfig | grep 'inet' | head -n 1 | awk -F' ' '{ print $2 }')"



alias recon=/opt/Recon-Workflow/recon.sh
alias adb=/mnt/c/Users/Anubhav/AppData/Local/Android/Sdk/platform-tools/adb.exe
export DISPLAY=$WSL_IP:0
export LIBGL_ALWAYS_INDIRECT=1
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/home/admin/Downloads/android-studio/bin:/home/admin/Android/Sdk/emulator:$PATH"
# export DOCKER_HOST=tcp://$WSL_IP:2375
# export DOCKER_HOST=tcp://$WSL_HOST_IP:2375
# export DOCKER_HOST=unix:///var/run/docker.sock
# export DOCKER_OPTS="-H $DOCKER_HOST -H unix:///var/run/docker.sock"
#export ADB_SERVER_SOCKET=tcp:$WSL_IP:5556
#export XAUTHORITY=$HOME/.Xauthority
