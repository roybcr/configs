#!/bin/sh

# back.sh
# A script that takes a number as an argument
# and moves up the specified number of directories 
# in the directory tree.

if [ -z "$1" ]; then # Check if a number is passed as an argument
  echo \
  "No argument provided." \
  "Please provide a number as an argument."
  exit 1
fi

dir=""
for _ in $(seq 1 "$1"); do
  dir="$dir../" 
done

cd "$dir" || exit 1
