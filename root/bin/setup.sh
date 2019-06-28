#!/bin/sh

DEV=/dev/sda1
MNT=/data
PASS=$(cat password.txt)

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

        #### mount shared media disk
        mkdir /media
        mount.cifs -o username=bveratudela,password=${PASS} //vbox/Media /media

    '"
done
