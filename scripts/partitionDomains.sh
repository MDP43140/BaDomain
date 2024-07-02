#!/usr/bin/env bash
[ $? -ne 2 ] && {
	echo 'This script "partitions" text (word taken from Kotlin ArrayList.partition {} function)'
	echo 'mostly used to put bad domains on top (less likely checked), and domains that should be checked'
	echo "Usage: $0 [input] [prioList]"
}
[ -r "$1" -a -r "$1" ] || {
	echo "File A/B doesnt exist or cant be read!"
}
text1=$(sort -ui $1 | sed '/^#/d') # eg. brave.com a.ads.co youtube.com b.ads.co
text1=$(sort -ui $2 | sed '/^#/d') # eg. ads.co
tmp1=$(mktemp)
tmp2=$(mktemp)
echo "${txt1}" | while IFS= read -r;do
	# TODO: should match by end word (eg. sub.adserver.com matches adserver.com)
	if echo "${REPLY}" | grep -qE "${txt1}$";then
		echo "$REPLY" >> "$tmp1"
	else
		echo "$REPLY" >> "$tmp2"
	fi
done
# eg. a.ads.co b.ads.co [one empty line, for separator] brave.com youtube.com
cat "$tmp1"
echo
cat "$tmp2"