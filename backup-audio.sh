#!/bin/bash
for file in audio-backup/*; do mv "$file" `echo $file | tr ' ' '-'` ; done
for file in audio-backup/*.{WAV,wav}; do
    [ -e "$file" ] || continue
    dateStamp=$(date -r "$file" +"%Y-%m-%d-%H%M%S")
    noPath=${file##*/}
    fileNameWithoutExtension=${noPath%.*}
    convert -background 'rgb(8,132,114)' -fill white -font /Users/branden/Library/Fonts/OpenSans-Bold.ttf -size 600x400 caption:"$dateStamp-$fileNameWithoutExtension" still.png
    ffmpeg -loop 1 -framerate 2 -i still.png -i "$file" -c:v libx264 -preset medium -tune stillimage -crf 18 -c:a copy -shortest -pix_fmt yuv420p "audio-backup/$dateStamp-$fileNameWithoutExtension".mkv
done
