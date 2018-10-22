#!/bin/bash
#
# How to Execute:
# $ su root
# # apt update
# # apt -y install sudo
# # add user ${username} sudo
# # apt install git
# # exit
# $ git clone https://github.com/higuri/debsetup
# $ pushd debsetup
# $ . .install.sh
# $ popd
# $ rm -r debsetup
#
# initialize passwd for su (Ubuntu)
# $ sudo su -
# # passwd
# # ...
# # exit
#

username=higuri

# install packages
sudo apt update
sudo apt upgrade
# sudo
# zsh
sudo apt -y install zsh
sudo chsh -s $(which zsh) ${username}
# vim, tmux, python3
sudo apt -y install vim-nox
sudo apt -y install tmux
sudo apt -y install python3
sudo apt autoremove

# gnome settings
# TODO: gnome-terminal profile
#       - color scheme, pallete (solarized)
#       - font (M plus)
#       - full screen, no menubar
# pushd gnome
# python gnome/set_customshortcut.py
# popd

# setup dotfiles
pushd ~
git clone https://github.com/higuri/dotfiles
pushd dotfiles
. install.sh
popd
popd
