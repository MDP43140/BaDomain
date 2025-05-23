#!/usr/bin/env bash
# shellcheck disable=SC2068
#
# SPDX-FileCopyrightText: 2021-2025 MDP43140
# SPDX-License-Identifier: GPL-3.0-or-later
#
[ $# = 0 ] && {
	echo "This script converts a lists of domain to tcpdump format"
	echo "Usage: $0 [files]"
	echo "       tcpdump | $0"
}
sed -E 's/(.+)/IP src.0 > dst.53: 0+ A? \1. (0)/' $@ \
 | sort -ui;
