autoload -Uz compinit up-line-or-beginning-search down-line-or-beginning-search add-zsh-hook

export HISTFILE="$XDG_DATA_HOME"/zsh/history
export HISTSIZE=10000
export SAVEHIST=10000
setopt appendhistory
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
fpath=($HOME/.local/share/gem/ruby/3.0.0/gems/timetrap-1.15.2/completions/zsh $fpath)
export PATH=$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
bindkey "^R" history-incremental-search-backward

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^x' edit-command-line

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
	[ -s "$BASE16_SHELL/profile_helper.sh" ] && \
	eval "$("$BASE16_SHELL/profile_helper.sh")"

source "$XDG_CONFIG_HOME/zsh/prompt"
add-zsh-hook -Uz preexec save_time
add-zsh-hook -Uz precmd calc_time
setopt PROMPT_SUBST
PROMPT='%F{blue}%1d%f%F{yellow}%(?..!)%f%F{red}%(!.#.$)%f '
RPROMPT='%F{#696969}${elapsed_time}%f $(gitprompt)%F{blue}%~%f'

source "$XDG_CONFIG_HOME"/zsh/aliasrc
alias wake="notify-send 'Terminal task completed'"
alias youtube-dl="noglob youtube-dl"
se(){$EDITOR "$(find ~/.local/bin/* ~/.config/* | fzf --select-1 --exit-0)"}

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
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

echoti clear

# GPG for SSH
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
echo UPDATESTARTUPTTY | gpg-connect-agent &> /dev/null

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sviatoslav/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sviatoslav/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sviatoslav/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sviatoslav/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
[ -f "$XDG_CONFIG_HOME/zsh/dev-setup" ] && source "$XDG_CONFIG_HOME/zsh/dev-setup"
[ -f "$XDG_CONFIG_HOME/zsh/kitty" ] && source "$XDG_CONFIG_HOME/zsh/kitty"

[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
