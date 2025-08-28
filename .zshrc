# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/archie/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh.d/histfile
HISTSIZE=1000
SAVEHIST=10000
setopt extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
autoload -U colors && colors
#PS1='%~ > '
PS1="%{$fg[blue]%}%~ %{$fg[green]%}> %{$reset_color%}"


# Aliases
alias ls='ls --color=auto --group-directories-first'
alias nv="nvim"
alias gal="git commit -a"
alias :q="exit"
alias clipchoose="cliphist list | dmenu | cliphist decode | wl-copy"
alias nvgd="nvim --cmd 'lua vim.g.godot_mode = true'"
mkcd() { mkdir -p "$@" && cd "$@"; }

# Configure color settings
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source <(fzf --zsh) # Remember ctrl+r
