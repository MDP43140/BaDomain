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

clear;
cat $1 \
 | sed -r 's/^[ \t]+|[ \t]+$//g' \
 | sed -r '/\"(enabled|allow|redirect)\"\: (true|false)/d' \
 | sed -r '/\"(url|label|redirect)\"\: \".+\"/d' \
 | sed -r 's/\"host\"\: \"//g' \
 | sed -r 's/['\''\"]//g' \
 | sed -r 's/,$//g' \
 | grep 'allowed: \[' --before-context=999999 \
 | grep 'blocked: \[' --after-context=999999 \
 | sed -r 's/^(allow|block)ed\:\ \[//g' \
 | sed -r '/\{|\]|\}/d' \
 | sort -ui;