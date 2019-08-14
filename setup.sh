#!/bin/bash
# TODO:
# - gnome-terminal
#   - font: M+ 1mn regular
#   - color: text/background=Solarized Dark, palette=Solarized
#   - add 'Custom GNOME Terminal' to startups
# - gnome-session-properties (set startup)
#   - add 'gnome-terminal --hide-menubar --full-screen
# - virtualbox preference
#   - input: uncheck 'Auto Capture Keyboard '
#   - hide menubar
#   - hide statusbar

# apt
sudo apt update
sudo apt -y upgrade

# ja
sudo apt -y install fonts-mplus
sudo update-locale LANG=ja_JP.UTF-8

# zsh
sudo apt -y install zsh
sudo chsh -s $(which zsh) $USER

# tmux
sudo apt -y install tmux
# vim (use vim-gnome just for +clipboard)
sudo apt -y install vim-gnome

# uim
sudo apt -y install uim-fep uim-anthy
cat << EOF > ~/.uim
(define default-im-name 'anthy)
(define-key generic-on-key? '("<Control> "))
(define-key generic-off-key? '("<Control> "))
EOF

# git
sudo apt -y install git

# build-essential (mainly for virtualbox guestadditions)
sudo apt -y install build-essential dkms linux-headers-$(uname -r)

# apt cleanup
sudo apt -y autoremove

# setup dotfiles
pushd ~
git clone https://github.com/higuri/dotfiles
pushd dotfiles
. install.sh
popd # dotfiles
popd # ~
foo
