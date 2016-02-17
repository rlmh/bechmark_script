#!/bin/bash
file='benchmark_results.txt'
echo 'Benchmark,Status' > $file
## find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c "cd '{}' && make clean && make && ./'{}'" \;
for directory in ./*
do
        (cd $directory && make && ./$directory;)
        if [ $? -eq 0 ]; then
                echo "$directory, pass" >> $file;
        else
                echo "$directory, fail" >> $file;
        fi
done
