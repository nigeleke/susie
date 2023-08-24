#! /bin/bash

mkdir -p target

macro11 -rt11 -o target/susie.obj -l target/susie.lst src/susie.mac
macro11 -rt11 -o target/dkinit.obj -l target/dkinit.lst src/dkinit.mac

if [ -d "/opt/pidp11" ]
then
    obj2bin.pl -rt11 --outfile=target/susie.bin target/susie.obj
    obj2bin.pl -rt11 --outfile=target/dkinit.bin target/dkinit.obj

    sudo cp simh/selections /opt/pidp11/systems/

    sudo mkdir -p /opt/pidp11/systems/susie/
    sudo cp target/susie.bin /opt/pidp11/systems/susie/susie.bin
    sudo cp simh/susie/boot.ini /opt/pidp11/systems/susie/

    sudo mkdir -p /opt/pidp11/systems/dkinit/
    sudo cp target/dkinit.bin /opt/pidp11/systems/dkinit/dkinit.bin
    sudo cp simh/dkinit/boot.ini /opt/pidp11/systems/dkinit/
fi
