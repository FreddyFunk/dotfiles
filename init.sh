#!/bin/zsh
set -e 
set -o pipefail

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# update brew
brew update && brew upgrade

# get ansible on the system
brew install ansible

# deploy dotfiles
sh ~/dotfiles/update.sh
