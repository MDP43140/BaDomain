#!/usr/bin/env bash
#
# SPDX-FileCopyrightText: 2021-2024 MDP43140
# SPDX-License-Identifier: GPL-3.0-or-later
#
[ $# = 2 ] || {
  echo "This scripts adds extra newline every [splitEvery] lines"
  echo "Usage: $0 [file] [splitEvery]"
  exit 1
}
awk -v n=$2 'NR % n == 0 { print $0 "\n" } NR % n != 0' $1