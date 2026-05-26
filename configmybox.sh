#!/bin/bash

set -ex

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# install zsh
if ! command -v zsh &> /dev/null; then
  if [[ "$(uname)" == "Darwin" ]]; then
    echo "zsh should be pre-installed on macOS"
  else
    sudo apt-get update && sudo apt-get install -y zsh
    chsh -s /bin/zsh
  fi
fi

# install antidote (zsh plugin manager)
if [[ ! -e ~/.antidote ]]; then
  git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote
fi

CONFIGS=(".zshrc" ".vimrc" ".zsh_plugins.txt" ".dircolors" ".p10k.zsh" ".tmux.conf")
CONFIGDIRS=(".config/nvim" ".config/ghostty" ".git-template")

mkdir -p ~/.config

for config in "${CONFIGS[@]}"; do
  target="$HOME/$config"
  source="$SCRIPT_DIR/$config"
  # skip if already symlinked correctly
  if [[ -L "$target" && "$(readlink "$target")" == "$source" ]]; then
    echo "$config already linked"
    continue
  fi
  if [[ -e "$target" || -L "$target" ]]; then
    echo "backing up $config"
    mv "$target" "$target.$(date +%Y%m%d%H%M)"
  fi
  ln -s "$source" "$target"
done

for configdir in "${CONFIGDIRS[@]}"; do
  target="$HOME/$configdir"
  source="$SCRIPT_DIR/$configdir"
  if [[ -L "$target" && "$(readlink "$target")" == "$source" ]]; then
    echo "$configdir already linked"
    continue
  fi
  if [[ -e "$target" || -L "$target" ]]; then
    echo "backing up $configdir"
    mv "$target" "$target.$(date +%Y%m%d%H%M)"
  fi
  ln -s "$source" "$target"
done

# tpm setup
if [[ ! -e ~/.tmux/plugins/tpm ]]; then
  mkdir -p ~/.tmux/plugins
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# powerlevel10k setup
if [[ ! -e ~/code/powerlevel10k ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/code/powerlevel10k
fi
