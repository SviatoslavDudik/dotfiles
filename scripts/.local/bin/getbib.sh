#!/bin/sh
[ -z "$1" ] && echo "Give at least 1 argument" && exit

if [ -f "$1" ]; then
	doi=$(pdfinfo "$1" | grep -io "doi:.*") ||\
	doi=$(pdftotext "$1" 2>/dev/null - | grep -io "doi:.*") || exit 1
else
	doi="$1"
fi

curl -s "http://api.crossref.org/works/$doi/transform/application/x-bibtex" -w "\\n"

