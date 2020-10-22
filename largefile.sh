#! /bin/bash
MINIMUM_FILE_SIZE=1024
NUMBER_OF_FILES=10000
output_dir="target"
DIR_LEVEL=6

if [ -d "/path/to/dir" ] 
then
	rm -rf $output_dir
fi

mkdir -p $output_dir

for (( x=1; x<=$DIR_LEVEL; x++ )); do
	tmp_dir=$output_dir
	if [ "$x" -gt 1 ]
	then
		tmp_dir="$tmp_dir/dir$x"
		mkdir -p $tmp_dir
	fi

    dir=$tmp_dir
	#file creation
	for (( y=1; y<=$NUMBER_OF_FILES; y++ )); do
	    dd if=/dev/urandom of=$dir/file$y.bin bs=1 count=$(( RANDOM + MINIMUM_FILE_SIZE )) 2> /dev/null
	    #dd if=/dev/zero of=file$.bin bs=1024 count=1
	done

done

