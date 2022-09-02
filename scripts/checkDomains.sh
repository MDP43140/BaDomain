#!/usr/bin/env bash
#
#  What this script does?
#  it tries to scan every DNS response and
#  find if a domain exists or not
#  and used to check BaDomain lists
#

echo -e "[i] Initializing..."

## Configuration ##
DNS_PROVIDER="@8.8.8.8" # nah its not private, but its really fast especially to spam all that domains bruhhh
INPUT_FILE="$1"
LOG_NONE_FILE="resultNone.log"
LOG_SERVFAIL_FILE="resultServFail.log"
LOG_EXISTS_FILE="resultExists.log"
DOMAIN_LISTS="google.com youtube.com ThisDomainDoesntExistAtAll.dontreturnsomethingok" # just for an example

## Query domain lists, remove previous log, and stuff... ##
echo "[i] Querying $INPUT_FILE domain lists..."
DOMAIN_LISTS="$(sed '/^#/d' $INPUT_FILE | sed -r '/^(\b25[0-5]|\b2[0-4][0-9]|\b[01]?[0-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}$/d')"
[ -f "$LOG_NONE_FILE" ] && echo "[i] Removing $LOG_NONE_FILE..." && rm "$LOG_NONE_FILE";
[ -f "$LOG_SERVFAIL_FILE" ] && echo "[i] Removing $LOG_SERVFAIL_FILE..." && rm "$LOG_SERVFAIL_FILE";
[ -f "$LOG_EXISTS_FILE" ] && echo "[i] Removing $LOG_EXISTS_FILE..." && rm "$LOG_EXISTS_FILE";
echo "[i] Using $DNS_PROVIDER as DNS Resolver..."

## and check one per one ##
for i in $DOMAIN_LISTS;do
	echo -en "[i] Checking $i...\e[0K\r"
	result="$(dig $DNS_PROVIDER $i)"
	result_isNone="$(echo $result | grep 'ANSWER: 0' &>/dev/null;echo $?)"
	result_status="$(echo $result | grep ', status: ' &>/dev/null;echo $?)"
	if [ "$result_isNone" != "0" ];then
		echo -e "[+] $i exists\e[0K\r"
		echo $i >> "$LOG_EXISTS_FILE"
	elif echo $result_status | grep ', status: SERVFAIL' &>/dev/null;then
		echo -e "[!] DNS Resolver is out-of-time to query $i\e[0K\r"
		echo $i >> "$LOG_SERVFAIL_FILE"
	else
		echo -e "[-] $i not exist\e[0K\r"
		echo $i >> "$LOG_NONE_FILE"
	fi
done