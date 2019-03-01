#! /usr/bin/env nix-shell
#! nix-shell -i bash -p cryptsetup git

parted /dev/sda -- mklabel msdos
parted /dev/sda -- mkpart primary 1 512M
parted /dev/sda -- mkpart primary 512M -1

cryptsetup luksFormat --type luks2 --hash sha512 --cipher aes-xts-plain64 --key-size 512 /dev/sda2
cryptsetup luksOpen /dev/sda2 root

mkfs.vfat /dev/sda1
mkfs.xfs /dev/mapper/root

mount /dev/mapper/root /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot


mkdir /mnt/etc

git clone https://github.com/heijligen/infrastructure /mnt/etc/nixos

