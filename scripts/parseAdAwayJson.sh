#!/usr/bin/env bash
#
#  What this script does?
#  Extracts blocked domain lists from AdAway exported JSON file
#

clear
cat $1 \
 | sed -r 's/^[ \t]+|[ \t]+$//g' \
 | sed -r '/\"(enabled|allow|redirect)\"\: (true|false)/d' \
 | sed -r '/\"(url|label|redirect)\"\: \".+\"/d' \
 | sed -r 's/\"host\"\: \"//g' \
 | sed -r '/(\{|(\]|\}))/d' \
 | sed -r 's/['\''\"]//g' \
 | sed -r 's/,$//g' \
 | grep 'allowed: \[' --before-context=999999 \
 | grep 'blocked: \[' --after-context=999999 \
 | sed -r 's/^(allow|block)ed\:\ \[//g' \
 | sort -ui;