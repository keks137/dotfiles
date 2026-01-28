# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
#zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/archie/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh.d/histfile
HISTSIZE=5000000
SAVEHIST=$HISTSIZE

# HISTORY
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt SHARE_HISTORY             # Share history between all sessions.
# END HISTORY
setopt extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
autoload -U colors && colors
#PS1='%~ > '
# PS1="%{$fg[blue]%}%~ %{$fg[green]%}> %{$reset_color%}"
precmd() {
    if [[ $? -ne 0 ]]; then
        PS1="%F{red}%~%f %F{green}>%f "
    else
        PS1="%F{blue}%~%f %F{green}>%f "
    fi
}


# Aliases
alias ls='LC_COLLATE=C ls --color=auto --group-directories-first'
alias nv="nvim"
alias :q="exit"
# alias clipchoose="cliphist list | dmenu | cliphist decode | wl-copy"
# alias nvgd="nvim --cmd 'lua vim.g.godot_mode = true'"
mkcd() { mkdir -p "$@" && cd "$@"; }

# Configure color settings
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source <(fzf --zsh) # Remember ctrl+r

export PATH="$HOME/.config/tmux:$PATH" #sessionizer
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:/home/$USER/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"
