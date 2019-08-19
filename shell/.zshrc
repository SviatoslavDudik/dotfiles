autoload -Uz compinit up-line-or-beginning-search down-line-or-beginning-search
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
compinit
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
bindkey "^R" history-incremental-search-backward

PROMPT='%(?..%B%F{red}%?%f%b )%B%F{blue}%n%f%b@%m %B%~%b %(!.%F{red}#%f.%%) '

alias wake="notify-send 'Terminal task completed'"
alias r="ranger"
alias n="nnn"
alias neomutt="neomutt && update_status"
alias p="sudo pacman"
alias v="vim"
alias youtube-dl="noglob youtube-dl"
se(){$EDITOR "$(find ~/.tools/* ~/.config/* | fzf --select-1 --exit-0)"}

autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line
bindkey -v

alias :wq="echo \"You're not in vim dumbass\""
alias rm="rm -I"
alias please="sudo"

# Colors
alias grep="grep --color=auto"
alias ls="ls --color=auto --group-directories-first"
alias ll="ls -l"

export LESS_TERMCAP_mb=$'\e[1;34m'
export LESS_TERMCAP_md=$'\e[1;34m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[0;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[0;4m'
export TLDR_HEADER='magenta bold underline'
export TLDR_QUOTE='italic'
export TLDR_DESCRIPTION='green'
export TLDR_CODE='red'
export TLDR_PARAM='blue'
