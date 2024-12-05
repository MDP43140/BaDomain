#!/bin/env bash
#
# This script checks for any of these shortlinks and see
# if the domain behind it is changed or not
# This was done to combat gambling websites that
# once banned will change their domain
#

COMPARISON_LIST_FILE="../misc/NoGambling.txt" # assumes this script is executed in scripts folder
KNOWN_SHORT_LINK_REDIRECTS=(
	"https://rebrand.ly/7mtrwin"
	# below is protected behind cloudflare (how to check: DOMAIN/cdn-cgi/trace)
	"https://tinyurl.com/7mtrwin"
	"https://idn.bio/7meter"
	"https://t.ly/7meterwin"
)
KNOWN_SHORT_LINK_REDIRECTS=($(printf "%s\n" "${KNOWN_SHORT_LINK_REDIRECTS[@]}" | shuf))

USER_AGENT="Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:133.0) Gecko/20100101 Firefox/133.0"
echo "[i] Check gambling shortlink redirects"
echo "[i] Make sure to use a VPN/proxy/Tor to avoid getting your IP blacklisted"
echo "    (most of these servers has CloudFlare, in case they asked for"
echo "    CAPTCHA and the script continues to access the domain behind"
echo "    CloudFlare, your IP may get blacklisted)"
url_to_domain(){
	echo -n "$@" | \
		sed 's/^https/http/g' | \
		sed 's/^http:\/\///g' | \
		sed 's/\/.*$//g';
}
for domain in ${KNOWN_SHORT_LINK_REDIRECTS[@]};do
	sleep $((2 + (RANDOM % 3))) # to avoid getting rate-limited
	echo "[i] Fetching ${domain}..."
	# TODO detect CAPTCHA: "cf-mitigated: challenge"
	RESULT_HEADER=$(curl --user-agent "$USER_AGENT" -s -I -- "${domain}" | sed 's/\r//')
	REPLY_CODE=$(echo -n $RESULT_HEADER | head -n1 | cut -d' ' -f2)
	HEADER_LOCATION=$(echo -n "${RESULT_HEADER}" | grep -F location: | head -n1 | awk '{print $2}')
	LOCATION_DOMAIN=$(url_to_domain "${HEADER_LOCATION}")
	echo " |  Got reply code ${REPLY_CODE}!"
	if [ "${HEADER_LOCATION}" ];then
		echo " |  Location: ${HEADER_LOCATION} > ${LOCATION_DOMAIN}"
		if grep -qF "$LOCATION_DOMAIN" "${COMPARISON_LIST_FILE}";then
			echo " |  Domain detected in ${COMPARISON_LIST_FILE}!"
		else
			echo " |  Domain NOT detected in ${COMPARISON_LIST_FILE}!"
			echo " |  Prepending the domain to ${COMPARISON_LIST_FILE}..."
			echo -n "${LOCATION_DOMAIN}" >> "${COMPARISON_LIST_FILE}"
		fi
	else
		case "${REPLY_CODE}" in
			4[0-9][0-9])
				echo " |  Access denied!"
			;;
			*)
				echo " |  No Location header found!"
			;;
		esac
	fi
	#debug
	dbg1=$(echo -n ${domain} | md5sum | cut -d' ' -f1)
	echo "[D] Dumping ${domain} > ${dbg1}.txt..."
	echo -n "### Result for ${domain}:" >  "${dbg1}.txt"
	echo -n "${RESULT_HEADER}" >> "${dbg1}.txt"
done