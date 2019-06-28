#!/bin/sh

FILE=$1
USER=root
PATH=$2

for i in $(cat hosts.txt)
do
    echo "########## ${i} ##########"
    /usr/bin/scp ${FILE} ${USER}@${i}:${PATH}
done
