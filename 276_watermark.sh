#!/bin/bash
# Linux Journal issue 276 - April 2017
# Add a watermark to image(s)

predot=$(echo $1 | rev | cut -d. -f2- | rev)
postdot=$(echo $1 | rev | cut -d. -f1 | rev)
newname=$(echo ${predot}-wm.$postdot)

convert $1 -pointsize 80 -gravity east label:'Kosmas' -append $newname