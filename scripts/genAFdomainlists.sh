#!/usr/bin/env bash
# shellcheck disable=SC2068
#
#  SPDX-FileCopyrightText: 2021-2025 MDP43140
#  SPDX-License-Identifier: GPL-3.0-or-later
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
	"-cdn-settings"
	"-conversions"
	"-dlsdk"
	"-gcdsdk"
	"-inapps"
	"-launches"
	"-register"
	".cdn-settings"
	".gcdsdk"
	".inapps"
	".launches"
)
# The ID consists of randomly generated 6 length numbers and letters
AF_ID=(
	"11uj0m"
	"1fcsll"
	"2gbelh"
	"2xbmcf"
	"3bjjlx"
	"3frow3"
	"4ohmzf"
	"4wrqgg"
	"54ty7j"
	"6mqlzt"
	"a2tnxf"
	"auiuwt"
	"b5vbk6"
	"bpo3en"
	"c4urql"
	"cat07k"
	"cehe9z"
	"cnam4c"
	"cserzx"
	"dtc0bd"
	"dv9cjr"
	"ealq8z"
	"ebgkrf"
	"eevegh"
	"esmwxy"
	"f1nna8"
	"f82esp"
	"fa4lut"
	"fblhbt"
	"fcu5wl"
	"fgrl8a"
	"fkvufv"
	"frk87a"
	"fsrsag"
	"gqvhtb"
	"hvyfht"
	"i9euhy"
	"ismmyx"
	"j7pca1"
	"janama"
	"jarlio"
	"jncgkt"
	"jo8cw5"
	"kxevij"
	"l9vjgt"
	"liogr8"
	"mizz0s"
	"mkiwb2"
	"msbipz"
	"nlc1bu"
	"oqrbgg"
	"otpi0g"
	"pjh6rp"
	"qe0qqo"
	"qqz6rz"
	"qupzae"
	"rmoacx"
	"rslw0r"
	"spygtj"
	"stpphi"
	"tw4msf"
	"uhzgj5"
	"ujdstl"
	"ukfakf"
	"un0yh0"
	"utw71z"
	"uwnxnw"
	"uym9cg"
	"vubtd9"
	"w3togo"
	"w5cud4"
	"wsamrb"
	"x8onmy"
	"xtwptx"
	"xwwx67"
	"xzwnrj"
	"y6gqab"
	"z3rpnm"
	"zzfvp5"
);

for id in ${AF_ID[@]};do
	for sub in ${AF_KNOWN_SUBDOMAIN[@]};do
		echo "${id}${sub}.appsflyersdk.com" # output example: msbipz-conversions.appsflyersdk.com
	done
done
