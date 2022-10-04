if [ -f $1.txt -a ! -f $1_hosts.txt ];then
	echo -en "\r[+] Creating hosts file of $1...\e[0K"
	sed '/^#/d' $1.txt | sed -r '/^(\b25[0-5]|\b2[0-4][0-9]|\b[01]?[0-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}$/d' > $1.tx0
	cat $1.txt | grep "^ *#" | sed -r 's/^ *# Version: [0-9]{2}\.[0-9]{2}\.[0-9]{2,4}/# Version: '$(date +%d.%m.%Y)'/i' > $1_hosts.txt
	echo >> $1_hosts.txt
	for i in $(cat $1.tx0);do echo "0.0.0.0 $i" >> $1_hosts.txt;done
	rm $1.tx0
	echo -e "\r[+] Done creating $1 hosts file!\e[0K"
else
	echo -e "[!] $1_hosts.txt exist or $1.txt did'nt exist, won't continue for failsafe.\e[0K"
	echo -e "[!] make sure $1.txt exist or $1_hosts.txt removed.\e[0K"
fi