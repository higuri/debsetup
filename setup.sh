#!/bin/bash

username=higuri

# apt
sudo apt update
sudo apt -y upgrade

# LANG
sudo apt -y install language-pack-ja
sudo apt -y install fonts-mplus
sudo update-locale LANG=ja_JP.UTF-8

# zsh
sudo apt -y install zsh
sudo chsh -s $(which zsh) ${username}

# git
sudo apt -y install git
git config --global user.name "Yusuke Higuchi"
git config --global user.email "higuri36@gmail.com"

# vim, tmux, python3
sudo apt -y install vim-nox
sudo apt -y install tmux
sudo apt -y install python3

# gnome-terminal
# TODO: gnome-terminal profile
#  - font: M+ 1mn regular
#  - color: text/background=Solarized Dark, palette=Solarized
sudo apt -y install gnome-terminal dbus-x11
dbus-uuidgen | sudo tee /etc/machine-id
# TODO: uim-fep -e tmux
cat << EOF > ~/.zprofile
if [ -z "\$TMUX" ]; then
    DISPLAY=localhost:0.0 gnome-terminal --hide-menubar -- tmux
fi
EOF

# uim
sudo apt -y install uim-fep uim-anthy
cat << EOF > ~/.uim
(define default-im-name 'anthy)
(define-key generic-on-key? '("<Control> "))
(define-key generic-off-key? '("<Control> "))
EOF

# build-essential: mainly for VirtualBox Guest Additions
sudo apt -y install build-essential module-assistant

# apt cleanup
sudo apt -y autoremove

# setup dotfiles
pushd ~
git clone https://github.com/higuri/dotfiles
pushd dotfiles
. install.sh
popd # dotfiles
popd # ~
