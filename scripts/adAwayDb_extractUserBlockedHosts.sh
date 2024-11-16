#!/bin/env sh
su -c "sqlite3 \
  /data/data/org.adaway/databases/app.db \
  'SELECT host FROM hosts_lists WHERE type = 0 AND enabled = 1 AND source_id = 1 AND redirection IS NULL;';\
";