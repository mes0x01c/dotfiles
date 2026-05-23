#!/usr/bin/env sh 

# script taken from https://github.com/jarun/buku 
url=$(buku -p -f4 | fzf -m --reverse --preview "buku -p {1}" --preview-window=wrap | cut -f2)

if [ -n "$url" ]; then
	echo "$url" | xargs firefox
fi
