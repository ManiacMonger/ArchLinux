# Arch Linux Basic Installation

> ## Steps :-

   => Update the System Clock

      timedatectl set-ntp true

   => Backup and Update mirrorlist
      sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak

      reflector --download-timeout 60 --country India --age 12 --protocol https --sort rate



1. Update package database


   > `pacman -Syy`

2. Partition the disk

   > ```shell
   > # fdisk -l
   > # fdisk /dev/sdX -l
   > # fdisk /dev/sdX
   > ```

   | Mount point | Partition | Partition type        |    Suggested size |
   | ----------- | --------- | --------------------- | ----------------: |
   | mnt/boot    | /dev/sda4 | EFI system partition  |  At least 300 MiB |
   | [SWAP]      | /dev/sda5 | Linux swap            | More than 512 MiB |
   | /mnt        | /dev/sda6 | Linux x86-64 root (/) |         Remaining |

3. Format the partitions
   <!--
      > - root partition
      >
      > > `# mkfs.ext4 /dev/sdZ`
      >
      > - swap Partition
      >
      > > `# mkswap /dev/sdY`
      >
      > - efi Partition
      >
      > > `# mkfs.fat -F 32 /dev/sdX` -->

   > ```shell
   > # mkfs.fat -F 32 /dev/sd4
   > # mkswap /dev/sd5
   > # mkfs.ext4 /dev/sda6
   > ```

4. Mount the partitions

   > ```shell
   > # mount --mkdir /dev/sda4 /mnt/boot
   > # swapon /dev/sda5
   > # mount /dev/sda6 /mnt
   > ```

5. Install The base Packages

   > `pacstrap /mnt base base-devel linux linux-firmware git vim intel-ucode bash-completion`

6. Generate FSTAB

   > `genfstab -U /mnt >> /mnt/etc/fstab`

7. Chroot

   > `arch-chroot /mnt`

8. Downlaod Repo and execute.
