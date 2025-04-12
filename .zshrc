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
# alias ls='ls --color=auto'
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

# fzf
eval "$(fzf --zsh)"
bindkey -r '^T'  # change key binding ^T to ^F
bindkey '^F' fzf-file-widget

# fzf with fd
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# zoxide (z)
eval "$(zoxide init zsh)"

# alias
alias ascii="echo -e \$(pbpaste)"
alias tf="tofu"
alias ls="eza --color=always --git --icons=always"
alias ll="ls --long"
# alias cd="z"

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

alias tmdb='tcloudadmin tmdb --api https://tmdb.internal.together.ai/api/v1'

# TINMAN
export PATH="$PATH:/Users/andrewway/together/tools/model_install/"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/andrewway/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/andrewway/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/andrewway/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/andrewway/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(mamba shell hook --shell zsh)"

# # >>> mamba initialize >>>
# # !! Contents within this block are managed by 'mamba shell init' !!
# export MAMBA_EXE='/opt/homebrew/bin/mamba';
# export MAMBA_ROOT_PREFIX='/opt/homebrew';
# __mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__mamba_setup"
# else
#     alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
# fi
# unset __mamba_setup
# # <<< mamba initialize <<<

# Created by `pipx` on 2025-03-02 20:14:01
PYTHON_REQUIRE_VIRTUALENV=true
export PATH="$PATH:/Users/andrewway/.local/bin"

# tmdb 
alias tmdb="tcloudadmin tmdb --api $TMDB_BASE_URL"
