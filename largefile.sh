#! /bin/bash
output_dir="target"
mkdir -p $output_dir
for n in {1..10}; do
    dd if=/dev/urandom of=$output_dir/file$n.bin bs=1 count=$(( RANDOM + 1024 ))
    #dd if=/dev/zero of=file$.bin bs=1024 count=1
done
