# dotfiles

![image](https://github.com/FreddyFunk/dotfiles/assets/27208977/711d3ead-2e26-4c7b-a31d-ffc0d132ece6)


## Goal

I use various devices running macOS, Windows (with WSL) and various Linux Distors on a daily bases for work and in my spare time. Keeping my work environment consitant becomes annoying and error prune, when hopping devices. Additionally, I take this as a chance for a lerning investment in a keyboard focused work flow, deep dive into the TUI rabbit hole and have some fun in the terminal.


## Why Ansible?

One of the best tools for automated infrastructure provisioning is Ansible. I happen to have used Ansible to deploy various applications and infrastuctures in the past, so why not deploy my own work environment with it?


## Requirements

Currently only `macOS` is supported and tested.

### macOS Key Binding Conflicts

#### tmux pane resizing vs Misson Control / Dock

- `Settings -> Keyboard -> Keyboard Shortcuts... -> Mission Control -> Mission Control` from `ctrl + ↑` to `ctrl + cmd + ↑`
- `Settings -> Keyboard -> Keyboard Shortcuts... -> Mission Control -> Application windows` from `ctrl + ↓` to `ctrl + cmd + ↓`
- `Settings -> Keyboard -> Keyboard Shortcuts... -> Mission Control -> Mission Control -> Move left a space` from `ctrl + ←` to `ctrl + cmd + ←`
- `Settings -> Keyboard -> Keyboard Shortcuts... -> Mission Control -> Mission Control -> Move right a space` from `ctrl + →` to `ctrl + cmd + →`


## Setup

```bash
git clone https://github.com/FreddyFunk/dotfiles.git ~/dotfiles
echo "SuperSecurePassword" > ~/dotfiles/vaultpw
sh ~/dotfiles/init.sh
```

## Update

Once the `init.sh` script was executed, you can do a full update of the dotfiles running the following simple command:
```bash
dotu
```

## Credentials & Sensitive Data

All kind of credentials like `keys`, `tokens` and `passwords` are securely stored as AES256 encrypted variables using [Ansible Vault](https://docs.ansible.com/ansible/latest/vault_guide/index.html). 

Securing sensitive data like personal or work related e-mail addresses are also rather important, since this repository available to the public. Therefore, all sensitive data is also encrypted.

It is expected that the user manually stores the Ansible Vault password in a plain file located at `~/dotfiles/vaultpw`.

To add encrypt values do the following:

```bash
# string
ansible-vault encrypt_string --vault-password-file $HOME/dotfiles/vaultpw "mynewsecret" --name "MY_SECRET_VAR"
# file
cat myfile.conf | ansible-vault encrypt_string --vault-password-file $HOME/dotfiles/vaultpw --stdin-name "myfile"
```

You can pipe the output of ansible-vault directly to the clipboard by appending the following command:
  - macOS: `| pbcopy`
  - Linux: `| xclip -selection clipboard`

## Running specific role

´´´bash
ansible-playbook --vault-password-file ~/dotfiles/vaultpw main.yaml --tags "role_name"
´´´

## Credits

This setup is heavily inspired by:

- @techdufus (https://github.com/techdufus/dotfiles)
- @mischavandenburg (https://github.com/mischavandenburg/dotfiles)

