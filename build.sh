#! /bin/bash

mkdir -p target

macro11 -rt11 -o target/susie.obj -l target/susie.lst src/susie.mac

if [ -d "/opt/pidp11" ]
then
    obj2bin.pl -rt11 --outfile=target/susie.bin target/susie.obj
    sudo cp target/susie.bin /opt/pidp11/systems/susie/
fi

