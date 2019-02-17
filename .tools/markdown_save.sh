#!/bin/sh

file=$(readlink -f "$1")
dir=$(dirname "$file")
base="${file%.*}"

cd "$dir" || exit
cp -u "$file" ~/Dropbox/Markdown/ && \
cp -u "$file" ~/Dropbox/Markdown/txt/"${base##*/}.txt"

