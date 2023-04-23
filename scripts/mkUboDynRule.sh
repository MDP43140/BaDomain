clear
cat uBoDynRule_header.txt
echo
for i in `cat $@`;do echo "* $i * block" | grep "^ *#";done