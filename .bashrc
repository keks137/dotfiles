#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History configuration
# HISTFILE=~/.bashhistfile
HISTSIZE=5000000
HISTFILESIZE=5000000

# History options (closest equivalents to zsh options)
# Bash doesn't have exact equivalents for all zsh history options, but these are close
shopt -s histappend              # Append to history file rather than overwriting
export HISTCONTROL=ignorespace:ignoredups:erasedups

# Enable extended globbing (similar to zsh extendedglob)
shopt -s extglob

# Set emacs keybindings (equivalent to bindkey -e)
set -o emacs


set_prompt() {
    local exit_status=$?
    if [ $exit_status -ne 0 ]; then
        PS1='\[\033[31m\]\w\[\033[0m\] \[\033[32m\]>\[\033[0m\] '
    else
        PS1='\[\033[34m\]\w\[\033[0m\] \[\033[32m\]>\[\033[0m\] '
    fi
}

# Use PROMPT_COMMAND to run set_prompt before each prompt
PROMPT_COMMAND=set_prompt

# Aliases
alias ls='LC_COLLATE=C ls --color=auto --group-directories-first'
alias nv='nvim'
alias :q='exit'
alias archie="distrobox enter archie"

# Functions
mkcd() { mkdir -p "$@" && cd "$@" || return; }

# LS colors
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# Enable bash completion (if available)
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    source /etc/bash_completion
fi


export PATH=/home/deck/usr/bin:$PATH

source <(fzf --bash)

