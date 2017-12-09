#!/bin/bash
for file in audio-extract/*.{mkv,MKV}; do
    [ -e "$file" ] || continue
    noPath=${file##*/}
    fileNameWithoutExtension=${noPath%.*}
    ffmpeg -i "$file" -vn -c copy "audio-extract/$fileNameWithoutExtension".wav
done
