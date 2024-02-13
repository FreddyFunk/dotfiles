#!/bin/zsh
set -e 
set -o pipefail

# got to the dotfile directory
cd ~/dotfiles

# update git repo
git pull --rebase

# run the playbook
ansible-playbook --vault-password-file ~/dotfiles/vaultpw main.yaml

