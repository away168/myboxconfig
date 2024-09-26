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

# pnpm
export PNPM_HOME="/Users/away/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# golang
export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:$GOPATH/bin"

# pnpm end
# eval "$(starship init zsh)"
# SPACESHIP_PROMPT_ASYNC=FALSE

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# dotnet
export PATH="$PATH:/usr/local/share/dotnet"

# alias
alias ascii="echo -e \$(pbpaste)"
alias tf="tofu"
# PYENV
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
