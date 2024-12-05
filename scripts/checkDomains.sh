#!/usr/bin/env bash
#
#  SPDX-FileCopyrightText: 2021-2024 MDP43140
#  SPDX-License-Identifier: GPL-3.0-or-later
#
#  What this script does?
#  it tries to scan every DNS response and
#  find if a domain exists or not
#  and used to check BaDomain lists
#
#  TODO:
#  - make dig command query both IPv4 and IPv6 answers
#  - detect nonexistent sites by detecting redirects from www.domain.com
#    to ww123456.domain.com (put in other script to avoid accidental domain contact)
#

clear
echo -e "[i] Initializing..."

## Configuration ##
DNS_PROVIDER="@8.8.8.8" # nah its not private, but its fast especially to spam lots of DNS requests
INPUT_FILE="$1"
LOG_NONE_FILE="resultNone.log"
LOG_SERVFAIL_FILE="resultServFail.log"
LOG_EXISTS_FILE="resultExists.log"
DOMAIN_LISTS="google.com reddit.com example.com ThisDomainDoesntExistAtAll.dontreturnsomethingok adultpornographygamblingsexgaylgbtq.testcategory.com xijinpingputintiannamensquaremassacre.testcategory.com" # just for an example (standard,censored in Indonesia,example,not exist,DPI standard,DPI in China)

## Query domain lists, remove previous log, and stuff... ##
echo "[i] Querying ${INPUT_FILE:-StandardInput} domain lists..."
DOMAIN_LISTS=`sed '/^#/d' $INPUT_FILE | sed -r '/^(\b25[0-5]|\b2[0-4][0-9]|\b[01]?[0-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}$/d' | sort -ui`

# Count total domains
TOTAL_DOMAINS=`wc -l <<< "$DOMAIN_LISTS"`
[ "$TOTAL_DOMAINS" -le 1 ] && TOTAL_DOMAINS=`wc -w <<< "$DOMAIN_LISTS"`

# this script is able to work with stdin (./checkDomains.sh << EOF google.com youtube.com EOF), but there might be a bit of problems afaik
[ "$INPUT_FILE" = '' -a "$DOMAIN_LISTS" != '' ] && echo "[!] Reading from stdin... (Standard input)"
echo "[i] Total domains going to be scanned: $(echo $TOTAL_DOMAINS)"
[ -f "$LOG_NONE_FILE" ] && echo "[i] Removing $LOG_NONE_FILE..." && rm "$LOG_NONE_FILE";
[ -f "$LOG_SERVFAIL_FILE" ] && echo "[i] Removing $LOG_SERVFAIL_FILE..." && rm "$LOG_SERVFAIL_FILE";
[ -f "$LOG_EXISTS_FILE" ] && echo "[i] Removing $LOG_EXISTS_FILE..." && rm "$LOG_EXISTS_FILE";
echo "[i] Using $DNS_PROVIDER as DNS Resolver..."

## and check one per one ##
PROGRESS=0
PROGRESS_EXIST=0
PROGRESS_NOT_EXIST=0
PROGRESS_FAILED=0
for i in $DOMAIN_LISTS;do
	PROGRESS=$((PROGRESS+1))
	echo -en "\r[i] ($PROGRESS/$TOTAL_DOMAINS) Checking \e[1m$i\e[0;2;5m...\e[0m\e[0K"
	result=`dig $DNS_PROVIDER $i`
	exitcode="$?"
	if [ ! "$result" ];then
		echo -e "\r[!] No output for $i.\e[0K"
		echo $i >> "$LOG_SERVFAIL_FILE"
		PROGRESS_FAILED=$((PROGRESS_FAILED+1))
	elif grep -q 'restricted\|internetpositif\|trustpositif\|blockpage\|aduankonten\|116.206.10.31\|36.86.63.185' <<< "$result";then
		echo -e "\r[!] $i censored by government\e[0K"
		echo $i >> "$LOG_SERVFAIL_FILE"
		PROGRESS_FAILED=$((PROGRESS_FAILED+1))
	elif grep -q ', status: SERVFAIL' <<< "$result";then
		echo -e "\r[!] Server unable to query $i\e[0K"
		echo $i >> "$LOG_SERVFAIL_FILE"
		PROGRESS_FAILED=$((PROGRESS_FAILED+1))
	elif grep -q '; no servers could be reached' <<< "$result";then
		echo -e "\r[!] Server unable to query $i\e[0K"
		echo $i >> "$LOG_SERVFAIL_FILE"
		PROGRESS_FAILED=$((PROGRESS_FAILED+1))
	elif grep -q ';; communications error to ' <<< "$result";then
		echo -e "\r[!] Server unable to query $i\e[0K"
		echo $i >> "$LOG_SERVFAIL_FILE"
		PROGRESS_FAILED=$((PROGRESS_FAILED+1))
	elif grep -q ';; connection timed out ' <<< "$result";then
		echo -e "\r[!] Server unable to query $i\e[0K"
		echo $i >> "$LOG_SERVFAIL_FILE"
		PROGRESS_FAILED=$((PROGRESS_FAILED+1))
	elif [ $exitcode -eq 9 ];then
		echo -e "\r[!] No reply for $i from server\e[0K"
		echo $i >> "$LOG_SERVFAIL_FILE"
		PROGRESS_FAILED=$((PROGRESS_FAILED+1))
	elif [ $exitcode -eq 10 ];then
		echo -e "\r[!] Internal error when querying $i!\e[0K"
		echo $i >> "$LOG_SERVFAIL_FILE"
		PROGRESS_FAILED=$((PROGRESS_FAILED+1))
	elif ! grep -q 'ANSWER: 0' <<< "$result" && [ $exitcode -eq 0 ];then
		echo -e "\r[+] $i exists\e[0K"
		echo $i >> "$LOG_EXISTS_FILE"
		PROGRESS_EXIST=$((PROGRESS_EXIST+1))
	else
		echo -e "\r[-] $i not exist\e[0K"
		echo $i >> "$LOG_NONE_FILE"
		PROGRESS_NOT_EXIST=$((PROGRESS_NOT_EXIST+1))
	fi
done
echo -e "\r[i] Exist/Nonexist/Fail/Total domains: $PROGRESS_EXIST/$PROGRESS_NOT_EXIST/$PROGRESS_FAILED/$PROGRESS\e[0K"