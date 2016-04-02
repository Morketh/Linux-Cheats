#!/bin/bash
path=$1   # Starting path to the directory of the junk files
var=0     # How many records were processed
SECONDS=0 # reset the clock so we can time the event

clear

if [[ -z $1 ]]; then
    echo "Argument list is empty: $1 and $2"
fi

echo "Searching $1 for file types and then moving all files into grouped folders."

# add extentions here for fast matching
for ext in jpg mp3 txt locky mp4; do
    mkdir -p "$ext"
    # For simplicity, I'll assume your mv command supports the -t option
    find "$1" -name "*.$ext" -exec mv -t "$ext" {} +
done

# now that we've moved all the easy ones lets look at each file one-on-one
for f in "$1"/*; do
    ((var++))
    ext=${f##*.}
    # Probably more efficient to check in-shell if the directory
    # already exists than to start a new process to make the check
    # for you.
    [[ -d $ext ]] || mkdir "$ext"
    mv "$f" "$ext"
done

diff=$SECONDS
echo "$var Files found and orginized in:"
echo "$(($diff / 3600)) hours, $((($diff / 60) % 60)) minutes and $(($diff % 60)) seconds."

echo "cleaning up empty directories....."
find . -type d -size 0c -delete
