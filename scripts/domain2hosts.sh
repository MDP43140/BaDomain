#!/usr/bin/env bash
[ $# = 1 ] || {
  echo "This scripts converts domains into hosts file"
  echo "Usage: $0 [file]"
  echo "input is [file].txt, output is [file]_hosts.txt"
  exit 1
}
if [ -f $1.txt -a ! -f $1_hosts.txt ];then
	echo -en "\r[i] Creating $1 hosts file...\e[0K"
	# put comments to result file, add newline, remove comments,
	# add host target, put it to new hosts file
	grep "^ *#" $1.txt > $1_hosts.txt
	echo >> $1_hosts.txt
	grep -v '^$' $1.txt | sed '/^#/d;s/^/0.0.0.0 /' >> $1_hosts.txt
	echo -e "\r[+] $1 hosts file created!\e[0K"
else
	echo -e "[!] $1_hosts.txt exist or $1.txt did'nt exist, won't continue for failsafe.\e[0K"
	echo -e "[!] make sure $1.txt exist or $1_hosts.txt removed.\e[0K"
fi