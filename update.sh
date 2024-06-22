#!/bin/zsh
set -e
set -o pipefail

SELECTED_ANSIBLE_ROLES=$1

# got to the dotfile directory
cd ~/dotfiles

# update dotfiles git origin from public https to private ssh
git remote set-url origin git@github.com:FreddyFunk/dotfiles.git

# update git repo
git pull --rebase --autostash

ANSIBLE_RUN_COMMAND="ansible-playbook"
if [[ "$OSTYPE" != "darwin"* ]]; then
  # macOS does not need escalated permissions for brew updates
  # all other OS require escalated privileges for updating packages
  ANSIBLE_RUN_COMMAND+=" --ask-become-pass"
fi

# run the playbook
if [[ -n "$SELECTED_ANSIBLE_ROLES" ]]; then
  $ANSIBLE_RUN_COMMAND main.yaml --tags $SELECTED_ANSIBLE_ROLES
else
  $ANSIBLE_RUN_COMMAND main.yaml
fi
