#!/bin/zsh
set -o pipefail

PACKAGES="git ansible ansible-lint"

DNF_CMD=$(command -v dnf)
YUM_CMD=$(command -v yum)
APT_GET_CMD=$(command -v apt-get)

set -e

echo "installing: $PACKAGES"

if [[ ! -z $DNF_CMD ]]; then
sudo dnf install $PACKAGES -y
elif [[ ! -z $APT_GET_CMD ]]; then
sudo apt-get $PACKAGES -y
elif [[ ! -z $YUM_CMD ]]; then
sudo yum install $PACKAGES -y
else
echo "no package manager found for installing $PACKAGE"
exit 1;
fi
