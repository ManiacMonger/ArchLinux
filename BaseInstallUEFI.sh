#!/bin/bash

ln -sf /usr/share/zoneinfo/Asia/Calcutta /etc/localtime
hwclock --systohc

# sed -i '177s/.//' /etc/locale.gen

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "ROG" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 ROG.localdomain ROG" >> /etc/hosts

# echo root:root | chpasswd

pacman -S grub grub-theme-vimix efibootmgr os-prober ntfs-3g networkmanager wireless_tools iw iwd net-tools tlp openssh dialog wpa_supplicant mtools dosfstools xdg-user-dirs xdg-utils gvfs bluez bluez-utils alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack acpi acpid acpi_call sof-firmware 

# pacman -S network-manager-applet avahi gvfs-smb nfs-utils inetutils dnsutils cups hplip rsync virt-manager qemu qemu-arch-extra edk2-ovmf bridge-utils dnsmasq vde2 openbsd-netcat iptables-nft ipset firewalld flatpak nss-mdns terminus-font

# mkdir /boot/efi
# mount /dev/sda1 /boot/efi

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB 

# disable os prober false in etc/default/grub
sed -i '63s/.//' /etc/default/grub
echo 'GRUB_THEME="/usr/share/grub/themes/Vimix/theme.txt"' >> /etc/default/grub

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable tlp 
systemctl enable acpid
systemctl enable bluetooth
systemctl enable fstrim.timer

# Some Basic Gui 

# pacman -S 

useradd -m -G wheel,video rahul
# echo rahul:password | chpasswd

sed -i '85s/.//' /etc/sudoers

printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"

exit
