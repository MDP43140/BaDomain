#
# SPDX-FileCopyrightText: 2021-2025 MDP43140
# SPDX-License-Identifier: GPL-3.0-or-later
#
import sys

if len(sys.argv) < 2:
	# eg. inputFile contains [a,b], blacklistFile contains [c,d,b,e,f,...]
	print(f"Usage: {sys.argv[0]} [inputFile] [blacklistFile]")
	sys.exit(1)

def remove_matching_lines(a,b):
	# Read lines from file B into a set for fast lookup
	lines_to_remove = set(line.strip() for line in b)

	# Read lines from file A and filter out the matching lines
	filtered_lines = [line for line in a if line.strip() not in lines_to_remove]

	for line in filtered_lines:
		print(line,end='')

remove_matching_lines(open(sys.argv[1],'r'),open(sys.argv[2],'r'))