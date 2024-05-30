#!/usr/bin/env bash
#
# Sorts domains based on the services
# to its different file names
#
# eg. tiktok related domains will go to NoTikTok.txt,
# so does facebook, oppo/ht, vivo, and others...
#
input_file="$1"
service_output_folder="../misc"
# clear all temp files
> ${service_output_folder}/aa2.tmp
> ${service_output_folder}/NoApple.tmp
> ${service_output_folder}/NoFB.tmp
> ${service_output_folder}/NoFreeFire.tmp
> ${service_output_folder}/NoGambling.tmp
> ${service_output_folder}/NoMLBB.tmp
> ${service_output_folder}/NoNSFW.tmp
> ${service_output_folder}/NoOppoHT.tmp
> ${service_output_folder}/NoRoblox.tmp
> ${service_output_folder}/NoTikTok.tmp
> ${service_output_folder}/NoVivo.tmp
> ${service_output_folder}/NoXiaomi.tmp
# main sorting code
while IFS= read -r line;do
	case "$line" in
		*.aaplimg.com|\
		*.apple.com|\
		*.apple.com.akadns.net|\
		*.apple.com.cn|\
		*.apple-dns.net|\
		*.apple-mapkit.com|\
		*.apple.news|\
		*.cdn-apple.com|\
		*.icloud.com|\
		*.icloud-content.com|\
		*.safebrowsing.apple)
			echo "$line" >> ${service_output_folder}/NoApple.tmp
		;;
		*.cdninstagram.com|\
		*.facebookcareers.com|\
		*.facebook.com|\
		*.facebookmail.com|\
		*.fbcdn.net|\
		*.fb.com|\
		*.fbsbx.com|\
		*.instagram.com|\
		*.mapiliary.com|\
		*.metacareers.com|\
		*.metastatus.com|\
		*.tfbnw.net|\
		*.whatsapp.com|\
		*.whatsapp.net)
			echo "$line" >> ${service_output_folder}/NoFB.tmp
		;;
		*.freefiremobile.com|\
		*.garena.com|\
		*.garena.co.id|\
		*.garenanow.com|\
		*.ggbluefox.com)
			echo "$line" >> ${service_output_folder}/NoFreeFire.tmp
		;;
		*bet*|\
		*casino*|\
		*domino*|\
		*gacha*|\
		*gacor*|\
		*jackpot*|\
		*judi*|\
		*kaskus*toto*|\
		*lottery*|\
		*poker*|\
		*rgo*|\
		*rtp*|\
		*rtg*|\
		*togel*|\
		*vegas*|\
		*viva*)
			echo "$line" >> ${service_output_folder}/NoGambling.tmp
		;;
		*.mlbangbang.com|\
		*.mobilelegends.com|\
		*.moonton.com|\
		*.youngjoygame.com|\
		*.yuanzhanapp.com)
			echo "$line" >> ${service_output_folder}/NoMLBB.tmp
		;;
		*.50union.com|\
		*.allawnfs.com|\
		*.allawnofs.com|\
		*.allawnos.com|\
		*.allawntech.com|\
		*.coloros.com|\
		*.heytap.com|\
		*.heytapdl.com|\
		*.heytapdownload.com|\
		*.heytapimage.com|\
		*.heytapimg.com|\
		*.heytapmobi.com|\
		*.heytapmobile.com|\
		*.myoppo.com|\
		*.oppo.com|\
		*.oppomobile.com)
			echo "$line" >> ${service_output_folder}/NoOppoHT.tmp
		;;
		*.rbx.com|\
		*.rbxcdn.com|\
		*.roblox.com)
			echo "$line" >> ${service_output_folder}/NoRoblox.tmp
		;;
		*.bsgslb.com|\
		*.byteadverts.com|\
		*.byte-app.com|\
		*.byteapp.com|\
		*.bytecdn.cn|\
		*.bytedanceapi.com|\
		*.bytedance.com|\
		*.bytedance.net|\
		*.bytedapm.com|\
		*.bytedns.com|\
		*.bytedns.net|\
		*.byted.org|\
		*.byted-static.com|\
		*.byteeffecttos-g.com|\
		*.bytegoofy.com|\
		*.bytegsdk.com|\
		*.byteicdn.com|\
		*.byteimg.com|\
		*.byteintlapi.com|\
		*.byteoversea.com|\
		*.byteoversea.com.edgekey.net|\
		*.byteoversea.com.edgesuite.net|\
		*.byteoversea.net|\
		*.bytescm.com|\
		*.bytetcc.com|\
		*.bytetcdn.com|\
		*.bytetos.com|\
		*.bytevcloud.com|\
		*.capcutapi.com|\
		*.capcut.com|\
		*.ibytedapm.com|\
		*.ibytedos.com|\
		*.ibytedtos.com|\
		*.ibytedtos.com.edgekey.net|\
		*.ibytedtos.com.edgesuite.net|\
		*.ibyteimg.com|\
		*.ibyteimg.com.akamaized.net|\
		*.ibyteimg.com.edgesuite.net|\
		*.ipstatp.com|\
		*.isnssdk.com|\
		*.lemon8-app.com|\
		*.musical.ly|\
		*.musical.ly.edgekey.net|\
		*.pangle-b.io|\
		*.pangle.io|\
		*.pangle.io.edgekey.net|\
		*.pstatp.com|\
		*.sgpstatp.com|\
		*.sgsnssdk.com|\
		*.snssdk.com|\
		*.tiktokcdn.com|\
		*.tiktokcdn.com.edgesuite.net|\
		*.tiktokcdn-eu.com|\
		*.tiktokcdn-us.com|\
		*.tiktok.com|\
		*.tiktok.com.edgekey.net|\
		*.tiktok.com.edgesuite.net|\
		*.tiktok-shops.com|\
		*.tiktokv.com|\
		*.tiktokv.com.edgekey.net|\
		*.tiktokv.com.edgesuite.net|\
		*.toutiao50.com|\
		*.toutiaocloud.com|\
		*.toutiao.com|\
		*.ttcache.com|\
		*.ttdns2.com|\
		*.ttlivecdn.com|\
		*.ttwstatic.com)
			echo "$line" >> ${service_output_folder}/NoTikTok.tmp
		;;
		*.vivo.com|\
		*.vivo.com.cn|\
		*.vivoglobal.com)
			echo "$line" >> ${service_output_folder}/NoVivo.tmp
		;;
		*.mi.com|\
		*.mi-img.com|\
		*.miui.com|\
		*.miwifi.com|\
		*.xiaomi.com|\
		*.xiaomi.net)
			echo "$line" >> ${service_output_folder}/NoXiaomi.tmp
		;;
		*adult*|\
		*babe*|\
		*bacol*|\
		*bokep*|\
		*cewek*|\
		*coli*|\
		*crot*|\
		*genit*|\
		*girl*|\
		*hot*girl*|\
		*hot*love|\
		*hot*teen*|\
		*hot*woman*|\
		*mantan*|\
		*memek*|\
		*montok*|\
		*naught*|\
		*nude*|\
		*tante*|\
		*porn*|\
		*seks*|\
		*sex*|\
		*tinder*hot*|\
		*vrbanger*|\
		*wanita*|\
		*xxx*|\
		*xnxx*|\
		*xhamster*)
			echo "$line" >> ${service_output_folder}/NoNSFW.tmp
		;;
		*)
			echo "$line" >> ../aa2.tmp
		;;
	esac
done < "$input_file"
insertFilteredToOrig(){
	# basically temporary file containing the filtered domains
	filtered="$1"
	# where to prepend the filtered list to
	orig="$2"
	# report added lines
	wc -l "$filtered"
	# append newline after domain list in tmp files
	echo >> "$filtered"
	# append orig list to temp & replace orig with temp
	cat "$orig" >> "$filtered" && mv -f "$filtered" "$orig"
}
insertFilteredToOrig ${service_output_folder}/aa2.tmp       ../BaDomain.txt
insertFilteredToOrig ${service_output_folder}/NoApple.tmp    ${service_output_folder}/NoApple.txt
insertFilteredToOrig ${service_output_folder}/NoFB.tmp       ${service_output_folder}/NoFB.txt
insertFilteredToOrig ${service_output_folder}/NoFreeFire.tmp ${service_output_folder}/NoFreeFire.txt
insertFilteredToOrig ${service_output_folder}/NoGambling.tmp ${service_output_folder}/NoGambling.txt
insertFilteredToOrig ${service_output_folder}/NoMLBB.tmp     ${service_output_folder}/NoMLBB.txt
insertFilteredToOrig ${service_output_folder}/NoNSFW.tmp     ${service_output_folder}/NoNSFW.txt
insertFilteredToOrig ${service_output_folder}/NoOppoHT.tmp   ${service_output_folder}/NoOppoHT.txt
insertFilteredToOrig ${service_output_folder}/NoRoblox.tmp   ${service_output_folder}/NoRoblox.txt
insertFilteredToOrig ${service_output_folder}/NoTikTok.tmp   ${service_output_folder}/NoTikTok.txt
insertFilteredToOrig ${service_output_folder}/NoVivo.tmp     ${service_output_folder}/NoVivo.txt
insertFilteredToOrig ${service_output_folder}/NoXiaomi.tmp   ${service_output_folder}/NoXiaomi.txt