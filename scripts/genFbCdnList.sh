#!/usr/bin/env bash
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
SFB_TYPES=(
	# PS: these 3 queries below returns same response if the server exists
	# eg: `external.fmof1-1.fna.fbcdn.net` & `FUCKTHEZUCK.fmof1-1.fna.fbcdn.net` exist if `fmof1-1.fna.fbcdn.net` exist (it doesn't exist if you JUST query `fmof1-1.fna.fbcdn.net` --
	# it needs to have a subdomain (can be anything): `WHATEVRSUBDOMAINHEREBTWZUCKISADEVIL.fmof1-1.fna.fbcdn.net`)
	# When done querying, the existing result then should be duplicated 3 times and replace each duplicated "external" to "instagram","scontent",etc respectively.
#	"external.f" # MainDomain1
#	"instagram.f" # MainDomain1 (replaced by external.f)
#	"scontent.f" # MainDomain1 (replaced by external.f)
#	"static.f" # MainDomain1 (replaced by external.f)
#	"media.f" # MainDomain2
#	"sonar.f" # MainDomain2 (replaced by media.f)
#	"media-" # MainDomain2
	"sonar-" # MainDomain3
	"sonar6-" # MainDomain3
	"video-" # MainDomain3
	"scontent-" # MainDomain3,MainDomain5
#	"scontent-a-" # MainDomain3
#	"scontent-b-" # MainDomain3
#	"scontent-c-" # MainDomain3
#	"scontent-d-" # MainDomain3
#	"scontent-e-" # MainDomain3
#	"z-p4-scontent-" # MainDomain5
)
SFB_REGIONCODE=(
	"acc" "ada" "adl" "ams" "apa" "aqa" "auh"
	"bbi" "bdj" "bdo" "bek" "bel" "bga" "bho" "bkk" "blr" "bma" "bna" "bom" "bpn" "bru" "bsb" "bth" "bze"
	"cac" "cbb" "ccu" "ceb" "cgb" "cgh" "cgk" "cha" "cia" "cks" "cmb" "cor" "cpq" "crk" "cwb" "cyw"
	"dac" "dad" "del" "dla" "dnk" "dpa" "dps" "dsa" "dtb" "dxb"
	"ebb" "eoh" "evn"
	"fco" "fjr" "for" "fru"
	"gdl" "gua"
	"han" "hdy" "hel" "hen" "hfa" "hkg" "hyd"
	"icn" "iev" "isb"
	"jau" "jib" "jnb" "jog" "jpa"
	"kgf" "khi" "kix" "kno" "kul" "kut" "kwi"
	"lim" "lis" "lpb" "lwo"
	"maa" "mam" "mba" "mdc" "mea" "mex" "mga" "mia" "mji" "mkz" "mla" "mnl" "mof"
	"nag" "ncg" "ngo" "nrt"
	"osl"
	"pac" "pbc" "pdg" "pen" "pew" "pfb" "phl" "pku" "pky" "plm" "plu" "pnq" "poa" "pra"
	"qpa"
	"rec" "ria"
	"saw" "scl" "sdu" "sea" "sin" "sjc" "sjo" "snc" "soc" "srg" "ssa" "ssn" "sst" "stv" "sub" "sxv" "szb"
	"tbs" "tkg" "tpa" "tpe" "tun"
	"udr" "uln" "upg"
	"vca" "vit" "vns"
	"waw" "wbw"
	"xsp"
	"ybz" "ymy"
)
SFB_MAINDOMAIN=(
	"fna.fbcdn.net"
#	"fna.whatsapp.net"
#	"cdn.whatsapp.net"
	"xx.fbcdn.net"
	"cdninstagram.com"
)

## Main script ##
gen(){
	# this will generate "1 2 ... 43 44"
	SFB_BRUTEFORCERANGE_1=`echo {1..44}`
	SFB_BRUTEFORCERANGE_2=`echo {1..10}` # highest peak found 27-7 & 1-10

	# Join array to string divided by spaces
	SFB_TYPES="${SFB_TYPES[@]}"
	SFB_REGIONCODE="${SFB_REGIONCODE[@]}"
	SFB_MAINDOMAIN="${SFB_MAINDOMAIN[@]}"

	for type in $SFB_TYPES;do
		for region in $SFB_REGIONCODE;do
			for domain in $SFB_MAINDOMAIN;do
				for n1 in $SFB_BRUTEFORCERANGE_1;do
					for n2 in $SFB_BRUTEFORCERANGE_2;do
						echo "${type}${region}${n1}-${n2}.${domain}" # output example: scontent.fcgk4-4.fna.fbcdn.net
					done
				done
			#	echo $type$region.$domain # output example: scontent-cgk.xx.fbcdn.net
			done
		done
	done
}
gen