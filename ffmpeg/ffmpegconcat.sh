#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: `basename $0` input_1.mp4 input_2.mp4 ... output.mp4"
    exit 0
fi

ARGS=("$@") # determine all arguments
output=${ARGS[${#ARGS[@]}-1]} # get the last argument (output file)
unset ARGS[${#ARGS[@]}-1] # drop it from the array

ffmpeg -f concat -safe 0 -i <(for f in "${ARGS[@]}"; do echo "file '$PWD/$f'"; done) -vcodec copy -acodec copy $output
