#!/usr/bin/env bash
[ $# = 0 ] && {
  echo "This script convert domain to usable ublock rule"
  echo "Usage: $0 [file]"
  exit 1
}
cat uBoDynRule_header.txt
echo
for i in `cat $@`;do echo "* $i * block" | grep "^ *#";done