## BaDomain (aka. Bad Domains)
this is an addon hosts file that blocks more bad things.
this hosts file was only meant to improve blocking of your existing hosts list.

What type of domains BaDomain (general hosts file) is blocking:
+ Advertising.
+ Tracking.
+ Malware.
+ Scam/Malvertising.
+ Adult websites.
+ Gambling.
+ Chinese domains (.cn).
+ Russian domains (.ru).
+ Social media (Facebook, TikTok. optional).

Optional (included as separate misc hosts file):
+ [Gambling](https://raw.githubusercontent.com/mdp43140/BaDomain/main/misc/NoGambling_hosts.txt)
+ [NSFW](https://raw.githubusercontent.com/mdp43140/BaDomain/main/misc/NoNSFW_hosts.txt)
+ [TikTok](https://raw.githubusercontent.com/mdp43140/BaDomain/main/misc/NoTikTok_hosts.txt)
+ [Facebook](https://raw.githubusercontent.com/mdp43140/BaDomain/main/misc/NoFB_hosts.txt)
+ [Xiaomi](https://raw.githubusercontent.com/mdp43140/BaDomain/main/misc/NoXiaomi_hosts.txt)
+ [Vivo](https://raw.githubusercontent.com/mdp43140/BaDomain/main/misc/NoVivo_hosts.txt)
+ [Oppo/HeyTap](https://raw.githubusercontent.com/mdp43140/BaDomain/main/misc/NoOppoHT_hosts.txt)
+ [Mobile Legends](https://raw.githubusercontent.com/mdp43140/BaDomain/main/misc/NoMLBB_hosts.txt)
+ [Roblox](https://raw.githubusercontent.com/mdp43140/BaDomain/main/misc/NoRoblox_hosts.txt)
+ [Free Fire](https://raw.githubusercontent.com/mdp43140/BaDomain/main/misc/NoFreeFire_hosts.txt)
+ [Apple](https://raw.githubusercontent.com/mdp43140/BaDomain/main/misc/NoApple_hosts.txt)
+ [Chinese domains](https://raw.githubusercontent.com/mdp43140/BaDomain/main/misc/NoChinaOverseaSpy_hosts.txt)

## Contributing
You can help improve this project by creating a new issue, or merge request
of domains that you think should be added/removed, or even other smaller things.


<details><summary>nonsense (u can safely ignore this :)</summary>
I'm scraping the domains by deploying a free tethering (at public places).
with ad-blocking, using AdAway, with these hosts lists:
+ [1Hosts](https://github.com/badmojr/1Hosts)
+ [DanHorton's TikTok Blocklist](https://github.com/danhorton7/pihole-block-tiktok/blob/main/tiktok.txt)
+ [GoodByeAds + GoodbyeAds YouTube](https://github.com/jerryn70/GoodBye-Ads)
+ [StevenBlack](https://github.com/StevenBlack/hosts)
+ (and of course, my own blocklist, this project)

then i use AdAway's DNS Activity tab to monitor DNS Activity then scrap any:
- Unknown domains.
- Chinese domains (where lots of bad stuff happening, eg. \*.cn, tiktok.com).
- Russian domains (mostly gambling, porn, invasive tracking/advertising, etc. eg. \*.ru).
- Advertising/Tracking/Malware domains (eg. adx.com, thinkingdata.cn, obstremswiev.site, just to name a few).
- Game server domains (optional/miscellaneous, eg. Free fire/garena, MLBB/moonton/youngjoygame/yuanzhan, COC, PUBG/tencent).

that are not on the hosts list listed above and:
- add these to "private lists".
- Export the configuration file.
- Parse the "blocked" section on "adaway-backup.json".
- and add it to BaDomain.

I did the same with my DD-WRT home router, where i set up DNS over TLS and redirected all unencrypted DNS to this,
and writing my own script that runs at startup that runs tcpdump to collect only DNS queryies from local devices
and later i can grab the file to my PC, send it to my phone, and replace dns_log.txt in adaway
cache with the tcpdump log that i sent from my PC, and did the same thing with DNS activity things

</details>