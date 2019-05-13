#!/bin/sh

# echo $#

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
#echo $dirlist

for d in $dlist; do
    # echo $d;
    cd $d;
    f=`ls -1 *.jpg`
    # echo $f
    if [ -e $f ]; then
        # echo $f
        echo "Copying $f to ../$d.jpg"
        cp $f ../$d.jpg
    fi
    cd ..
    # echo `pwd`
done

cd $swd
