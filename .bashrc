#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

set_prompt() {
    local exit_code=$?

    local arrow_color=32
    [[ -n "$SSH_CONNECTION" ]] && arrow_color=33

    if [[ $exit_code -ne 0 ]]; then
        PS1="\[\033[31m\]\w $exit_code\[\033[0m\]\[\033[32m\]>\[\033[0m\] "
    else
        PS1="\[\033[34m\]\w\[\033[0m\] \[\033[${arrow_color}m\]>\[\033[0m\] "
    fi
}

PROMPT_COMMAND=set_prompt
