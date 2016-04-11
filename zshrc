# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git, command-not-found)

# User configuration

export MANPATH="$HOME/texlive/2015/texmf-dist/doc/man:/usr/local/man:$MANPATH"
export INFOPATH="$HOME/texlive/2015/texmf-dist/doc/info:$INFOPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
    PROMPT="$(hostname) "$PROMPT  # add hostname if SSH'd in
 else
#   export EDITOR='mvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

if [[ "$TERM" == "xterm" ]]; then
    export TERM=xterm-256color
fi

# Base16 Shell
BASE16_SHELL="$HOME/workspace/base16-shell/base16-bright.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export PATH="$HOME/texlive/2015/bin/x86_64-linux:$PATH"
#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$HOME/bin:$PATH"

export EDITOR=vim

# Do not add new command history lines to the $HISTFILE incrementally (as soon as they are entered),
# rather wait for the session to end before adding history. 
# This separates the history of each zsh session. 
unsetopt INC_APPEND_HISTORY 

export PYTHONDONTWRITEBYTECODE=True

############ FRMO BCARL ########################


#!/bin/bash
AGENT_SOCKET=$HOME/.ssh/.ssh-agent-socket
AGENT_INFO=$HOME/.ssh/.ssh-agent-info
if [[ -s "$AGENT_INFO" ]]
then
    source $AGENT_INFO
fi
 
other=0
if [[ -z "$SSH_AGENT_PID" ]]
then
    running=0
else
    running=0
    for u in `ps -C ssh-agent -o pid=`
    do
        if [[ "$running" != "1" ]]
        then
            if [[ "$SSH_AGENT_PID" != "$u" ]]
            then
                running=2
                other=$u
            else
                running=1
                echo "Agent $u Already Running"
            fi
        fi
    done
fi
 
if [[ "$running" != "1" ]]
then
    echo "Re-starting Agent"
    killall -15 ssh-agent
    #nuke the dot files, if they are still there.
    if [ -e $AGENT_INFO ]; then rm $AGENT_INFO; fi 
    if [ -e $AGENT_SOCKET ]; then rm $AGENT_SOCKET; fi   
    eval `ssh-agent -s -a $AGENT_SOCKET`
    echo "export SSH_AGENT_PID=$SSH_AGENT_PID" > $AGENT_INFO
    echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK" >> $AGENT_INFO
    #setup the midway tolken for snowfort
    ssh-add -s libeToken.so
    for file in `ls -1 ~/.ssh/*.pem`
    do
        ssh-add $file
    done
elif [[ "$other" != "0" ]]
then
    if ps -p $other|grep $other|grep defunct >/dev/null
    then
        echo "DEFUNCT process $other is still running"
    else
        echo "WARNING!! non defunct process $other is still running"
    fi
fi

###################################

export EDITOR=vim

export TERM=xterm-256color
