#!/bin/bash
for file in audio-extract/*.{mkv,MKV}; do
    [ -e "$file" ] || continue
    ffmpeg -i "$file" -vn -c copy "$file".wav
done
