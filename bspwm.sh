#!/bin/bash

sudo pacman -Syy

# sudo firewall-cmd --add-port=1025-65535/tcp --permanent
# sudo firewall-cmd --add-port=1025-65535/udp --permanent
# sudo firewall-cmd --reload
# sudo virsh net-autostart default

# git clone https://aur.archlinux.org/pikaur.git
# cd pikaur/
# makepkg -si --noconfirm

#pikaur -S --noconfirm lightdm-slick-greeter 
#pikaur -S --noconfirm lightdm-settings
# pikaur -S --noconfirm polybar
#pikaur -S --noconfirm nerd-fonts-iosevka
#pikaur -S --noconfirm ttf-icomoon-feather

echo "MAIN PACKAGES"

sleep 5

sudo pacman -S --noconfirm xorg light-locker lightdm bspwm sxhkd firefox rxvt-unicode picom nitrogen lxappearance dmenu nautilus simplescreenrecorder alsa-utils pulseaudio alsa-utils pulseaudio-alsa pavucontrol arc-gtk-theme arc-icon-theme obs-studio vlc  archlinux-wallpaper rofi playerctl scrot dunst pacman-contrib

sudo systemctl enable lightdm

mkdir -p .config/{bspwm,sxhkd,dunst}

install -Dm755 /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc
install -Dm644 /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc

printf "\e[1;32mCHANGE NECESSARY FILES BEFORE REBOOT\e[0m"

