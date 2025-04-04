#!/bin/env sh
#
# SPDX-FileCopyrightText: 2021-2025 MDP43140
# SPDX-License-Identifier: GPL-3.0-or-later
#
su -c "PATH=\"$PATH\" sqlite3 \
	/data/data/org.adaway/databases/app.db \
	'SELECT host FROM hosts_lists WHERE type = 0 AND enabled = 1 AND source_id = 1 AND redirection IS NULL;';\
";
