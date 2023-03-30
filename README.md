# imt-extract

## Installation

Requires command line requires: ffmpeg imagemagick 
         
Python requires: pillow opencv numpy

May have missed some and needs to be checked for sure.

## Execution

run_example.sh shows a usual execution of each script.

Probably this is not robust enough yet to just throw everything through an end-to-end script, so probably will be best to run each script separately and check things work first.

## Asset extraction

Templates for the ocr to match against are stored in the assets folder.

assets/raw contains extract.sh that was used to generate the assets from the original frames in the same folder (which haven't been included in the repository).

Modify the extraction script as necessary to generate any new assets needed.
