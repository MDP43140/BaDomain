#!/usr/bin/env bash
#
#  What this script does?
#  this script filters comments, sorting and removing dupes, and puts the comment back, and optionally update the version date (optimized for hosts file)
#

if [ -f $1.txt ] && [ ! -f $1.txt.old ];then
	echo -en "\r[i] Appending all comments to $1.tx2 before continuing...\e[0K"
	cat $1.txt | grep "^ *#" | sed -r 's/^ *# Version: [0-9]{2}\.[0-9]{2}\.[0-9]{2,4}/# Version: '$(date +%d.%m.%Y)'/i' > $1.tx2
	echo -en "\r[i] Removing dupes...\e[0K"
	sort -u $1.txt | sed '/^#/d' >> $1.tx2
	mv $1.txt{,.old}
	mv $1.tx{2,t}
	echo -e "\r[+] Done cleaning $1!\e[0K"
else
	echo -e "[!] $1.txt not exist or $1.txt.old exist, wont continue for failsafe\e[0K"
	echo -e "[!] make sure $1.txt exist or $1.txt.old removed/renamed to other names\e[0K"
fi