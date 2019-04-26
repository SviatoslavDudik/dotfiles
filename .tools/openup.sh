#!/bin/sh

file=$(readlink -f "$1")
dir=$(dirname "$file")
base="${file%.*}"

cd "$dir" || exit

pdf_file() {
	pid=`ps ax | grep mupdf | grep "${base##*/}.pdf" | grep -v grep | awk '{print $1}'`
	if [ $pid ]; then
		# send signal to reload
		kill -1 $pid
	else
		mupdf "${base}.pdf" &
	fi
}

c_file() {
	if [ -e Makefile ]; then
		./`cat Makefile | sed -e '/:/q; /.*$/d' Makefile | sed -e 's/:.*//g'`
	else
		"./$base"
	fi
}


case "$file" in
	*\.c|*\.h) c_file ;;
	*\.py) python "$file" ;;
	*\.sh) "$file" ;;
	*\.tex) pdf_file ;;
	*\.md) pdf_file ;;
	*\.ms) pdf_file ;;
	*) echo "doesn't support this extention" || exit 1 ;;
esac

