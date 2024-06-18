#!/bin/zsh
set -e
set -o pipefail

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux
  echo "Detected supported OS: $OSTYPE"
  sh ~/dotfiles/scripts/init-linux.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  echo "Detected supported OS: $OSTYPE"
  sh ~/dotfiles/scripts/init-macos.sh
elif [[ "$OSTYPE" == "cygwin" ]]; then
  # POSIX compatibility layer and Linux environment emulation for Windows
  echo "Unsupported OS: $OSTYPE"
  exit 1;
elif [[ "$OSTYPE" == "msys" ]]; then
  # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
  echo "Unsupported OS: $OSTYPE"
  exit 1;
elif [[ "$OSTYPE" == "win32" ]]; then
  # Windows, lol
  echo "Unsupported OS: $OSTYPE"
  exit 1;
elif [[ "$OSTYPE" == "freebsd"* ]]; then
  # FreeBSD
  echo "Unsupported OS: $OSTYPE"
  exit 1;
else
  # Unknown
  echo "Unsupported OS: $OSTYPE"
  exit 1;
fi

# configure ssh keys
ansible-playbook ~/dotfiles/main.yaml --tags "ssh"

# deploy dotfiles
sh ~/dotfiles/update.sh
