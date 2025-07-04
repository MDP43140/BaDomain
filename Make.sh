#!/usr/bin/env bash
# shellcheck disable=SC2048,SC2128,SC2178
#
# SPDX-FileCopyrightText: 2021-2025 MDP43140
# SPDX-License-Identifier: GPL-3.0-or-later
#
clear
[ "$1" ] || (echo -e "Arguments required. no argument was given.\ntry -h to show help page.";exit 1);
VERSION=$(date +%d.%m.%Y)
#UPDATE_FREQ="7 days" # unused
HOSTSFILE_TYPES=(
	"BaDomain"
	"misc/Advanced"
	"misc/NoApple"
	"misc/NoChinaOverseaSpy"
	"misc/NoFB"
	"misc/NoGambling"
	"misc/NoFreeFire"
	"misc/NoMalware"
	"misc/NoMLBB"
	"misc/NoNSFW"
	"misc/NoOppoHT"
	"misc/NoRoblox"
	"misc/NoSamsung"
	"misc/NoScam"
	"misc/NoTikTok"
	"misc/NoVivo"
	"misc/NoXiaomi"
)
HOSTSFILE_TYPES="${HOSTSFILE_TYPES[*]}"
for a in $*;do
	case "${a,,}" in
		-h|--help|h)
			echo
			echo " HostsBuilder (Usage: $0 [action])"
			echo "-------------------------"
			echo " h  | Display this help page"
			echo " b  | Cleans old files and dupes, Create all hosts files, and clean again"
			echo " c  | Clean .old files"
			echo " ca | Clean .old files and hosts file"
			echo
			exit 0
		;;
		b)
			echo "[!] This will delete/override .old backups! Renaming old hosts..."
			for i in ${HOSTSFILE_TYPES};do
				rm -f "$i"{,_hosts}.txt.old
				[ -f "${i}_hosts.txt" ] && mv "${i}_hosts.txt"{,.old}
			done
			echo "[i] Removing dupes..."
			for i in ${HOSTSFILE_TYPES};do
				${SHELL} scripts/sortAndRemoveDupe.sh "${i}"
			done
			${SHELL} scripts/sortAndRemoveDupe.sh BaDomain_notExists
			echo "[i] Creating hosts..."
			for i in ${HOSTSFILE_TYPES};do
				${SHELL} scripts/domain2hosts.sh "${i}"
			done
			echo -n "[i] Cleaning..."
			rm ./*.old misc/*.old
			echo -e "\r[+] Done!\e[0K"
		;;
		c)
			echo "Cleaning..."
			rm ./*.old misc/*.old
		;;
		ca)
			echo "Cleaning..."
			rm ./*.old misc/*.old ./*hosts.txt misc/*hosts.txt
		;;
		*)
			echo "Invalid argument. try -h to show help page."
			exit 1
		;;
	esac
done
exit 0
