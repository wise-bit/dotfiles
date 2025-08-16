#!/bin/bash

# run dependent scripts

./setup_lazyvim.sh
./setup_sshkey_git.sh


sudo apt update


# install packages

sudo apt install -y bat

if ! grep -q "alias bat=batcat" ~/.zshrc; then
  echo "alias bat=batcat" >> ~/.zshrc
fi


sudo apt install -y autojump

echo ". /usr/share/autojump/autojump.zsh" >> ~/.zshrc
chmod 755 /usr/share/autojump/autojump.zsh


# set up snap

sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt install -y snapd

