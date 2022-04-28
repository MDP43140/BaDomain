clear
if [ "$1" == "" ];then
	echo "Arguments required. no argument was given."
	echo "try -h to show help page."
	exit 1
fi
VERSION="$(date +%d.%m.%Y)"
UPDATE_FREQ="1 day"
for i in "$@";do
	case $(tr '[:upper:]' '[:lower:]' <<<"$i") in
		-h|--help|h|help)
			echo " HostsBuilder"
			echo "-------------------------"
			echo " h  help               | Display this help page"
			echo " b  build              | Cleans old files, Cleans dupes, Create hosts files"
			echo " ba build-all-clean    | Cleans old files and dupes, Create all hosts files, and clean again"
			echo " m  mkHosts            | Create hosts file"
			echo " mm mkHosts-misc       | Create hosts file (misc)"
			echo " mu mkHosts-uni        | Create hosts file (universal)"
			echo " ma mkHosts-all        | Create hosts file (all files)"
			echo " c  clean              | Clean .old files"
			echo " ca clean-all          | Clean .old files and hosts file"
			echo " mp mkHosts-uni-mypref | melol"
			exit 0
		;;
		m|mkhosts)
			echo Creating regular hosts...
			if [ -f BaDomain_hosts.txt ];then mv BaDomain_hosts.txt BaDomain_hosts.txt.old;fi
			scripts/mkHosts.sh BaDomain
		;;
		mm|mkhosts-misc)
			echo Creating misc hosts...
			if [ -f misc/NoFB_hosts.txt ];then mv misc/NoFB_hosts.txt misc/NoFB_hosts.txt.old;fi
			if [ -f misc/NoFreeFire_hosts.txt ];then mv misc/NoFreeFire_hosts.txt misc/NoFreeFire_hosts.txt.old;fi
			if [ -f misc/NoMLBB_hosts.txt ];then mv misc/NoMLBB_hosts.txt misc/NoMLBB_hosts.txt.old;fi
			if [ -f misc/NoTikTok_hosts.txt ];then mv misc/NoTikTok_hosts.txt misc/NoTikTok_hosts.txt.old;fi
			scripts/mkHosts.sh misc/NoFB
			scripts/mkHosts.sh misc/NoFreeFire
			scripts/mkHosts.sh misc/NoMLBB
			scripts/mkHosts.sh misc/NoTikTok
		;;
		mu|mkhosts-uni)
			echo Creating unified hosts \(make sure the hosts file exists\!\)...
			if [ -f BaDomain_Unified-hosts.txt ];then mv BaDomain_Unified-hosts.txt BaDomain_Unified-hosts.txt.old;fi
			echo "#" > "BaDomain_Unified-hosts.txt"
			echo "# Name: BaDomain Unified" >> "BaDomain_Unified-hosts.txt"
			echo "# Desc: An \"addon\" to block even more domains that existing lists cover already" >> "BaDomain_Unified-hosts.txt"
			echo "# Version: $VERSION" >> "BaDomain_Unified-hosts.txt"
			echo "# Update: 1 days" >> "BaDomain_Unified-hosts.txt"
			echo "#" >> "BaDomain_Unified-hosts.txt"
			echo "# This is one single unified hosts file based on:" >> "BaDomain_Unified-hosts.txt"
			echo "# - Default" >> "BaDomain_Unified-hosts.txt"
			echo "# - No Facebook" >> "BaDomain_Unified-hosts.txt"
			echo "# - No Free Fire" >> "BaDomain_Unified-hosts.txt"
			echo "# - No MLBB" >> "BaDomain_Unified-hosts.txt"
			echo "# - No TikTok" >> "BaDomain_Unified-hosts.txt"
			echo "#" >> "BaDomain_Unified-hosts.txt"
			echo "" >> "BaDomain_Unified-hosts.txt"
			sed '/^#/d' BaDomain_hosts.txt misc/NoFB_hosts.txt misc/NoFreeFire_hosts.txt misc/NoMLBB_hosts.txt misc/NoTikTok_hosts.txt >> "BaDomain_Unified-hosts.txt"
		;;
		ma|mkhosts-all)
			echo Renaming old hosts...
			if [ -f BaDomain_hosts.txt ];then mv BaDomain_hosts.txt BaDomain_hosts.txt.old;fi
			if [ -f misc/NoFB_hosts.txt ];then mv misc/NoFB_hosts.txt misc/NoFB_hosts.txt.old;fi
			if [ -f misc/NoFreeFire_hosts.txt ];then mv misc/NoFreeFire_hosts.txt misc/NoFreeFire_hosts.txt.old;fi
			if [ -f misc/NoMLBB_hosts.txt ];then mv misc/NoMLBB_hosts.txt misc/NoMLBB_hosts.txt.old;fi
			if [ -f misc/NoTikTok_hosts.txt ];then mv misc/NoTikTok_hosts.txt misc/NoTikTok_hosts.txt.old;fi
			if [ -f BaDomain_Unified-hosts.txt ];then mv BaDomain_Unified-hosts.txt BaDomain_Unified-hosts.txt.old;fi
			echo Creating hosts...
			echo
			scripts/mkHosts.sh BaDomain
			echo
			scripts/mkHosts.sh misc/NoFB
			echo
			scripts/mkHosts.sh misc/NoFreeFire
			echo
			scripts/mkHosts.sh misc/NoMLBB
			echo
			scripts/mkHosts.sh misc/NoTikTok
			echo
			echo "#" > BaDomain_Unified-hosts.txt
			echo "# Name: BaDomain Unified" >> BaDomain_Unified-hosts.txt
			echo "# Desc: An \"addon\" to block even more domains that existing lists cover already" >> BaDomain_Unified-hosts.txt
			echo "# Version: $VERSION" >> BaDomain_Unified-hosts.txt
			echo "# Update: 1 days" >> BaDomain_Unified-hosts.txt
			echo "#" >> BaDomain_Unified-hosts.txt
			echo "# This is one single unified hosts file based on:" >> BaDomain_Unified-hosts.txt
			echo "# - Default" >> BaDomain_Unified-hosts.txt
			echo "# - No Facebook" >> BaDomain_Unified-hosts.txt
			echo "# - No Free Fire" >> BaDomain_Unified-hosts.txt
			echo "# - No MLBB" >> BaDomain_Unified-hosts.txt
			echo "# - No TikTok" >> BaDomain_Unified-hosts.txt
			echo "#" >> BaDomain_Unified-hosts.txt
			echo "" >> BaDomain_Unified-hosts.txt
			sed '/^#/d' BaDomain_hosts.txt misc/NoFB_hosts.txt misc/NoFreeFire_hosts.txt misc/NoMLBB_hosts.txt misc/NoTikTok_hosts.txt >> "BaDomain_Unified-hosts.txt"
			clear
			echo "Done!"
		;;
		b|build) # some easy script thing...
			echo Warning: this will override old backups\! Renaming old hosts...
			rm -f BaDomain_hosts.txt.old
			rm -f misc/NoFB_hosts.txt.old
			rm -f misc/NoFreeFire_hosts.txt.old
			rm -f misc/NoMLBB_hosts.txt.old
			rm -f misc/NoTikTok_hosts.txt.old
			rm -f BaDomain.txt.old
			rm -f misc/NoFB.txt.old
			rm -f misc/NoFreeFire.txt.old
			rm -f misc/NoMLBB.txt.old
			rm -f misc/NoTikTok.txt.old
			if [ -f BaDomain_hosts.txt ];then mv BaDomain_hosts.txt BaDomain_hosts.txt.old;fi
			if [ -f misc/NoFB_hosts.txt ];then mv misc/NoFB_hosts.txt misc/NoFB_hosts.txt.old;fi
			if [ -f misc/NoFreeFire_hosts.txt ];then mv misc/NoFreeFire_hosts.txt misc/NoFreeFire_hosts.txt.old;fi
			if [ -f misc/NoMLBB_hosts.txt ];then mv misc/NoMLBB_hosts.txt misc/NoMLBB_hosts.txt.old;fi
			if [ -f misc/NoTikTok_hosts.txt ];then mv misc/NoTikTok_hosts.txt misc/NoTikTok_hosts.txt.old;fi
			if [ -f BaDomain_Unified-hosts.txt ];then mv BaDomain_Unified-hosts.txt BaDomain_Unified-hosts.txt.old;fi
			echo Removing dupes...
			echo
			scripts/sortAndRemoveDupe.sh BaDomain
			echo
			scripts/sortAndRemoveDupe.sh misc/NoFB
			echo
			scripts/sortAndRemoveDupe.sh misc/NoFreeFire
			echo
			scripts/sortAndRemoveDupe.sh misc/NoMLBB
			echo
			scripts/sortAndRemoveDupe.sh misc/NoTikTok
			echo
			echo Creating hosts...
			echo
			scripts/mkHosts.sh BaDomain
			echo
			scripts/mkHosts.sh misc/NoFB
			echo
			scripts/mkHosts.sh misc/NoFreeFire
			echo
			scripts/mkHosts.sh misc/NoMLBB
			echo
			scripts/mkHosts.sh misc/NoTikTok
			echo
			echo "#" > BaDomain_Unified-hosts.txt
			echo "# Name: BaDomain Unified" >> BaDomain_Unified-hosts.txt
			echo "# Desc: An \"addon\" to block even more domains that existing lists cover already" >> BaDomain_Unified-hosts.txt
			echo "# Version: $VERSION" >> BaDomain_Unified-hosts.txt
			echo "# Update: 1 days" >> BaDomain_Unified-hosts.txt
			echo "#" >> BaDomain_Unified-hosts.txt
			echo "# This is one single unified hosts file based on:" >> BaDomain_Unified-hosts.txt
			echo "# - Default" >> BaDomain_Unified-hosts.txt
			echo "# - No Facebook" >> BaDomain_Unified-hosts.txt
			echo "# - No Free Fire" >> BaDomain_Unified-hosts.txt
			echo "# - No MLBB" >> BaDomain_Unified-hosts.txt
			echo "# - No TikTok" >> BaDomain_Unified-hosts.txt
			echo "#" >> BaDomain_Unified-hosts.txt
			echo "" >> BaDomain_Unified-hosts.txt
			sed '/^#/d' BaDomain_hosts.txt misc/NoFB_hosts.txt misc/NoFreeFire_hosts.txt misc/NoMLBB_hosts.txt misc/NoTikTok_hosts.txt >> "BaDomain_Unified-hosts.txt"
			echo "Done!"
		;;
		ba|build-all-clean)
			echo Warning: this will override old backups\! Renaming old hosts...
			rm -f BaDomain_hosts.txt.old
			rm -f misc/NoFB_hosts.txt.old
			rm -f misc/NoFreeFire_hosts.txt.old
			rm -f misc/NoMLBB_hosts.txt.old
			rm -f misc/NoTikTok_hosts.txt.old
			rm -f BaDomain.txt.old
			rm -f misc/NoFB.txt.old
			rm -f misc/NoFreeFire.txt.old
			rm -f misc/NoMLBB.txt.old
			rm -f misc/NoTikTok.txt.old
			if [ -f BaDomain_hosts.txt ];then mv BaDomain_hosts.txt BaDomain_hosts.txt.old;fi
			if [ -f misc/NoFB_hosts.txt ];then mv misc/NoFB_hosts.txt misc/NoFB_hosts.txt.old;fi
			if [ -f misc/NoFreeFire_hosts.txt ];then mv misc/NoFreeFire_hosts.txt misc/NoFreeFire_hosts.txt.old;fi
			if [ -f misc/NoMLBB_hosts.txt ];then mv misc/NoMLBB_hosts.txt misc/NoMLBB_hosts.txt.old;fi
			if [ -f misc/NoTikTok_hosts.txt ];then mv misc/NoTikTok_hosts.txt misc/NoTikTok_hosts.txt.old;fi
			if [ -f BaDomain_Unified-hosts.txt ];then mv BaDomain_Unified-hosts.txt BaDomain_Unified-hosts.txt.old;fi
			echo Removing dupes...
			echo
			scripts/sortAndRemoveDupe.sh BaDomain
			echo
			scripts/sortAndRemoveDupe.sh misc/NoFB
			echo
			scripts/sortAndRemoveDupe.sh misc/NoFreeFire
			echo
			scripts/sortAndRemoveDupe.sh misc/NoMLBB
			echo
			scripts/sortAndRemoveDupe.sh misc/NoTikTok
			echo
			echo Creating hosts...
			echo
			scripts/mkHosts.sh BaDomain
			echo
			scripts/mkHosts.sh misc/NoFB
			echo
			scripts/mkHosts.sh misc/NoFreeFire
			echo
			scripts/mkHosts.sh misc/NoMLBB
			echo
			scripts/mkHosts.sh misc/NoTikTok
			echo
			echo "#" > BaDomain_Unified-hosts.txt
			echo "# Name: BaDomain Unified" >> BaDomain_Unified-hosts.txt
			echo "# Desc: An \"addon\" to block even more domains that existing lists cover already" >> BaDomain_Unified-hosts.txt
			echo "# Version: $VERSION" >> BaDomain_Unified-hosts.txt
			echo "# Update: 1 days" >> BaDomain_Unified-hosts.txt
			echo "#" >> BaDomain_Unified-hosts.txt
			echo "# This is one single unified hosts file based on:" >> BaDomain_Unified-hosts.txt
			echo "# - Default" >> BaDomain_Unified-hosts.txt
			echo "# - No Facebook" >> BaDomain_Unified-hosts.txt
			echo "# - No Free Fire" >> BaDomain_Unified-hosts.txt
			echo "# - No MLBB" >> BaDomain_Unified-hosts.txt
			echo "# - No TikTok" >> BaDomain_Unified-hosts.txt
			echo "#" >> BaDomain_Unified-hosts.txt
			echo "" >> BaDomain_Unified-hosts.txt
			sed '/^#/d' BaDomain_hosts.txt misc/NoFB_hosts.txt misc/NoFreeFire_hosts.txt misc/NoMLBB_hosts.txt misc/NoTikTok_hosts.txt >> "BaDomain_Unified-hosts.txt"
			if [ -f BaDomain_Unified-hosts_MyUseCase.txt ];then mv BaDomain_Unified-hosts_MyUseCase.txt BaDomain_Unified-hosts_MyUseCase.txt.old;fi
			echo "#" > "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "# Name: BaDomain Unified" >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "# Desc: An \"addon\" to block even more domains that existing lists cover already" >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "# Version: $VERSION" >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "# Update: 1 days" >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "#" >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "# Honestly, i dont use facebook/instagram, but when i need it, bruh JUST TOO MUCH AGONY, so this list is created." >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "#" >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "# This is one single unified hosts file based on:" >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "# - Default" >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "# - No MLBB" >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "# - No TikTok" >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "#" >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "" >> "BaDomain_Unified-hosts_MyUseCase.txt"
			sed '/^#/d' BaDomain_hosts.txt misc/NoMLBB_hosts.txt misc/NoTikTok_hosts.txt >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "Cleaning..."
			rm $(ls *.old misc/*.old)
			echo "Done!"
		;;
		c|clean)
			echo "Cleaning..."
			rm $(ls *.old misc/*.old)
		;;
		ca|clean-all)
			echo "Cleaning..."
			rm $(ls *.old misc/*.old *hosts.txt misc/*hosts.txt)
		;;
		mp|mkhosts-uni-mypref)
			if [ -f BaDomain_Unified-hosts_MyUseCase.txt ];then mv BaDomain_Unified-hosts_MyUseCase.txt BaDomain_Unified-hosts_MyUseCase.txt.old;fi
			echo "#" > "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "# Name: BaDomain Unified" >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "# Desc: An \"addon\" to block even more domains that existing lists cover already" >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "# Version: $VERSION" >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "# Update: 1 days" >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "#" >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "# Honestly, i dont use facebook/instagram, but when i need it, bruh JUST TOO MUCH AGONY, so this list is created." >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "#" >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "# This is one single unified hosts file based on:" >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "# - Default" >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "# - No MLBB" >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "# - No TikTok" >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "#" >> "BaDomain_Unified-hosts_MyUseCase.txt"
			echo "" >> "BaDomain_Unified-hosts_MyUseCase.txt"
			sed '/^#/d' BaDomain_hosts.txt misc/NoMLBB_hosts.txt misc/NoTikTok_hosts.txt >> "BaDomain_Unified-hosts_MyUseCase.txt"
		;;
		*)
			echo "Invalid argument. try -h to show help page."
			exit 1
		;;
	esac
done
exit 0
