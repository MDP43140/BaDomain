#!/usr/bin/env bash
#
# SPDX-FileCopyrightText: 2021-2025 MDP43140
# SPDX-License-Identifier: GPL-3.0-or-later
#
# Sorts domains based on the services
# to its different file names
#
# eg. tiktok related domains will go to NoTikTok.txt,
# so does facebook, oppo/ht, vivo, and others...
#
service_output_folder="../misc"
# clear all temp files
true > ${service_output_folder}/aa2.tmp
true > ${service_output_folder}/NoApple.tmp
true > ${service_output_folder}/NoChinaOverseaSpy.tmp
true > ${service_output_folder}/NoFB.tmp
true > ${service_output_folder}/NoFreeFire.tmp
true > ${service_output_folder}/NoGambling.tmp
true > ${service_output_folder}/NoMLBB.tmp
true > ${service_output_folder}/NoNSFW.tmp
true > ${service_output_folder}/NoOppoHT.tmp
true > ${service_output_folder}/NoRoblox.tmp
true > ${service_output_folder}/NoSamsung.tmp
true > ${service_output_folder}/NoTikTok.tmp
true > ${service_output_folder}/NoVivo.tmp
true > ${service_output_folder}/NoXiaomi.tmp
# main sorting code
while IFS= read -r line;do
	case "$line" in
		*.aaplimg.com|\
		*.apple.com|\
		*.apple.com.cn|\
		*.apple-dns.net|\
		*.apple-mapkit.com|\
		*.apple.map.fastly.net|\
		*.apple.news|\
		*.cdn-apple.com|\
		*.icloud.com|\
		*.icloud-content.com|\
		*.safebrowsing.apple|\
		*apple.com.akadns.net)
			echo "$line" >> ${service_output_folder}/NoApple.tmp
		;;
		*.steamchina.com)
			echo "$line" >> ${service_output_folder}/NoChinaOverseaSpy.tmp
		;;
		*.cdninstagram.com|\
		*.facebookcareers.com|\
		*.facebook.com|\
		*.facebook.net|\
		*.facebookmail.com|\
		*.fbcdn.net|\
		*.fb.com|\
		*.fbpigeon.com|\
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
		*.ggbluefox.com|\
		*.ggblueshark.com|\
		*.pencilorange.com|\
		*.purplevioleto.com)
			echo "$line" >> ${service_output_folder}/NoFreeFire.tmp
		;;
		*.mlbangbang.com|\
		*.mobilelegends.com|\
		*.moonton.com|\
		*.moonton.org|\
		*.moontonsafe.com|\
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
		*.aibixby.com|\
		*.remotesamsung.com|\
		*.samsung.com|\
		*.samsung-dict.com|\
		*.samsung-gamelauncher.com|\
		*.samsungapps.com|\
		*.samsungcloud.com|\
		*.samsungcloudplatform.com|\
		*.samsungcloudsolution.com|\
		*.samsungconsent.com|\
		*.samsungdive.com|\
		*.samsungdm.com|\
		*.samsunghealth.com|\
		*.samsungknox.com|\
		*.samsungosp.com|\
		*.samsungpositioning.com|\
		*.samsungqbe.com|\
		*.samsungrs.com|\
		*.samsungsds.com|\
		*.samsungtvplus.com|\
		*.samsungvisioncloud.com|\
		*.samsungweather.com)
			echo "$line" >> ${service_output_folder}/NoSamsung.tmp
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
		*.bytednsdoc.com|\
		*.bytedns.net|\
		*.byted.org|\
		*.byted-static.com|\
		*.byteeffecttos-g.com|\
		*.bytegoofy.com|\
		*.bytegsdk.com|\
		*.byteicdn.com|\
		*.byteimg.com|\
		*.byteintl.com|\
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
		*.douyinstatic.com|\
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
		*.tiktokmusic.app|\
		*.tiktok.com|\
		*.tiktok.com.edgekey.net|\
		*.tiktok.com.edgesuite.net|\
		*.tiktok-shops.com|\
		*.tiktok-row.org|\
		*.tiktokrow-cdn.com|\
		*.tiktokeu-cdn.com|\
		*.tiktokv.com|\
		*.tiktokv.com.edgekey.net|\
		*.tiktokv.com.edgesuite.net|\
		*.toutiao50.com|\
		*.toutiaocloud.com|\
		*.toutiao.com|\
		*.ttdns2.com|\
		*.ttlivecdn.com|\
		*.ttwstatic.com|\
		*.trae.ai)
			# Yup no joke, bytedance (just like other chinese services)
			# literally just bought 70 domains, no one does this
			# with Apple + Facebook + Roblox + Samsung (12 + 15 + 3 + 17 = 47, all of them are not china btw)
			# combined, they just 50% of domains owned by bytedance
			echo "$line" >> ${service_output_folder}/NoTikTok.tmp
		;;
		*.vivo.com|\
		*.vivo.com.cn|\
		*.vivoglobal.com)
			echo "$line" >> ${service_output_folder}/NoVivo.tmp
		;;
		*.appmifile.com|\
		*.mi.com|\
		*.mi-img.com|\
		*.mifile.cn|\
		*.miui.com|\
		*.miwifi.com|\
		*.xiaomi.com|\
		*.xiaomi.net)
			echo "$line" >> ${service_output_folder}/NoXiaomi.tmp
		;;
		*bet*|\
		*casino*|\
		*domino*|\
		*gacha*|\
		*gacor*|\
		*higgs*|\
		*jackpot*|\
		*judi*|\
		*kaskus*toto*|\
		*lottery*|\
		*macau*|\
		*poker*|\
		*rgo*|\
		*rtp*|\
		*rtg*|\
		*slot*|\
		*trio*|\
		*triple*|\
		*togel*|\
		*vegas*|\
		*viva*)
			echo "$line" >> ${service_output_folder}/NoGambling.tmp
		;;
		*adult*|\
		*babe*|\
		*bacol*|\
		*.bigo.sg*|\
		*.bigo.tv*|\
		*.bigolive.tv*|\
		*bikini*|\
		*bokep*|\
		*cewek*|\
		*coli*|\
		*crot*|\
		*genit*|\
		*girl*|\
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
		*.sb-cd.com|\
		*seks*|\
		*sex*|\
		*tinder*hot*|\
		*.ttcache.com|\
		*viral*|\
		*vrbanger*|\
		*wanita*|\
		*xxx*|\
		*xnxx*|\
		*xhamster*|\
		*.xv-cdn.net|\
		*xvideos*)
			echo "$line" >> ${service_output_folder}/NoNSFW.tmp
		;;
		*)
			echo "$line" >> ../aa2.tmp
		;;
	esac
done < "$1" # cant handle pipe stream, in case anyone tried
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
insertFilteredToOrig ${service_output_folder}/aa2.tmp        ../BaDomain.txt
insertFilteredToOrig ${service_output_folder}/NoApple.tmp    ${service_output_folder}/NoApple.txt
insertFilteredToOrig ${service_output_folder}/NoChinaOverseaSpy.tmp ${service_output_folder}/NoChinaOverseaSpy.txt
insertFilteredToOrig ${service_output_folder}/NoFB.tmp       ${service_output_folder}/NoFB.txt
insertFilteredToOrig ${service_output_folder}/NoFreeFire.tmp ${service_output_folder}/NoFreeFire.txt
insertFilteredToOrig ${service_output_folder}/NoGambling.tmp ${service_output_folder}/NoGambling.txt
insertFilteredToOrig ${service_output_folder}/NoMLBB.tmp     ${service_output_folder}/NoMLBB.txt
insertFilteredToOrig ${service_output_folder}/NoNSFW.tmp     ${service_output_folder}/NoNSFW.txt
insertFilteredToOrig ${service_output_folder}/NoOppoHT.tmp   ${service_output_folder}/NoOppoHT.txt
insertFilteredToOrig ${service_output_folder}/NoRoblox.tmp   ${service_output_folder}/NoRoblox.txt
insertFilteredToOrig ${service_output_folder}/NoSamsung.tmp  ${service_output_folder}/NoSamsung.txt
insertFilteredToOrig ${service_output_folder}/NoTikTok.tmp   ${service_output_folder}/NoTikTok.txt
insertFilteredToOrig ${service_output_folder}/NoVivo.tmp     ${service_output_folder}/NoVivo.txt
insertFilteredToOrig ${service_output_folder}/NoXiaomi.tmp   ${service_output_folder}/NoXiaomi.txt
