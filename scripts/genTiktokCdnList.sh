#!/usr/bin/env bash
#
#  What this script does?
#  just recursively generate tiktok domain using very complex pattern (fuck chinese)
#  the output can be piped to checkDomains.sh (./genTiktokCdnList.sh | ./checkDomains.sh)
#  PS: This may not cover every tiktokcdn subdomain patterns, so not really reliable
#

#clear # disabled by default because it caused some output weirdness when piped to other commands
TT_CDN_PATTERN=(
	pull-{a,f,o}{1..5}-{sg,tt,va}{01..03}{,-infra}.tiktok{cdn,v}.com																	# example: pull-f5-tt01.tiktokcdn.com
	pull-{cmaf,flv,hls,rtmp}-{a,f,o}{1..5}-{sg,tt,va}{01..03}{,-infra}.tiktok{cdn,v}.com							# example: pull-rtmp-f5-tt03-infra.tiktokcdn.com
	pull-{a,f,o}{1..5}-{sg,tt,va}{01..03}{,-infra}.fcdn.{eu,us}.tiktok{cdn,v}.com											# example: pull-a16-tt02.fcdn.us.tiktokcdn.com
	pull-{cmaf,flv,hls,rtmp}-{a,f,o}{1..5}-{sg,tt,va}{01..03}{,-infra}.fcdn.{eu,us}.tiktok{cdn,v}.com	# example: pull-hls-f5-tt04.fcdn.us.tiktokcdn.com
)

## Main script ##
gen(){
	# Output the result
	for i in ${TT_CDN_PATTERN[@]};do
		echo $i
	done
}
gen