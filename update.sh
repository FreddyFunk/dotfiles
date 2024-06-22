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
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS does not need escalated permissions for brew updates
  ansible-playbook main.yaml
else
  # all other OS require escalated privileges for updating packages
  ansible-playbook --ask-become-pass main.yaml
fi
