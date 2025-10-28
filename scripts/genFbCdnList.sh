#!/usr/bin/env bash
# shellcheck disable=SC2128,SC2178,SC2059
#
#  SPDX-FileCopyrightText: 2021-2025 MDP43140
#  SPDX-License-Identifier: GPL-3.0-or-later
#
#  What this script does?
#  just recursively generate facebook domain
#  the output can be piped to checkDomains.sh (./genFbCdnList.sh | ./checkDomains.sh)
#

## Configuration ##
#
# Combinations (+ = Added, - Not added yet, !ALL = not all is scanned/outdated):
# Unmanaged (this will look random, and not expected, because its just too much to keep an eye on all known facebook domain patterns)
# sorted by 3rd column
# + ("external.f",     "ALL", "fna.fbcdn.net")
# + ("instagram.f",    "ALL", "fna.fbcdn.net")
# + ("scontent.f",     "ALL", "fna.fbcdn.net")
# - ("scontent-",		  "!ALL", "fna.fbcdn.net")
# - ("video-",			  "!ALL", "fna.fbcdn.net")
# - ("sonar-",			  "!ALL", "fna.fbcdn.net")
# - ("sonar6-",			  "!ALL", "fna.fbcdn.net")
# - ("scontent-",		  "!ALL", "xx.fbcdn.net")
# - ("sonar-",			  "!ALL", "xx.fbcdn.net")
# - ("sonar6-",			  "!ALL", "xx.fbcdn.net")
# - ("video-",			  "!ALL", "xx.fbcdn.net")
# - ("z-m-scontent-", "!ALL", "xx.fbcdn.net")
# + ("media.f",			  "!ALL", "fna.whatsapp.net")
# + ("media-",			  "!ALL", "cdn.whatsapp.net")
# - ("scontent-",		  "!ALL", "cdninstagram.com")
# - ("z-p4-scontent-","!ALL", "cdninstagram.com")
#
# Also, if you know any other possible combination,
# dont be hesitant to make a new GitHub issue:
# https://github.com/mdp43140/BaDomain/issues
#
# And if you want to help (and you do use Linux),
# you can run `./genFbCdnList.sh | ./checkDomains.sh`
# Copy all the results from generated `resultExists.log` output file
# to NoFB.txt, then run `./Make.sh -b` (that will 'build' the hosts file automatically),
# and make a pull request
# https://github.com/mdp43140/BaDomain/pulls
#
#clear # disabled by default because it caused some output weirdness when piped to other commands
XXXDD="%s%d-%d" # to make it less confusing to read, (output example: sub42-9)
SFB_PRESET=(
	# PS: most of these queries below returns same response if the server exists
	# eg: `external.fmof1-1.fna.fbcdn.net` & `RANDOM.fmof1-1.fna.fbcdn.net` exist if `fmof1-1.fna.fbcdn.net` exist (it doesn't exist if you JUST query `fmof1-1.fna.fbcdn.net` --
	# it needs to have a subdomain (can be anything): `TEST123.fmof1-1.fna.fbcdn.net`)
	# When done querying, the existing result then should be duplicated 3 times and replace each duplicated "external" to "instagram","scontent",etc respectively.
	"external.f$XXXDD.fna.fbcdn.net"
	"instagram.f$XXXDD.fna.fbcdn.net" # (replaced by external.f)
	"scontent.f$XXXDD.fna.fbcdn.net" # (replaced by external.f)
	"static.f$XXXDD.fna.fbcdn.net" # (replaced by external.f)
	"video.f$XXXDD.fna.fbcdn.net"
	"z-scontent.f$XXXDD.fna.fbcdn.net"
	"z-m-external.f$XXXDD.fna.fbcdn.net"
	"z-m-scontent.f$XXXDD.fna.fbcdn.net"
	"z-p-instagram.f$XXXDD.fna.fbcdn.net"
	"z-p-scontent.f$XXXDD.fna.fbcdn.net"
	"z-p-video.f$XXXDD.fna.fbcdn.net"
	"external-$XXXDD.xx.fbcdn.net"
	"sonar-$XXXDD.xx.fbcdn.net"
	"sonar6-$XXXDD.xx.fbcdn.net"
	"video-$XXXDD.xx.fbcdn.net"
	"scontent-$XXXDD.xx.fbcdn.net"
	"scontent-a-$XXXDD.xx.fbcdn.net"
	"scontent-b-$XXXDD.xx.fbcdn.net"
	"scontent-c-$XXXDD.xx.fbcdn.net"
	"scontent-d-$XXXDD.xx.fbcdn.net"
	"scontent-e-$XXXDD.xx.fbcdn.net"
	"z-m-scontent-$XXXDD.xx.fbcdn.net"
	"media.f$XXXDD.fna.whatsapp.net"
	"sonar.f$XXXDD.fna.whatsapp.net" # (replaced by media.f)
	"media-$XXXDD.cdn.whatsapp.net"
	"sonar-$XXXDD.cdn.whatsapp.net"
	"scontent-$XXXDD.cdninstagram.com"
	"z-p4-scontent-$XXXDD.cdninstagram.com"
)
SFB_REGIONCODE=(
	"acc" "ada" "adl" "akl" "ams" "amt" "apa" "aqa" "arn" "atl" "auh"
	"bbi" "bcn" "bdj" "bdo" "bek" "bel" "ber" "bga" "bho" "bkk" "blr" "bma" "bna" "bog" "bom" "bpn" "bru" "bsb" "bth" "bze"
	"cac" "cbb" "ccu" "cdg" "cdt" "ceb" "cgb" "cgh" "cgk" "cha" "cia" "cjb" "cks" "cmb" "cor" "cph" "cpq" "crk" "cwb" "cyw"
	"dac" "dad" "del" "den" "dfw" "dla" "dnk" "doh" "dpa" "dps" "dsa" "dtb" "dub" "dus" "dxb"
	"ebb" "eoh" "epa" "evn"
	"fco" "fec" "fjr" "for" "fra" "frt" "fru" "frx"
	"gdl" "gmp" "gua"
	"ham" "han" "hdy" "hel" "hen" "hfa" "hkg" "hkt" "hyd"
	"iad" "icn" "iev" "isb" "ist" "itm" "ixm"
	"jau" "jib" "jnb" "jog" "jpa"
	"kdi" "kgf" "khi" "kix" "kno" "kul" "kut" "kwi"
	"lax" "lcy" "lga" "lhr" "lht" "lim" "lio" "lis" "lpb" "lwo"
	"maa" "mad" "mam" "man" "mba" "mct" "mdc" "mea" "mel" "mex" "mga" "mia" "mji" "mkz" "mla" "mnl" "mof" "mrs" "muc" "mxp"
	"nag" "ncg" "ngo" "nrt"
	"ord" "ort" "osl" "otp"
	"pac" "pat" "pbc" "pdg" "pen" "pew" "pfb" "phl" "pku" "pky" "plm" "plu" "pmo" "pnq" "poa" "pra" "prg"
	"qpa"
	"rec" "ria"
	"saw" "scl" "sdu" "sea" "sin" "sit" "sjc" "sjo" "sjp" "snc" "soc" "sof" "srg" "ssa" "ssn" "sst" "stv" "sub" "sxv" "syd" "szb"
	"tbs" "tij" "tir" "tkg" "tpa" "tpe" "tun"
	"udr" "uln" "upg"
	"vca" "vie" "vit" "vns"
	"waw" "wbw"
	"xsp"
	"ybz" "ymy"
	"zrh"
)

## Main script ##
gen(){
	# this will generate "1 2 ... 48 49"
	SFB_BRUTEFORCERANGE_1=$(echo {1..49})
	SFB_BRUTEFORCERANGE_2=$(echo {1..10}) # highest peak found 27-7 & 1-10

	# Join array to string divided by spaces
	SFB_PRESET="${SFB_PRESET[*]}"
	SFB_REGIONCODE="${SFB_REGIONCODE[*]}"

	for preset in $SFB_PRESET;do
		for region in $SFB_REGIONCODE;do
			for n1 in $SFB_BRUTEFORCERANGE_1;do
				for n2 in $SFB_BRUTEFORCERANGE_2;do
					printf "${preset}\n" "${region}" "${n1}" "${n2}" # output example: scontent.fcgk4-4.fna.fbcdn.net
				done
			done
		#printf "${preset}\n" ${region}  # output example: scontent-cgk.xx.fbcdn.net
		done
	done
	# lines generated by code above:
	# max(SFB_BRUTEFORCERANGE_1) * max(SFB_BRUTEFORCERANGE_2) * length(SFB_PRESET) * length(SFB_REGIONCODE)
	# 49 * 10 * 28 * 209 = 2867480 (what?!)
}
gen
