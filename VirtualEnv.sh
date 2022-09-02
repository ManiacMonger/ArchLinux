#!/bin/bash

pacman -S virt-manager qemu qemu-arch-extra edk2-ovmf 

systemctl enable libvirtd

usermod -aG libvirtd rahul

# echo "rahul ALL=(ALL) ALL" >> /etc/sudoers.d/rahul