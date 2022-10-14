#!/bin/bash

git clone --recurse-submodules https://github.com/fairyglade/ly

cd ly && make 

# make run
make install installsystemd
systemctl enable ly

# /etc/ly/config.ini

sudo pacman -S bc feh imagemagick xorg-xdpyinfo

# git clone https://aur.archlinux.org/i3lock-color.git
# cd i3lock-color && makepkg -si

git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color && ./install-i3lock-color.sh

# automatic install
wget https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/main/install.sh -O - -q | sudo bash -s system

# cp /usr/share/doc/betterlockscreen/examples/betterlockscreenrc ~/.config

# git clone https://aur.archlinux.org/betterlockscreen.git
# cd betterlockscreen && makepkg -si