#!/bin/bash
# Linux Journal issue 276 - April 2017
# Run on a directory with images to display details of images
# bigger than 8MB (Facebook Open Graph)

for name in $(find . -iname '*.jpg' -size +8M -print)
do
  dimensions=$(identify $name | cut -d' ' -f3)
  size=$(identify $name | cut -d' ' -f7)
  echo "File $name ($dimensions) has file size $size"
done