#!/usr/bin/env bash
# shellcheck disable=SC2048,SC2086
#
# SPDX-FileCopyrightText: 2026 MDP43140
# SPDX-License-Identifier: GPL-3.0-or-later
#
[ $# = 0 ] && {
	echo "This script sorts based on Top-Level-Domain"
	echo "TODO: preserve comment"
	echo "Usage: $0 [files]"
}
grep '^#' $*
grep -v '^#' $* \
 | awk -F. '{ for (i = NF;i > 0;i--){ printf $(i) "." } print "" }' \
 | sort -fui \
 | awk -F. '{ for (i = NF;i > 0;i--){ printf $(i) "." } print "" }' \
 | sed 's/^\.//;s/\.$//';
