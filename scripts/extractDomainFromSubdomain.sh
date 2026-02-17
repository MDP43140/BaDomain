#!/usr/bin/env bash
# shellcheck disable=SC2048,SC2086
#
# SPDX-FileCopyrightText: 2026 MDP43140
# SPDX-License-Identifier: GPL-3.0-or-later
#
[ $# = 0 ] && {
	echo "This script extracts domains from subdomains"
	echo "Usage: $0 [files]"
}
awk -F. '{
	if (NF > 1){
		if (NF > 2 && ($(NF-1) == "ac" || $(NF-1) == "co" || $(NF-1) == "go" || $(NF-1) == "my" || $(NF-1) == "ne")){
			print $(NF-2) "." $(NF-1) "." $NF
		} else {
			print $(NF-1) "." $NF
		}
	}
}' $* | sort -fui
