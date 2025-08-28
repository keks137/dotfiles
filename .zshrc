eval "$(starship init zsh)"
# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v
bindkey  '^[[3~' vi-delete-char
bindkey -a '^[[3~' vi-delete-char

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}



# Aliases
alias pls='doas'
alias ls='ls --color=auto --group-directories-first'
alias nv="nvim"
alias gal="git commit -a"
alias :q="exit"
alias clipchoose="cliphist list | dmenu | cliphist decode | wl-copy"
alias nvgd="nvim --cmd 'lua vim.g.godot_mode = true'"
mkcd() { mkdir -p "$@" && cd "$@"; }

# Exports
export EDITOR='nvim'
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/usr/bin:$PATH"
export PATH="$HOME/.config/composer/vendor/bin/:$PATH"
export ANDROID_HOME="$HOME/Android/Sdk"
eval "$(rbenv init -)"


. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"

. "$HOME/.local/bin/env"

# Enable autocompletion
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
# zsh-z
source $HOME/.zsh/zsh-z/zsh-z.plugin.zsh
# Configure color settings
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#setopt CORRECT_ALL 
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
                                'r:|[._-]=* r:|=*'   \
                                'l:|=* r:|=*'         \
                                'm:{[:lower:]-}={[:upper:]-}' 
