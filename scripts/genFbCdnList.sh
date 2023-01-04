#!/usr/bin/env bash
#
#  What this script does?
#  just recursively generate facebook domain
#  the output can be piped to checkDomains.sh (./genFbCdnList.sh | ./checkDomains.sh)
#

## Configuration ##
#
# Combinations (+ = Added, - Not added yet, !ALL = not all is scanned/outdated):
# Unmanaged (this will look random, and not expected, because its just too much to keep an eye on all known facebook domain patterns)
# + ("external.f",  "ALL", "fna.fbcdn.net")
# + ("instagram.f", "ALL", "fna.fbcdn.net")
# + ("scontent.f",  "ALL", "fna.fbcdn.net")
# + ("media.f",			"!ALL", "fna.whatsapp.net")
# + ("media-",			"!ALL", "cdn.whatsapp.net")
# - ("scontent-",		"!ALL", "fna.fbcdn.net")
# - ("scontent-",		"!ALL", "xx.fbcdn.net")
# - ("scontent-",		"!ALL", "cdninstagram.com")
# - ("z-m-scontent-","!ALL", "xx.fbcdn.net")
# - ("sonar6-",			"!ALL", "fna.fbcdn.net")
# - ("sonar6-",			"!ALL", "xx.fbcdn.net")
# - ("video-",			"!ALL", "fna.fbcdn.net")
# - ("video-",			"!ALL", "xx.fbcdn.net")
#
# Also, if you know any other possible combination,
# dont be hesitant to make a new GitHub issue:
# https://github.com/mdp43140/BaDomains/issues
#
# And if you want to help (and you do use Linux),
# you can run `./genFbCdnList.sh | ./checkDomains.sh`
# Copy all the results from generated `resultExists.log` output file
# to NoFB.txt, then run `./Make.sh -b` (that will 'build' the hosts file automatically),
# and make a pull request
# https://github.com/mdp43140/BaDomains/pulls
#
#clear # disabled by default because it caused some output weirdness when piped to other commands
SFB_TYPES=(
	# PS: these 3 queries below returns same response if the server exists
	# eg: `external.fmof1-1.fna.fbcdn.net` & `FUCKTHEZUCK.fmof1-1.fna.fbcdn.net` exist if `fmof1-1.fna.fbcdn.net` exist (it doesn't exist if you JUST query `fmof1-1.fna.fbcdn.net` --
	# it needs to have a subdomain (can be anything): `WHATEVERSUBDOMAINHEREBTWZUCKISMORONIST.fmof1-1.fna.fbcdn.net`)
	# When done querying, the existing result then should be duplicated 3 times and replace each duplicated "external" to "instagram","scontent",etc respectively.
#	"external.f" # MainDomain1
#	"instagram.f" # MainDomain1 (not recommended, replaced by external.f)
#	"scontent.f" # MainDomain1 (not recommended, replaced by external.f)

#	"media.f" # MainDomain2
#	"media-" # MainDomain2
	"sonar6-" # MainDomain3
	"sonar-" # MainDomain3
	"video-" # MainDomain3
	"scontent-" # MainDomain3
#	"scontent-a-" # MainDomain3
#	"scontent-b-" # MainDomain3
#	"scontent-c-" # MainDomain3
#	"scontent-d-" # MainDomain3
#	"scontent-e-" # MainDomain3
)
SFB_REGIONCODE=(
	"acc"
	"ada"
	"adl"
	"ams"
	"apa"
	"aqa"
	"auh"
	"bdj"
	"bdo"
	"bek"
	"bga"
	"bkk"
	"bma"
	"bna"
	"bom"
	"bru"
	"bsb"
	"bth"
	"bze"
	"cac"
	"cbb"
	"ceb"
	"cgb"
	"cgh"
	"cgk"
	"cha"
	"cia"
	"cmb"
	"cpq"
	"cwb"
	"dac"
	"del"
	"dla"
	"dnk"
	"dpa"
	"dps"
	"dsa"
	"dtb"
	"dxb"
	"ebb"
	"eoh"
	"evn"
	"fco"
	"fjr"
	"for"
	"fru"
	"gdl"
	"gua"
	"han"
	"hdy"
	"hel"
	"hen"
	"hfa"
	"hkg"
	"hyd"
	"iev"
	"isb"
	"jib"
	"jnb"
	"jog"
	"jpa"
	"kgf"
	"khi"
	"kix"
	"kno"
	"kul"
	"kut"
	"kwi"
	"lim"
	"lis"
	"lpb"
	"lwo"
	"maa"
	"mba"
	"mdc"
	"mea"
	"mex"
	"mga"
	"mia"
	"mla"
	"mnl"
	"mof"
	"nag"
	"ncg"
	"ngo"
	"osl"
	"pac"
	"pbc"
	"pen"
	"pfb"
	"phl"
	"pku"
	"pky"
	"plm"
	"plu"
	"poa"
	"pra"
	"qpa"
	"rec"
	"ria"
	"scl"
	"sdu"
	"sea"
	"sin"
	"sjc"
	"sjo"
	"snc"
	"srg"
	"ssa"
	"sst"
	"sub"
	"szb"
	"tbs"
	"tpa"
	"tpe"
	"tun"
	"uln"
	"vca"
	"vit"
	"vns"
	"waw"
	"wbw"
	"xsp"
	"ybz"
	"ymy"
)
SFB_MAINDOMAIN=(
#	"fna.fbcdn.net"
#	"fna.whatsapp.net"
#	"cdn.whatsapp.net"
	"xx.fbcdn.net"
	"cdninstagram.com"
)
# this will generate "1 2 ... 32 33"
SFB_BRUTEFORCERANGE_1="$(echo {1..33})"
SFB_BRUTEFORCERANGE_2="$(echo {1..6})"


## Main script ##

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