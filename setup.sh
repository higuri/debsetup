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

# apt
sudo apt update
sudo apt -y upgrade
# LANG
sudo apt -y install language-pack-ja
sudo apt -y install fonts-ipafont
sudo update-locale LANG=ja_JP.UTF-8
# gnome-terminal
# for WSL:
#  1. (win) install VcXsrv
#  2. (win) run "C:\Program Files\VcXsrv\vcxsrv.exe" :0 -ac -terminate -lesspointer -multiwindow -clipboard -wgl -dpi auto
#  3. (deb) DISPLAY=localhost:0 gnome-terminal -e uim-fep
# - 
# TODO: gnome-terminal profile
#       - color scheme, pallete (solarized)
#       - font (M plus)
#       - full screen, no menubar
# pushd gnome
# python gnome/set_customshortcut.py
# popd
sudo apt -y install gnome-terminal dbus-x11
dbus-uuidgen | sudo tee /etc/machine-id
# uim
sudo apt -y install uim-fep uim-anthy
cat << EOF > ~/.uim
(define default-im-name 'anthy)
(define-key generic-on-key? '("<Control> "))
(define-key generic-off-key? '("<Control> "))
EOF
# zsh
sudo apt -y install zsh
sudo chsh -s $(which zsh) ${username}
# vim, tmux, python3
sudo apt -y install vim-nox
sudo apt -y install tmux
sudo apt -y install python3
sudo apt -y autoremove

# setup dotfiles
pushd ~
git clone https://github.com/higuri/dotfiles
pushd dotfiles
. install.sh
popd
popd
