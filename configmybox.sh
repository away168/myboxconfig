#!/bin/bash

# install zsh 
# check if zsh is installed if not install
if ! command -v zsh &> /dev/null 
then  
  sudo apt-get update && sudo apt-get install -y zsh
  chsh -s /bin/zsh
fi

# install antidote (zsh plugin manager)
git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote

#install starship
curl -sS https://starship.rs/install.sh | sh

# create symlinks
ln -s $(pwd)/.zshrc ~/.zshrc
mkdir -p ~/.config
ln -s $(pwd)/.config/starship.toml ~/.config/starship.toml
ln -s $(pwd)/.vimrc ~/.vimrc
ln -s $(pwd)/.zsh_plugins.txt ~/.zsh_plugins.txt

source ~/.zshrc
