#!/bin/bash
echo "File	Added	Removed"
for file in $(git diff --name-only);do
	file_diff=$(git diff "../$file")
	lines_added=$(echo "$file_diff" | grep '^+' | wc -l)
	lines_removed=$(echo "$file_diff" | grep '^- ' | wc -l)
	echo "$file	$lines_added	$lines_removed"
done