#!/bin/sh
#
# Example: ./cutvideo.sh input.mp4 00:03:36 00:05:07 output.mp4

ffmpeg -i "$1" -ss "$2" -to "$3" -codec copy "$4"
