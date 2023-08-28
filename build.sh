#! /bin/bash

mkdir -p target

macro11 -rt11 -o target/susie.obj -l target/susie.lst src/susie.mac
macro11 -rt11 -o target/dkinit.obj -l target/dkinit.lst src/dkinit.mac
macro11 -rt11 -o target/boot.obj -l target/boot.lst src/boot.mac

macro11 -rt11 -o target/load.obj -l target/load.lst src/sysmac.sue src/load.sue
macro11 -rt11 -o target/fido.obj -l target/fido.lst src/sysmac.sue src/fido.sue

if [ -d "/opt/pidp11" ]
then
    obj2bin.pl -rt11 --outfile=target/susie.bin target/susie.obj
    obj2bin.pl -rt11 --outfile=target/dkinit.bin target/dkinit.obj
    obj2bin.pl -rt11 --outfile=target/boot.bin target/boot.obj

    obj2bin.pl -rt11 --outfile=target/load.bin target/load.obj
    obj2bin.pl -rt11 --outfile=target/fido.bin target/fido.obj

    sudo cp simh/selections /opt/pidp11/systems/

    sudo mkdir -p /opt/pidp11/systems/susie/
    sudo cp target/susie.bin /opt/pidp11/systems/susie/susie.bin
    sudo cp simh/susie/boot.ini /opt/pidp11/systems/susie/

    sudo mkdir -p /opt/pidp11/systems/dkinit/
    sudo cp target/dkinit.bin /opt/pidp11/systems/dkinit/dkinit.bin
    sudo cp simh/dkinit/boot.ini /opt/pidp11/systems/dkinit/

    sudo mkdir -p /opt/pidp11/systems/boot/
    sudo cp target/boot.bin /opt/pidp11/systems/boot/boot.bin
    sudo cp simh/boot/boot.ini /opt/pidp11/systems/boot/

    sudo mkdir -p /opt/pidp11/systems/load/
    sudo cp target/load.bin /opt/pidp11/systems/load/load.bin
    sudo cp simh/load/boot.ini /opt/pidp11/systems/load/

    sudo cp target/fido.bin /opt/pidp11/systems/boot/fido.bin
fi
