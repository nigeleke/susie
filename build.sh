#! /bin/bash


for dir in ./*/
do
    echo "Compilig program $dir..."
    cd "$dir"

    for file in *.mac; do 
        if [ -f "$file" ]; then 
            echo "Compiling file $file..."
	    base=$(basename "$file" .mac)
	    objfile="$base.obj"
	    lstfile="$base.lst"
	    macro11 -o "$objfile" -l "$lstfile" "$file"
        fi 
    done

    cd ..

done

obj2bin.pl --verbose --outfile=target/test.bin susie/test.obj

sudo cp target/test.bin /opt/pidp11/systems/susie/
sudo cp simh/boot.ini /opt/pidp11/systems/susie/
