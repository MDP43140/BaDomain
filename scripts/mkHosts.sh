if [ -f $1.txt ] && [ ! -f $1_hosts.txt ];then
	echo "Creating replicate without comment..."
	sed '/^#/d' $1.txt > $1.tx0
	echo "Appending all comments to $1 before continuing..."
	cat $1.txt | grep "^ *#" > $1_hosts.txt
	echo "" >> $1_hosts.txt
	echo "Adding all lists..."
	for i in $(cat $1.tx0);do echo "127.0.0.1 $i" >> $1_hosts.txt;done
	rm -rf $1.tx0
	echo "Done!"
else
	echo "$1_hosts.txt exist or $1.txt did not exist, the script wont continue for failsafe."
	echo "to continue, make sure $1.txt exist or $1_hosts.txt removed/renamed to other names."
fi
