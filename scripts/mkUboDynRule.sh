clear
cat uBoDynRule_header.txt
echo ""
for i in $(cat $1);do echo "* $i * block" | grep "^ *#";done
