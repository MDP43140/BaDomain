#!/usr/bin/env bash
#
# SPDX-FileCopyrightText: 2021-2024 MDP43140
# SPDX-License-Identifier: GPL-3.0-or-later
#
# TODO: this cant detect newly added/removed
# files, only changed contents
# and also cant detect staged changes (in my case with git-cola)
#
echo "File	Added	Removed"
for file in $(git diff --name-only);do
	file_diff=$(git diff --minimal --color=never "../$file")
	added=$(echo "$file_diff" | grep '^+' | grep -v '^+++ ' | wc -l)
	removed=$(echo "$file_diff" | grep '^-' | grep -v '^--- ' | wc -l)
	echo "$file	$added	$removed"
done