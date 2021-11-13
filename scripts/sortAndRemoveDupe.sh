if [ -f  $1.txt ] && [ ! -f $1.tx2 ];then
	sort -u $1.txt > $1.tx2
	rm -rf $1.txt
	mv $1.tx{2,t}
fi
