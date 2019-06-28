#!/bin/sh

CMD=$@
USER=root

for i in 1 2 3 4
do
    echo "########## nuc0${i} ##########"
    ssh ${USER}@nuc0${i} "${CMD}"
done
