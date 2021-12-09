if [ -f $1.txt ] && [ ! -f $1.txt.old ];then
	echo "Appending all comments to $1.tx2 before continuing..."
	cat $1.txt | grep "^ *#" > $1.tx2
	echo "Removing dupes..."
	sort -u $1.txt | sed '/^#/d' >> $1.tx2
	mv $1.txt{,.old}
	mv $1.tx{2,t}
	echo "Done!"
else
	echo "$1.txt not exist or $1.txt.old exist, wont continue for failsafe"
	echo "make sure $1.txt exist or $1.txt.old removed/renamed to other names"
fi
