#!/bin/bash

ln -sf /usr/share/zoneinfo/Asia/Calcutta /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts

echo root:root | chpasswd

pacman -S grub efibootmgr os-prober ntfs-3g networkmanager tlp openssh
# mkdir /boot/efi
# mount /dev/sda1 /boot/efi

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB 

# disable os prober false in etc/default/grub
sed -i '63s/.//' /etc/default/grub

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable tlp 
systemctl enable fstrim.timer
# Some Basic Gui 

# pacman -S 

useradd -m -G wheel rahul
echo rahul:password | chpasswd

sed -i '85s/.//' /etc/sudoers

printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"

exit
