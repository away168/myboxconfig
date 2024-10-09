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

CONFIGS=(".zshrc" ".vimrc" ".zsh_plugins.txt" ".dircolors" ".p10k.zsh" ".tmux.conf" ".wezterm.lua") 

CONFIGDIR=(".config/nvim" ".git-template")

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

# tpm setup
if [[ ! -e ~/.tmux/plugins/tpm ]]; then
  mkdir -p ~/.tmux/plugins
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 
fi

# powerlevel10k setup
if [[ ! -e ~/code/powerlevel10k ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/code/powerlevel10k
fi
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


#source ~/.zshrc
