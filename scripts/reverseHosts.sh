#!/usr/bin/env bash
#
#  What this script does?
#  it simply reverses the host file to regular txt file without those loopback ips
#

# Should generally match something like "127.0.0.1 " or "0.0.0.0 "
sed -E 's/^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\ //gi' $1_hosts.txt > $1.tx