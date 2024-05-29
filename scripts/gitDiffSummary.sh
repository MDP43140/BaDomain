#!/usr/bin/env bash
# TODO: this cant detect newly added/removed
# files, only changed contents
# and also cant detect staged changes (in my case with git-cola)
echo "File	Added	Removed"
for file in $(git diff --name-only);do
	file_diff=$(git diff --minimal -p --raw --color=never "../$file")
	added=$(($(echo "$file_diff" | grep '^+' | wc -l) - 1))
	removed=$(($(echo "$file_diff" | grep '^-' | wc -l) - 1))
	echo "$file	$added	$removed"
done