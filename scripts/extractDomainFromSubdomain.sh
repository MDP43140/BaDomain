#!/bin/bash

# Unfortunately, it can't grab
# domains like .co.id, .go.id, etc (2 level TLD)
# prob can be fixed if we can detect:
# 2nd LD length is 2-3
# TLD length is 2

awk -F '.' '{
	if (NF > 1){
		print $(NF-1) "." $NF
	}
}' "$1" | sort -ui