#!/usr/bin/env bash
#
# SPDX-FileCopyrightText: 2021-2025 MDP43140
# SPDX-License-Identifier: GPL-3.0-or-later
#
# This script filters comments, sorting and removing dupes, and puts the comment back,
# and optionally update the version date (optimized for hosts file)
#

if [ -f $1.txt ];then
	grep "^ *#" $1.txt | sed -r 's/^ *# Version: [0-9]{2}\.[0-9]{2}\.[0-9]{2,4}/# Version: '$(date +%d.%m.%Y)'/i' > $1.tx2
	sort -u $1.txt | sed '/^#/d' >> $1.tx2
	mv $1.tx{2,t} &
	echo -e "\r[+] Done cleaning $1!\e[0K"
else
	echo -e "[!] $1.txt not exist\e[0K"
fi