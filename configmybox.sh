#!/bin/bash

set -ex
# install zsh 
# check if zsh is installed if not install
if ! command -v zsh &> /dev/null 
then  
  sudo apt-get update && sudo apt-get install -y zsh
  chsh -s /bin/zsh
fi

# install antidote (zsh plugin manager)
if [[ -e ~/.antidote ]]; then
  echo "antidote already installed"
else 
  git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote
fi

#install starship
curl -sS https://starship.rs/install.sh | sh

CONFIGS=("$HOME/.zshrc" "$HOME/.config/starship.toml" "$HOME/.vimrc" "$HOME/.zsh_plugins.txt")

echo "check for existing configs"

if [[ ! -e ~/.config ]]; then
  mkdir ~/.config
fi

for config in ${CONFIGS[@]}; do
  echo "checking for $config"
  if [[ -e ${config} ]]; then
    echo "backing up & removing $config"
    cp $config $config.$(date +%Y%m%d%H%M)
    rm $config
  fi 
done

#if [[ -e $HOME/.zshrc ]]; then
#  echo "found .zshrc"
#  cp $HOME/.zshrc $HOME/.zshrc.$(date +%Y%m%d)
#  # rm $config
#fi

# create symlinks
ln -s $(pwd)/.zshrc ~/.zshrc
mkdir -p ~/.config
ln -s $(pwd)/.config/starship.toml ~/.config/starship.toml
ln -s $(pwd)/.vimrc ~/.vimrc
ln -s $(pwd)/.zsh_plugins.txt ~/.zsh_plugins.txt

source ~/.zshrc
