#!/usr/bin/env bash
#
#  What this script does?
#  just recursively generate facebook domain
#  the output can be piped to checkDomains.sh (./genFbCdnList.sh | ./checkDomains.sh)
#

## Configuration ##
#
# Already checked and added to NoFB combinations:
# + external.fcgkX-X.fna.fbcdn.net  ("external.f",  "cgk", "fna.fbcdn.net")
# + instagram.fcgkX-X.fna.fbcdn.net ("instagram.f", "cgk", "fna.fbcdn.net")
# + scontent.fcgkX-X.fna.fbcdn.net  ("scontent.f",  "cgk", "fna.fbcdn.net")
# + external.fpkuX-X.fna.fbcdn.net  ("external.f",  "pku", "fna.fbcdn.net")
# + instagram.fpkuX-X.fna.fbcdn.net ("instagram.f", "pku", "fna.fbcdn.net")
# + scontent.fpkuX-X.fna.fbcdn.net  ("scontent.f",  "pku", "fna.fbcdn.net")
#
# Also, if you know any other possible combination,
# dont be hesitant to make a new GitHub issue:
# https://github.com/mdp43140/BaDomains/issues
#
SFB_TYPES=(
	"external.f"
	"instagram.f"
	"scontent.f"
)
SFB_REGIONCODE=(
#	"adl"
#	"bdj"
#	"bek"
#	"bth"
#	"cgk"
#	"evn"
#	"hyd"
#	"kix"
#	"kul"
#	"nag"
#	"ngo"
#	"pen"
#	"pku"
#	"sin"
)
SFB_MAINDOMAIN=(
	"fna.fbcdn.net"
#	"xx.fbcdn.net"
)
# this will generate "0 1 2 3 ... 28 29 30"
SFB_BRUTEFORCERANGE_1="$(echo {0..30})"
SFB_BRUTEFORCERANGE_2="$(echo {0..6})"


## Main script ##

# Join array to string divided by spaces
SFB_TYPES="${SFB_TYPES[@]}"
SFB_REGIONCODE="${SFB_REGIONCODE[@]}"
SFB_MAINDOMAIN="${SFB_MAINDOMAIN[@]}"

clear
for type in $SFB_TYPES;do
	for region in $SFB_REGIONCODE;do
		for domain in $SFB_MAINDOMAIN;do
			for n1 in $SFB_BRUTEFORCERANGE_1;do
				for n2 in $SFB_BRUTEFORCERANGE_2;do
				#output example: scontent.fcgk4-4.fna.fbcdn.net
					echo $type$region$n1-$n2.$domain
				done
			done
		done
	done
done