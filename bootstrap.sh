#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
mkdir  ~/github
cd ~/github
git@github.com:ldraney/ansible_desktop_setup.git
git clone git@github.com:ldraney/dotfiles.git
git@github.com:ldraney/sensitive.git
sudo ansible-pull -U ssh://git@github.com/ldraney/ansible_desktop_setup.git --key-file ~/.ssh/id_ed25519 --accept-host-key --ask-become-pass --check
