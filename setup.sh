#!/bin/bash

# apt
sudo apt update
sudo apt -y upgrade

# LANG
sudo apt -y install language-pack-ja
sudo apt -y install fonts-mplus
sudo update-locale LANG=ja_JP.UTF-8

# zsh
sudo apt -y install zsh
sudo chsh -s $(which zsh) $USER
# tmux
sudo apt -y install tmux
# vim (use vim-gnome just for +clipboard)
sudo apt -y install vim-gnome

# gnome-terminal
# TODO: gnome-terminal profile
#  - font: M+ 1mn regular
#  - color: text/background=Solarized Dark, palette=Solarized
# TODO: gnome tweak tools
#  - add 'My GNOME Terminal' to startups
sudo apt -y install gnome-terminal
cat << EOF  /usr/share/applications/my-gnome-terminal.desktop
[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=My GNOME Terminal
Comment=Start GNOME Terminal with specific arguments
Exec=gnome-terminal --hide-menubar --full-screen -e 'tmux'
Terminal=false
EOF

# uim
sudo apt -y install uim-fep uim-anthy
cat << EOF > ~/.uim
(define default-im-name 'anthy)
(define-key generic-on-key? '("<Control> "))
(define-key generic-off-key? '("<Control> "))
EOF

# git
sudo apt -y install git
git config --global user.name "Yusuke Higuchi"
git config --global user.email "higuri36@gmail.com"

# configurations for VirtualBox Guest
# - disable <Alt> <Super>
cat << EOF > ~/.Xmodmap   
clear mod1
clear mod2
clear mod4
keycode 64 = NoSymbol
keycode 133 = NoSymbol
keycode 134 = NoSymbol
EOF

# - build-essential
# TODO: test `sudo apt-get install virtualbox-guest-dkms`
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
