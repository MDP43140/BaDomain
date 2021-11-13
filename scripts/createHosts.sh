if [ -f $1.txt ] && [ ! -f $1_hosts.txt ];then
	for i in $(cat $1.txt);do echo "127.0.0.1 $i" >> $1_hosts.txt;done
fi
