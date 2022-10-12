#!/bin/bash
#vmware shared folder
set -e    #I need to restart computer after this command for vm shared folder to be setup right, only if
# this gives an error
#echo vmhgfs-fuse /mnt/hgfs  fuse defaults,allow_other   0   0 | sudo tee -a /etc/fstab
#sudo mount -a
mkdir -p $HOME/.ssh
sudo chown -R ldraney:ldraney /mnt/hgfs
sudo cp -r /mnt/hgfs/VMShare/ssh/* $HOME/.ssh/

chmod 400 $HOME/.ssh/*
sudo chown -R ldraney:ldraney $HOME/.ssh

#rest of the install
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y git ansible

eval "$(ssh-agent -s)"
ssh-add $HOME/.ssh/id_ed25519

mkdir -p $HOME/github
cd $HOME/github

git clone git@github.com:ldraney/ansible_desktop_setup.git
git clone git@github.com:ldraney/dotfiles.git
git clone git@github.com:ldraney/sensitive.git

#use this for developing my ansible script
#ansible-pull -U ssh://git@github.com/ldraney/ansible_desktop_setup.git --key-file $HOME/.ssh/id_ed25519 --accept-host-key --ask-become-pass
cd $HOME/github/ansible_desktop_setup
sudo ansible-playbook local.yml
sudo reboot now
