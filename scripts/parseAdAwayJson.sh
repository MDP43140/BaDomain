#!/usr/bin/env bash
#
#  What this script does?
#  Extracts blocked domain lists from AdAway exported JSON file
#
#  What each command below does?
#  + Print the adaway json input file
#  + Remove trailing tabs/spaces
#  + remove `"enabled": true` << this is just an example
#  + remove `"url": "http://example.com"`
#  + remove `>"host": <"example.com"`
#  + remove quotes (not sure)
#  + remove ending comma
#  + get the list in allowed/disallowed range (those will be blocked domains)
#  + and sort it

cat $1 \
 | sed -r \
		-e 's/^[ \t]+|[ \t]+$//g' \
		-e '/\"(enabled|allow|redirect)\"\: (true|false)/d' \
		-e '/\"(url|label|redirect)\"\: \".+\"/d' \
 		-e 's/\"host\"\: \"//g' \
 		-e 's/['\''\"]//g' \
 		-e 's/,$//g' \
 | grep 'allowed: \[' --before-context=999999 \
 | grep 'blocked: \[' --after-context=999999 \
 | sed -r \
 		-e 's/^(allow|block)ed\:\ \[//g' \
 		-e '/\{|\]|\}/d' \
 | sort -ui;