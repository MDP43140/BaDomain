#!/bin/env sh
su -c "PATH=\"$PATH\" sqlite3 \
  /data/data/org.adaway/databases/app.db \
  'DELETE FROM hosts_lists WHERE type = 0 AND enabled = 1 AND source_id = 1 AND redirection IS NULL;';\
";