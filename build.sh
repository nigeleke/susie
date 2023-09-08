#! /bin/bash

mkdir -p target
if [ -d "/opt/pidp11" ]
then
    sudo cp simh/selections /opt/pidp11/systems/
fi

# Core programs...
#
echo Core
echo
programs=("susie" "dkinit" "boot")
for program in "${programs[@]}"
do
    echo $program
    macro11 -rt11 -o target/$program.obj -l target/$program.lst src/$program.mac

    if [ -d "/opt/pidp11" ]
    then
        obj2bin.pl -rt11 --outfile=target/$program.bin target/$program.obj

        sudo mkdir -p /opt/pidp11/systems/$program/
        sudo cp target/$program.bin /opt/pidp11/systems/$program/$program.bin
        sudo cp simh/$program/boot.ini /opt/pidp11/systems/$program/
    fi
done
echo

# Susie programs...
#
echo Susie
echo
programs=("load" "fido" "kt" "ft")
for program in "${programs[@]}"
do
    echo $program
    macro11 -rt11 -o target/$program.obj -l target/$program.lst src/sysmac.sue src/$program.sue

    if [ -d "/opt/pidp11" ]
    then
        obj2bin.pl -rt11 --outfile=target/$program.bin target/$program.obj

        if [ "$program" = "load" ]
	then
            sudo mkdir -p /opt/pidp11/systems/$program/
            sudo cp target/$program.bin /opt/pidp11/systems/$program/$program.bin
            sudo cp simh/$program/boot.ini /opt/pidp11/systems/$program/
	else
            sudo cp target/$program.bin /opt/pidp11/systems/boot/$program.bin
	fi
    fi
done
echo

