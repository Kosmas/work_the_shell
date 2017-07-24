#!/bin/bash
# Linux Journal issue 277 - May 2017
# YouTube downloader

youtubedl="/usr/local/bin/youtube-dl"
audioflags="-x --audio-format mp3"
videoflags="-f mp4"
flags=$videoflags                   # default set of command flags
audioonly=0                         # default is audio + video

if [ $# -eq 0 ] ; then
  echo "Usage: $(basename $0) {-a} YouTubeURL {outputfile}"
  echo " where -a extracts the audio portion in MP3 format"
  exit 1
fi

if [ "$1" = "-a" ] ; then
  audioonly=1
  flags=$audioflags
  shift
fi

if [ $# -eq 1 ] ; then
  # no output filename specified
  outfile=$(echo "$1" | cut -d= -f2)
  if [ $audioonly -eq 1 ] ; then
    outfile="$outfile.mp3"
  else
    outfile="$outfile.mp4"
  fi
else
  outfile="$2"
fi

$youtubedl $flags -o "$outfile" "$1"

