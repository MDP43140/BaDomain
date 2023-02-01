#!/usr/bin/env bash
#
#  What this script does?
#  it tries to scan every DNS response and
#  find if a domain exists or not
#  and used to check BaDomain lists
#

clear
echo -e "[i] Initializing..."

## Configuration ##
DNS_PROVIDER="@8.8.8.8" # nah its not private, but its really fast especially to spam all that domains bruhhh
INPUT_FILE="$1"
LOG_NONE_FILE="resultNone.log"
LOG_SERVFAIL_FILE="resultServFail.log"
LOG_EXISTS_FILE="resultExists.log"
DOMAIN_LISTS="google.com youtube.com example.com ThisDomainDoesntExistAtAll.dontreturnsomethingok" # just for an example

## Query domain lists, remove previous log, and stuff... ##
echo "[i] Querying `[ "$INPUT_FILE" ] && echo $INPUT_FILE || echo StandardInput` domain lists..."
DOMAIN_LISTS=`sed '/^#/d' $INPUT_FILE | sed -r '/^(\b25[0-5]|\b2[0-4][0-9]|\b[01]?[0-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}$/d' | sort -ui`

# Count total domains
# Sometimes, DOMAIN_LISTS might be separated by spaces and will return 1 as a count if running wc-l. in that case, rerun wc-w (this will count per space instead of per newline)
TOTAL_DOMAINS=`echo $DOMAIN_LISTS | wc -l`
[ "$TOTAL_DOMAINS" -le 1 ] && TOTAL_DOMAINS=`echo $DOMAIN_LISTS | wc -w`

# this script is able to work with stdin (./checkDomains.sh << EOF google.com youtube.com EOF), but there might be a bit of problems afaik
[ "$INPUT_FILE" = '' -a "$DOMAIN_LISTS" != '' ] && echo "[!] Looks like you're using stdin, please note that this might be little bit unstable"
echo "[i] Total domains going to be scanned: $(echo $TOTAL_DOMAINS)"
[ -f "$LOG_NONE_FILE" ] && echo "[i] Removing $LOG_NONE_FILE..." && rm "$LOG_NONE_FILE";
[ -f "$LOG_SERVFAIL_FILE" ] && echo "[i] Removing $LOG_SERVFAIL_FILE..." && rm "$LOG_SERVFAIL_FILE";
[ -f "$LOG_EXISTS_FILE" ] && echo "[i] Removing $LOG_EXISTS_FILE..." && rm "$LOG_EXISTS_FILE";
echo "[i] Using $DNS_PROVIDER as DNS Resolver..."

## and check one per one ##
PROGRESS=0
for i in $DOMAIN_LISTS;do
	PROGRESS=$((PROGRESS+1))
	echo -en "\r[i] ($PROGRESS/$TOTAL_DOMAINS) Checking \e[1m$i\e[0;2;5m...\e[0m\e[0K"
	result=`dig $DNS_PROVIDER $i`
	if [ ! "$result" ];then
		echo -e "\r[!] No answer for $i. Check your internet\e[0K"
		echo $i >> "$LOG_SERVFAIL_FILE"
	elif echo "$result" | grep -q 'trustpositifkominfo\|blockpage\|aduankonten\|blockpage\.xl\.co\.id\|aduankonten\.mail\.kominfo\.go\.id';then
		echo -e "\r[!] $i censored by government\e[0K"
		echo $i >> "$LOG_EXISTS_FILE"
	elif ! echo "$result" | grep -q 'ANSWER: 0';then
		echo -e "\r[+] $i exists\e[0K"
		echo $i >> "$LOG_EXISTS_FILE"
	elif echo "$result" | grep -q ', status: SERVFAIL';then
		echo -e "\r[!] DNS Resolver is out-of-time to query $i\e[0K"
		echo $i >> "$LOG_SERVFAIL_FILE"
	else
		echo -e "\r[-] $i not exist\e[0K"
		echo $i >> "$LOG_NONE_FILE"
	fi
done