if [ -f $1.txt ] && [ ! -f $1_hosts.txt ];then
	sed '/^#/d' $1.txt | sed -r '/^(\b25[0-5]|\b2[0-4][0-9]|\b[01]?[0-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}$/d' > $1.tx0
	cat $1.txt | grep "^ *#" | sed -r 's/^ *# Version: [0-9]{2}\.[0-9]{2}\.[0-9]{2,4}/# Version: '$(date +%d.%m.%Y)'/i' > $1_hosts.txt
	echo "" >> $1_hosts.txt
	for i in $(cat $1.tx0);do echo "127.0.0.1 $i" >> $1_hosts.txt;done
	rm $1.tx0
else
	echo "$1_hosts.txt exist or $1.txt did'nt exist, won't continue for failsafe."
	echo "make sure $1.txt exist or $1_hosts.txt removed."
fi
