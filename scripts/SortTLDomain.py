#
# SPDX-FileCopyrightText: 2021-2024 MDP43140
# SPDX-License-Identifier: GPL-3.0-or-later
#
import sys

if len(sys.argv) < 2:
	print(f"Usage: {sys.argv[0]} [files or - for pipe stream]")
	sys.exit(1)

if sys.argv[1] == "-":
	urls = sys.stdin.read()
else:
	with open(sys.argv[1]) as f:
		# read file
		urls = f.read()

def splitrevstr(s):
	# Turn "www.google.com" > ["com","google","www"].
	return list(reversed(s.split('.')))

# Now this will sort ".com" before ".edu", "youtu.be" before "google.com", and so on.
for i in sorted(urls.splitlines(),key=splitrevstr):print(i)