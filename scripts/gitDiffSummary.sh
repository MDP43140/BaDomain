#!/bin/bash
# TODO: this cant detect newly added/removed file, only changed contents
echo "File	Added	Removed"
for file in $(git diff --name-only);do
	file_diff=$(git diff --minimal -p --raw --color=never "../$file")
	lines_added=$(($(echo "$file_diff" | grep '^+' | wc -l) - 1))
	lines_removed=$(($(echo "$file_diff" | grep '^-' | wc -l) - 1))
	echo "$file	$lines_added	$lines_removed"
done