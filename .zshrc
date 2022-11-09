# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/away/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# set colors
#  if [[ -x /usr/bin/dircolors ]]; then
      test -x dircolors && eval "$(dircolors -b ~/.dircolors)" || test -x gdircolors && eval "$(gdircolors -b ~/.dircolors)"
      alias ls='ls --color=auto'
      alias dir='dir --color=auto'
      alias vdir='vdir --color=auto'
      alias grep='grep --color=auto'
      alias fgrep='fgrep --color=auto'
      alias egrep='egrep --color=auto'
#  fi

alias vim="nvim"
alias vi="nvim"

# source antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
eval "$(op completion zsh)"; compdef _op op
