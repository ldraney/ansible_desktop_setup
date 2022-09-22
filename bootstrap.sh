#!/bin/bash

apt-get update
apt-get upgrade -y
eval "$(ssh-agent -s)"
ssh-add /home/ldraney/.ssh/id_ed25519
mkdir  /home/ldraney/github
cd /home/ldraney/github
git clone git@github.com:ldraney/ansible_desktop_setup.git
git clone git@github.com:ldraney/dotfiles.git
git clone git@github.com:ldraney/sensitive.git
ansible-pull -U ssh://git@github.com/ldraney/ansible_desktop_setup.git --key-file /home/ldraney/.ssh/id_ed25519 --accept-host-key --ask-become-pass
#sudo reboot now
