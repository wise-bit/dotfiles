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

# set up snap

sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt install -y snapd



