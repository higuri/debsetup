#!/bin/bash
#
# How to Execute:
# $ su
# $ apt update
# $ apt install git
# $ exit
# $ git clone https://github.com/higuri/debsetup
# $ pushd debsetup
# $ . .install.sh
# $ popd
# $ rm -r debsetup
#

# install packages
# TODO: istall VBox GuestAdditions
su
apt update
apt upgrade
apt -y install vim
apt -y install screen
apt -y install python3
exit    # su -> user
#apt -y install git

# gnome settings
# TODO: gnome-terminal profile
#       - color scheme, pallete (solarized)
#       - font (M plus)
#       - full screen, no menubar
pushd gnome
python gnome/set_customshortcut.py
popd

# setup dotfiles
pushd ~
git clone https://github.com/higuri/dotfiles
pushd dotfiles
. install.sh
popd
popd
