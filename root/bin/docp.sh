#!/bin/sh

FILE=$1
USER=root
PATH=$2

for i in 1 2 3 4
do
    echo "########## nuc0${i} ##########"
    /usr/bin/scp ${FILE} ${USER}@nuc0${i}:${PATH}
done
