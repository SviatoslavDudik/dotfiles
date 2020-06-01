#!/bin/sh

TMPFILE="$1"

DIR=$(mktemp -d)
cp "$TMPFILE" "$DIR/preview"
TMPFILE="$DIR/preview"

if [ -z "$TMUX" ]; then
	vim "+set encoding=utf-8" "+set filetype=mail" "+set nofoldenable" "+set nomodifiable" "$TMPFILE"
else
	tmux split-window -v -l 80% \
		vim "+set encoding=utf-8" "+set filetype=mail" "+set nofoldenable" "+set nomodifiable" "$TMPFILE"
fi
