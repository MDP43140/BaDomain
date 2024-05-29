#!/usr/bin/env bash
[ $# = 2 ] || {
  echo "This scripts adds extra newline every [splitEvery] lines"
  echo "Usage: $0 [file] [splitEvery]"
  exit 1
}
awk -v n=$2 'NR % n == 0 { print $0 "\n" } NR % n != 0' $1