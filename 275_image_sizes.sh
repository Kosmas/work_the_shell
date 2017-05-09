#!/bin/bash
# Linux Journal issue 275 - March 2017
# Run on a directory with images to display their sizes (*.JPG)

for image in *.JPG; do identify $image | cut -f1,3 -d\ ; done
