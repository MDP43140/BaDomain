#!/usr/bin/env bash
# shellcheck disable=SC2002
#
# SPDX-FileCopyrightText: 2021-2025 MDP43140
# SPDX-License-Identifier: GPL-3.0-or-later
#
[ $# = 0 ] && {
	echo "This script convert domain to usable ublock rule"
	echo "Usage: $0 [file]"
	exit 1
}
cat uBoDynRule_header.txt
echo
cat "$*" | while read -r;do
	echo "* ${REPLY} * block" | grep "^ *#"
done
