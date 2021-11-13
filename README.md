## BaDomain (Bad Domains)
this is a hosts file that blocks anything bad.
this hosts file was only meant to improve blocking of your existing hosts list.
Facebook, TikTok, Free Fire, Mobile Legends domains are also included (as misc)
Sources (mostly from my own domain scraping and old not updated hosts):

BaDomain:
- My own domain scraping.

BaDomain_Facebook:
- My own domain scraping.
- random sources from random domain i did'nt remember.

BaDomain_TikTok:
- My own domain scraping.
- [llacb47/mischosts](https://github.com/llacb47/mischosts/blob/master/social/tiktok-block?raw=true)

BaDomain_MLBB:
- My own domain scraping.
- random sources from random domain i did'nt remember.

BaDomain_FreeFire:
- My own domain scraping.

## Note:
I'm scraping the domains by deploying a free hotspot (at public places).
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
