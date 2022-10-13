#!/bin/bash

pacman -S xorg-server

pacman -S xf86-video-intel 

pacman -S nvidia nvidia-utils nvidia-settings

# pacman -S 
# Gnome 
# pacman -s gnome
# systemctl enable gdm

# Plasma
# pacman -S plasma
# systemctl enable sddm