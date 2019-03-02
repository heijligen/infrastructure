#! /usr/bin/env nix-shell
#! nix-shell -i bash -p git

NAME=$1

parted /dev/sda -- mklabel msdos
parted /dev/sda -- mkpart primary 1 -1

mkfs.xfs -f /dev/sda1
mount /dev/sda1 /mnt
mkdir /mnt/etc

git clone https://github.com/heijligen/infrastructure /mnt/etc/nixos
ln -s /mnt/etc/nixos/$NAME.nix /mnt/etc/nixos/configuration.nix
