#!/usr/bin/env bash
#
# SPDX-FileCopyrightText: 2021-2024 MDP43140
# SPDX-License-Identifier: GPL-3.0-or-later
#
[ $# = 0 ] && {
  echo "This script convert domain to usable ublock rule"
  echo "Usage: $0 [file]"
  exit 1
}
cat uBoDynRule_header.txt
echo
for i in `cat $@`;do echo "* $i * block" | grep "^ *#";done