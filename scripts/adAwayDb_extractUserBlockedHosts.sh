#!/bin/env sh
#
# SPDX-FileCopyrightText: 2021-2025 MDP43140
# SPDX-License-Identifier: GPL-3.0-or-later
#
# host_entries:
# host|TEXT|1||1
# type|INTEGER|1||0
# redirection|TEXT|0||0
#
# hosts_lists:
# id|INTEGER|1||1
# host|TEXT|1||0
# type|INTEGER|1||0
# enabled|INTEGER|1||0
# redirection|TEXT|0||0
# source_id|INTEGER|1||0
#
# hosts_sources:
# id|INTEGER|1||1
# label|TEXT|1||0
# url|TEXT|1||0
# enabled|INTEGER|1||0
# allowEnabled|INTEGER|1||0
# redirectEnabled|INTEGER|1||0
# last_modified_local|INTEGER|0||0
# last_modified_online|INTEGER|0||0
# size|INTEGER|1||0
# entityTag|TEXT|0|NULL|0
#

su -c "PATH=\"$PATH\" sqlite3 \
	/data/data/org.adaway/databases/app.db \
	'SELECT host FROM hosts_lists WHERE type = 0 AND enabled = 1 AND source_id = 1 AND redirection IS NULL ORDER BY host COLLATE NOCASE ASC;';\
";
