#!/usr/bin/env bash
#
#  What this script does?
#  it tries to scan every DNS response and
#  find if a domain exists or not
#  and soon going to be used against BaDomain lists
#

## Configuration ##
DNS_PROVIDER="@8.8.8.8" # nah its not private, but its really fast especially to spam all that domains bruhhh
INPUT_FILE="$1"
LOG_NONE_FILE="resultNone.log"
LOG_EXISTS_FILE="resultExists.log"
DOMAIN_LISTS="google.com youtube.com ThisDomainDoesntExistAtAll.dontreturnsomethingok"

## Query stuff... ##
echo -e "[i] Initializing..."
echo -e "[i] Querying $INPUT_FILE lists..."
DOMAIN_LISTS="$(sed '/^#/d' $INPUT_FILE | sed -r '/^(\b25[0-5]|\b2[0-4][0-9]|\b[01]?[0-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}$/d')"

## and check one per one ##
for i in $DOMAIN_LISTS;do
	echo -en "[i] Checking $i...\e[0K\r"
	result="$(dig $DNS_PROVIDER $i | grep 'ANSWER: 0' &>/dev/null;echo $?)"
	[ "$result" != "0" ] && echo -e "[+] $i Exists\e[0K\r" || echo -e "[-] $i Not Exist\e[0K\r"
	[ "$result" != "0" ] && echo $i >> "$LOG_EXISTS_FILE" || echo $i >> "$LOG_NONE_FILE"
done