BaDomain (Bad Domains)
this is a hosts file that blocks anything bad.
this filter was only meant to improve blocking.
Facebook, TikTok, Free Fire, Mobile Legends domains are also included

Sources (mostly from my own domain scraping and old 'not updated' hosts):
	BaDomain:
	- My own domain scraping.
	
	BaDomain_Facebook:
	- My own domain scraping.
	- random sources from random domain i did'nt remember.

	BaDomain_TikTok:
	- My own domain scraping.
	- [llacb47/mischosts](https://github.com/llacb47/mischosts)
	
	BaDomain_MLBB:
	- My own domain scraping.
	- random sources from random domain i did'nt remember.

	BaDomain_FreeFire:
	- My own domain scraping.

PS:
I'm scraping the domains by launching a free hotspot (at public places).
with adblocking, using AdAway, with these hosts lists:
- AdAway
- GoodByeAds
- StevenBlack

then i use AdAway's DNS Activity tab to monitor DNS Activity than scrap any:
- Unknown domains.
- Chinese domains (eg. *.cn, tiktok.com).
- Tracking domains (eg. adx.com).
- Game server domains (optional/miscellanous, eg. Free fire/garena, MLBB/moonton, COC, PUBG/tencent).

that are not on the hosts list listed above and:
- add these to "private lists".
- Export the configuration file.
- Parse the "blocked" section on "adaway-backup.json".
- and add it to BaDomain.

