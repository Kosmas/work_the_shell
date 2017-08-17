#!/bin/bash
# Linux Journal issue 278 - June 2017
# Analyzing song lyrics

url="http://www.mldb.org/search?mq=the+beatles&mm=2&si=1&ob=2"
output="lyrics-page."         # you can put these in /tmp
start=0                       # increment by 30, first page starts at zero
max=600                       # more than 20 pages of matches = artificial stop

while [ $start -lt $max ]
do
  curl -s "$url&from=$start" | sed 's/</\n</g' | grep 'href="song-' > $output$start
  if [ $(wc -l < $output$start) -eq 0 ] ; then
    # zero results page. let's stop, but let's remove it first
    echo "hit a zero results page with start = $start"
    rm "$output$start"
    break
  fi
  start=$(( $start + 30 ))    # increment by 30
done
