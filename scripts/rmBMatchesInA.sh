#!/usr/bin/env bash
[ $# -ne 2 ] && {
  echo 'This script removes anything in 1st file'
  echo 'that matches string in 2nd file line-by-line'
  echo "Usage: $0 [inputFile] [blacklistFile]"
  exit 1
}

# make tmp file
tmp1=$(mktemp) # temp buffer
tmp2=$(mktemp) # copy of 1st file

# make tmp of 1st file
cp -f "$1" "$tmp2"
# process
while IFS= read;do
  # avoid empty line
  [ "${REPLY}" ] || continue;
  # remove things in A that matches B
  grep -vF "${REPLY}" "${tmp2}" > "${tmp1}"
  # move tmp to A, rinse and repeat
  mv -f "${tmp1}" "${tmp2}";
done < "$2" # read each line from B
cat "${tmp2}" # print result
rm -f "${tmp1}" "${tmp2}" # delete tmp

# done, ignore below lol
exit 0
grep -vFf \
  <(cat $2 | tr -d '\n' | tr -s ' ') \
  $1;