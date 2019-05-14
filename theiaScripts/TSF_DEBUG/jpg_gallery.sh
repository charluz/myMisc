#!/bin/sh

if [ $# -eq 0 ]; then
    echo "Usage: $0 directory"
    exit 0
fi

if [ ! -d $1 ]; then
    echo "No such directory: $1 !"
    exit 0
fi

swd=`pwd`
cd $1
dlist=`ls -l | grep ^d | awk '{ print $9 }'`

for d in $dlist; do
    cd $d;
    f=`ls -1 *.jpg`
    if [ -e $f ]; then
        echo "Copying $f to ../$d.jpg"
        cp $f ../$d.jpg
    fi
    cd ..
done

cd $swd
