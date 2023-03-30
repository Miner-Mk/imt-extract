#!/bin/sh

FULL_NAME="my_full_video"
NAME="my_cut_video"

FULL_VIDEO="videos/${FULL_NAME}.mp4"
CUT_VIDEO="videos/${NAME}.mp4"
OUT_FOLDER="frames_${NAME}"

# Takes a section of video from the full version and outputs it to CUT_VIDEO
# ffmpeg is not very consistent in timings, so probably better to run this manually to make sure you have the section of video that you want
./cutvideo.sh "${FULL_VIDEO}" 00:05:42.5 00:06:06.998 "${CUT_VIDEO}"

# Gets every frame from CUT VIDEO and puts it into OUT_FOLDER
./video2frame.sh "${CUT_VIDEO}" "${OUT_FOLDER}"

# Main script that runs through every frame in OUT_FOLDER and creates OUT_FOLDER/raw.csv
./ocr.py "${OUT_FOLDER}"

# Remove duplicates and split numbers from letters, takes in and out csv's
./postprocess.py "${OUT_FOLDER}/raw.csv" "${OUT_FOLDER}/out.csv"

