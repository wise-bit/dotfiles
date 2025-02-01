#!/bin/bash

read -p "email address: " email

if [[ -z "$email" ]]; then
  echo "email address cannot be empty... exiting."
  exit 1
fi

read -p "enter your git username: " username

if [[ -z "$username" ]]; then
  echo "username cannot be empty... exiting."
  exit 1
fi

ssh-keygen -t ed25519 -C "$email"

if [[ $? -eq 0 ]]; then
  echo "SSH key pair generated successfully."
else
  echo "failed to generate SSH key pair... exiting."
  exit 1
fi

git config --global user.email "$email"
git config --global user.name "$username"

# other git configs
git config --global pull.rebase false
git config --global core.editor "vim"
git config --global pager.branch false

echo "public SSH key is:"
cat ~/.ssh/id_ed25519.pub

