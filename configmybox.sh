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

CONFIGS=(".zshrc" ".config/starship.toml" ".vimrc" ".zsh_plugins.txt" ".dircolors") 

CONFIGDIR=(".config/nvim")

echo "check for existing configs"

if [[ ! -e ~/.config ]]; then
  mkdir ~/.config
fi

for config in ${CONFIGS[@]}; do
  echo "checking for $config"
  if [[ -e $HOME/${config} ]]; then
    echo "backing up & removing $config"
    cp $HOME/$config $HOME/$config.$(date +%Y%m%d%H%M)
    rm $HOME/$config
  fi 
  # create symlinks
  ln -s $(pwd)/$config $HOME/$config
done

for configdir in ${CONFIGDIR[@]}; do
  echo "checking $configdir"
  if [[ -e $HOME/${configdir} ]]; then
    echo "backing up $configdir"
    mv $HOME/$configdir $HOME/$configdir.$(date +%Y%m%d%H%M)
  fi
  ln -s $(pwd)/$configdir $HOME/$configdir
done

#if [[ -e s.zshrc ]]; then
#  echo "found .zshrc"
#  cp s.zshrc $HOME/.zshrc.$(date +%Y%m%d)
#  # rm $config
#fi

# create symlinks
#ln -s $(pwd)/.zshrc ~/.zshrc
#mkdir -p ~/.config
#ln -s $(pwd)/.config/starship.toml ~/.config/starship.toml
#ln -s $(pwd)/.vimrc ~/.vimrc
#ln -s $(pwd)/.zsh_plugins.txt ~/.zsh_plugins.txt


source ~/.zshrc
