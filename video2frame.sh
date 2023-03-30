#!/bin/sh

mkdir "$2"
ffmpeg -i "$1" -vf mpdecimate,setpts=N/FRAME_RATE/TB "$2/%08d.png"
