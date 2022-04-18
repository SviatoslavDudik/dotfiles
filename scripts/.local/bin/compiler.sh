#!/bin/bash

file=$(readlink -f "$1")
dir=$(dirname "$file")
base="${file%.*}"

cd "$dir" || exit

update_pdf() {
	pid=`ps ax | grep mupdf | grep "${base##*/}.pdf" | grep -v grep | awk '{print $1}'`
	if [ $pid ]; then
		kill -1 $pid
	fi
}

cfile() {
	if [ -e Makefile ]; then
		make && ./`cat Makefile | sed -e '/:/q; /.*$/d' Makefile | sed -e 's/:.*//g'`
	else
		gcc "$file" -o "$base" && "./$base"
	fi
}

javafile() {
	if [ -e Makefile ]; then
		make
	else
		javac "$file"
	fi
}

latex() {
	if [ -e "$base.glo" ]; then
		pdflatex "$file"
		makeglossaries "$base"
	fi
	pdflatex "$file"
	update_pdf
}

[ -e Makefile ] && make all && exit

case "$file" in
	*\.c|*\.h) cfile ;;
	*\.py) python "$file" ;;
	*\.java) javafile ;;
	*\.sh) chmod u+x "$file" ;;
	*\.tex) latex ;;
	*\.md) pandoc "$file" -o "$base".pdf && update_pdf ;;
	*\.ms) refer -PS -e "$file" | groff -ms -kejpt -T pdf > "$base".pdf && update_pdf ;;
	*) echo "doesn't support this extention" || exit 1 ;;
esac

