#!/bin/sh

DEV=/dev/sda1
MNT=/data

mkfs.ext4 ${DEV}

UUID=$(blkid -o value /dev/sda1 | head -1)
TYPE=$(blkid -o value /dev/sda1 | tail -1)

echo "UUID=${UUID} /data ${TYPE} defaults 1 2" >> /etc/fstab

mkdir ${MNT}
mount ${MNT}
