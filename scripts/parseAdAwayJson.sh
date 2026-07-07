#!/usr/bin/env bash
# shellcheck disable=SC2068
#
#  SPDX-FileCopyrightText: 2021-2026 MDP43140
#  SPDX-License-Identifier: GPL-3.0-or-later
#
#  What this script does?
#  Extracts blocked domain lists from AdAway exported JSON file
#  TODO: make simpler Python equivalent script
#
#  What each command below does?
#  + Remove trailing tabs/spaces
#  + remove `"enabled": true` << this is just an example
#  + remove `"url": "http://example.com"`
#  + remove `>"host": <"example.com"`
#  + remove quotes (not sure)
#  + remove ending comma
#  + get the list in allowed/disallowed range (those will be blocked domains)
#  + sort

sed -r \
	-e 's/^[ \t]+|[ \t]+$//g' \
	-e '/\"(enabled|allow|redirect)\"\: (true|false)/d' \
	-e '/\"(url|label|redirect)\"\: \".+\"/d' \
	-e 's/\"host\"\: \"//g' \
	-e 's/['\''\"]//g' \
	-e 's/,$//g' $* \
 | grep 'allowed: \[' -B 5000000 \
 | grep 'blocked: \[' -A 5000000 \
 | sed -r \
		-e 's/^(allow|block)ed\:\ \[//g' \
		-e '/\{|\]|\}/d' \
 | sort -ui;
