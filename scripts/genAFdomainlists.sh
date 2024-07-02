#!/usr/bin/env bash
#
#  What this script does?
#  it just generate appsflyer domains
#
#  Do note that every domain sends the same
#  DNS replies, i think its a clever move from
#  AppsFlyer to evade hosts based ad blockers :(
#  because we'll never know if that said domain
#  actually exists or not...
#

## Configuration ##
#
#clear # disabled by default because it caused some output weirdness when piped to other commands
AF_KNOWN_SUBDOMAIN=(
	"cdn-settings"
	"conversions"
	"dlsdk"
	"gcdsdk"
	"inapps"
	"launches"
	"register"
)
# The ID consists of randomly generated 6 length numbers and letters
AF_ID=(
	"2gbelh"
	"2xbmcf"
	"3bjjlx"
	"4wrqgg"
	"b5vbk6"
	"cehe9z"
	"ebgkrf"
	"eevegh"
	"fcu5wl"
	"fkvufv"
	"frk87a"
	"jarlio"
	"jo8cw5"
	"mkiwb2"
	"msbipz"
	"oqrbgg"
	"spygtj"
	"ujdstl"
	"uwnxnw"
	"wsamrb"
	"xwwx67"
	"xzwnrj"
);

for id in ${AF_ID[@]};do
	for sub in ${AF_KNOWN_SUBDOMAIN[@]};do
		echo $id-$sub.appsflyersdk.com # output example: msbipz-conversions.appsflyersdk.com
	done
done