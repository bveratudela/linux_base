#!/bin/sh

DEV=/dev/sda1
MNT=/data

for i in $(cat hosts.txt)
do
    echo "########## ${i} ##########"
    ssh -o StrictHostKeyChecking=no -t ${USER}@${i} bash -c "'

        #### format and mount data disk

        mkfs.ext4 ${DEV}

        UUID=\$(blkid -o value /dev/sda1 | head -1)
        TYPE=\$(blkid -o value /dev/sda1 | tail -1)

        echo \"UUID=\${UUID} /data \${TYPE} defaults 1 2\" >> /etc/fstab

        mkdir ${MNT}
        mount ${MNT}
    '"
done
