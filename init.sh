#!/bin/zsh
set -e
set -o pipefail

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# add brew to path
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/$(whoami)/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# update brew
brew update && brew upgrade

# get ansible on the system
brew install ansible

# configure ssh keys
ansible-playbook --vault-password-file ~/dotfiles/vaultpw ~/dotfiles/main.yaml --tags "ssh"

# deploy dotfiles
sh ~/dotfiles/update.sh
