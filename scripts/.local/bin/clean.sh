#!/bin/bash

file=$(readlink -f "$1")
dir=$(dirname "$file")
base="${file%.*}"

cd "$dir" || exit

tex_file() {
	rm -f "${base}.aux"
	rm -f "${base}.dvi"
	rm -f "${base}.fls"
	rm -f "${base}.log"
	rm -f "${base}.nav"
	rm -f "${base}.out"
	rm -f "${base}.snm"
	rm -f "${base}.toc"
	rm -f "${base}.fdb_latexmk"
}

c_file() {
	if [ -e Makefile ]; then
		make clean
	else
		rm *.o
	fi
}


case "$file" in
	*\.c|*\.h) c_file ;;
	*\.tex) tex_file ;;
	*) echo "doesn't support this extention" || exit 1 ;;
esac

