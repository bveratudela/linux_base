#!/bin/sh

for i in $(cat hosts.txt)
do
    echo "########## ${i} ##########"
    ssh -o StrictHostKeyChecking=no -t ${USER}@${i} bash -c "'
        $@
    '"
done
