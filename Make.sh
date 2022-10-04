clear
[ -z "$1" ] && echo -e "Arguments required. no argument was given.\ntry -h to show help page." && exit 1;
VERSION="$(date +%d.%m.%Y)"
UPDATE_FREQ="1 day" # unused
HOSTSFILE_TYPES=(
	"BaDomain"
	"misc/NoApple"
	"misc/NoFB"
	"misc/NoFreeFire"
	"misc/NoMLBB"
	"misc/NoTikTok"
	"misc/NoRoblox"
	"misc/NoXiaomi"
)
HOSTSFILE_TYPES="${HOSTSFILE_TYPES[@]}"
for i in "$@";do
	case "${i,,}" in
		-h|--help|h)
			echo
			echo " HostsBuilder (Usage: $0 [action])"
			echo "-------------------------"
			echo " h  | Display this help page"
			echo " b  | Cleans old files and dupes, Create all hosts files, and clean again"
			echo " c  | Clean .old files"
			echo " ca | Clean .old files and hosts file"
			echo
			exit 0
		;;
		b)
			echo "[!] This will delete/override .old backups! Renaming old hosts..."
			for i in $HOSTSFILE_TYPES;do
				rm -f $i{,_hosts}.txt.old
				[ -f "${i}_hosts.txt" ] && mv "${i}_hosts.txt"{,.old}
			done
			echo "[i] Removing dupes..."
			for i in $HOSTSFILE_TYPES;do
				scripts/sortAndRemoveDupe.sh $i
			done
			scripts/sortAndRemoveDupe.sh BaDomain_notExists
			echo "[i] Creating hosts..."
			for i in $HOSTSFILE_TYPES;do
				scripts/mkHosts.sh $i
			done
			echo "[i] Updating 'BaDomain_Uncensor' date..."
			sed -ri 's/Version: [0-9]{2}\.[0-9]{2}\.[0-9]{2,4}/Version: '$VERSION'/i' BaDomain_Uncensor.txt
			echo -n "[i] Cleaning..."
			rm $(ls *.old misc/*.old)
			echo -e "\r[+] Done!\e[0K"
		;;
		c)
			echo "Cleaning..."
			rm $(ls *.old misc/*.old)
		;;
		ca)
			echo "Cleaning..."
			rm $(ls *.old misc/*.old *hosts.txt misc/*hosts.txt)
		;;
		*)
			echo "Invalid argument. try -h to show help page."
			exit 1
		;;
	esac
done
exit 0