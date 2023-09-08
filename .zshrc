# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
alias kuc="kubectl config use-context"
alias kgc="kubectl config get-contexts"

function asp(){
      export AWS_PROFILE="$@"
}

source ~/code/powerlevel10k/powerlevel10k.zsh-theme

# source antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

eval "$(direnv hook zsh)"
eval "$(op completion zsh)"; compdef _op op
eval "$(pyenv init -)"

# pnpm
export PNPM_HOME="/Users/away/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

#gopath
export PATH="$PATH:$GOPATH/bin"

# pnpm end
# eval "$(starship init zsh)"
# SPACESHIP_PROMPT_ASYNC=FALSE

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
