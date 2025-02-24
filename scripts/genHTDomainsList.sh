#!/usr/bin/env bash
#
#  SPDX-FileCopyrightText: 2021-2025 MDP43140
#  SPDX-License-Identifier: GPL-3.0-or-later
#
#  What this script does?
#  just recursively generate Oppo/HeyTap domain using very complex pattern (fuck chinese)
#  the output can be piped to checkDomains.sh (./genHTDomainsList.sh | ./checkDomains.sh)
#

#clear # disabled by default because it caused some output weirdness when piped to other commands
HT_PATTERN=(
	{component-ota,eap-log,fourier-videoclip,globalcolor-service,iot-earbuds,moa-upload,opex-service,sau-server,weather-server}-{cn,eu,gl,id,in,kh,mm,my,sg,us}.allawnos.com
	{browser,cdp-common,cloudkit-api,dc-dragate,magazine-api,ocloud-backup,slb-apisnd,store-quic,uapi}-{cn,eu,gl,id,in,kh,mm,my,sg,us}.heytapmobile.com
	{adx,bdapi,stg-data}-{cn,eu,gl,id,in,kh,mm,my,sg,us}.ads.{heytapmobi,heytapmobile}.com
	adsfs-{cn,eu,gl,id,in,kh,mm,my,sg,us}.heytapimg.com
	album-{cn,eu,gl,id,in,kh,mm,my,sg,us}01a.ocloud.heytapmobi.com
	api-{cn,eu,gl,id,in,kh,mm,my,sg,us}.{cdo,game,instant,play,store,theme}.{heytapmobi,heytapmobile}.com
	cl-data-{cn,eu,gl,id,in,kh,mm,my,sg,us}.ads.heytapmobi.com
	# client-{cn,eu,gl,id,in,kh,mm,my,sg,us}.heytapmobi.com
	cloudi-{cn,eu,gl,id,in,kh,mm,my,sg,us}.browser.{oppo,heytap}mobile.com
	conf-{cn,eu,gl,id,in,kh,mm,my,sg,us}.dc.heytap{dl,mobi}.com
	conn-service-{cn,eu,gl,id,in,kh,mm,my,sg,us}-{01..07}.{allawnos,allawntech}.com
	datasec-kmsex-{cn,eu,gl,id,in,kh,mm,my,sg,us}.heytapmobi.com
	dcintl{1..3}.push.{oppo,heytap}mobile.com
	dhfs-{cn,eu,gl,id,in,kh,mm,my,sg,us}.heytapimage.com
	dragate-{cn,eu,gl,id,in,kh,mm,my,sg,us}.dc.{heytapmobi,heytapmobile}.com
	epoch-{cn,eu,gl,id,in,kh,mm,my,sg,us}.cdo.{heytapmobi,heytapmobile}.com
	feedback-{cn,eu,gl,id,in,kh,mm,my,sg,us}.heytapmobi.com
	games-{common,community}-{cn,eu,gl,id,in,kh,mm,my,sg,us}.heytapmobile.com
	gauss-sau{apkcostauto,oldcostmanual}-{cn,eu,gl,id,in,kh,mm,my,sg,us}.{allawnfs,allawnofs}.com
	gslb-{cn,eu,gl,id,in,kh,mm,my,sg,us}.cdo.heytapmobi.com
	{icosa,icosa-service}-{cn,eu,gl,id,in,kh,mm,my,sg,us}.coloros.com
	{cn,eu,gl,id,in,kh,mm,my,sg,us}.push.oppomobile.com
	{cn,eu,gl,id,in,kh,mm,my,sg,us}-store.oppomobile.com
	ie-front-{cn,eu,gl,id,in,kh,mm,my,sg,us}.heytapimg.com
	{iflow,iflowf}-{cn,eu,gl,id,in,kh,mm,my,sg,us}.browser.{oppo,heytap}mobile.com
	if-{cn,eu,gl,id,in,kh,mm,my,sg,us}.{browser,magzine}.oppomobile.com
	# i2.weather.oppomobile.com
	# i5.weather.oppomobile.com
	# i6f.weather.oppomobile.com
	# i6.weather.oppomobile.com
	i-{cn,eu,gl,id,in,kh,mm,my,sg,us}01a.ocloud.heytapmobi.com
	i-{cn,eu,gl,id,in,kh,mm,my,sg,us}.browser.{oppo,heytap}mobile.com
	log-eap-{cn,eu,gl,id,in,kh,mm,my,sg,us}.coloros.com
	mdp-appconf-{cn,eu,gl,id,in,kh,mm,my,sg,us}.heytapdl.com
	mdp-{upgrade,usertrace}-{cn,eu,gl,id,in,kh,mm,my,sg,us}.{heytapmobi,heytapmobile}.com
	obus-{cn,eu,gl,id,in,kh,mm,my,sg,us}.dc.heytapmobile.com
	obus-{dc2,dctech,dc20123,dc20305}-{cn,eu,gl,id,in,kh,mm,my,sg,us}.heytapmobile.com
	ocloud-{httpdns,uni}-{cn,eu,gl,id,in,kh,mm,my,sg,us}.heytapmobile.com
	ota-manual-{cn,eu,gl,id,in,kh,mm,my,sg,us}.allawnofs.com
	pguard-cdnfs-{cn,eu,gl,id,in,kh,mm,my,sg,us}.coloros.com
	# play{1..3}.heytapimg.com
	report-{cn,eu,gl,id,in,kh,mm,my,sg,us}.uc.heytapmobile.com
	rest-{cn,eu,gl,id,in,kh,mm,my,sg,us}-feedback.heytapmobile.com
	smartcardf-{cn,eu,gl,id,in,kh,mm,my,sg,us}.apps.coloros.com
	stat-{cn,eu,gl,id,in,kh,mm,my,sg,us}.dc.oppomobile.com
	# storedl{NUMBER:L1:3-5}.f.oppomobile.com
	stuck-{cn,eu,gl,id,in,kh,mm,my,sg,us}.dc.oppomobile.com
	theme-magazine-{cn,eu,gl,id,in,kh,mm,my,sg,us}-01.heytapimg.com
	t-{cn,eu,gl,id,in,kh,mm,my,sg,us}.ads.heytapmobile.com
	u-{cn,eu,gl,id,in,kh,mm,my,sg,us}.browser.oppomobile.com
	u-{cn,eu,gl,id,in,kh,mm,my,sg,us}.cpc.heytapmobile.com
	videoeditor-{cn,eu,gl,id,in,kh,mm,my,sg,us}.soloop.heytapmobile.com
)

# btw stuff filter (lists) from (available)
# abc + adb = ab
# cat ${1} | grep -Fw "$(awk '{$1=$1};1' ${2})" | sort -ui

## Main script ##
gen(){
	# Output the result
	for i in ${HT_PATTERN[@]};do
		echo $i
	done
}
gen