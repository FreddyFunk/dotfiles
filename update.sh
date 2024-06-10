#!/bin/zsh
set -e
set -o pipefail

# got to the dotfile directory
cd ~/dotfiles

# update dotfiles git origin from public https to private ssh
git remote set-url origin git@github.com:FreddyFunk/dotfiles.git

# update git repo
git pull --rebase

# run the playbook
ansible-playbook ~/dotfiles/vaultpw main.yaml
