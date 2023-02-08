## BaDomain (aka. Bad Domains)
[BaDomain code preview, preview not available yet...](https://github.com/MDP43140/BaDomain)
this is an addon hosts file that blocks more bad things.
this hosts file was only meant to improve blocking of your existing hosts list.

What type of domains BaDomain (general hosts file) is blocking:
+ Advertising.
+ Tracking.
+ Malware.
+ Scam/Malvertising.
+ Gambling.
+ Chinese domains (.cn).
+ Russian domains (.ru).

Optional (included as separate misc hosts file):
+ [TikTok](https://raw.githubusercontent.com/mdp43140/BaDomain/main/misc/NoTikTok_hosts.txt)
+ [Facebook](https://raw.githubusercontent.com/mdp43140/BaDomain/main/misc/NoFB_hosts.txt)
+ [Xiaomi](https://raw.githubusercontent.com/mdp43140/BaDomain/main/misc/NoXiaomi_hosts.txt)
+ [Vivo](https://raw.githubusercontent.com/mdp43140/BaDomain/main/misc/NoVivo_hosts.txt)
+ [Mobile Legends](https://raw.githubusercontent.com/mdp43140/BaDomain/main/misc/NoMLBB_hosts.txt)
+ [Roblox](https://raw.githubusercontent.com/mdp43140/BaDomain/main/misc/NoRoblox_hosts.txt)
+ [Free Fire](https://raw.githubusercontent.com/mdp43140/BaDomain/main/misc/NoFreeFire_hosts.txt)
+ [Apple](https://raw.githubusercontent.com/mdp43140/BaDomain/main/misc/NoApple_hosts.txt)

## Contributing
You can help improve this project by
+ Issue some lists of domains that you think should be added/removed,
+ Add an issue, or create pull request.


<details><summary>nonsense (u can safely ignore this :)</summary>
I'm scraping the domains by deploying a free hotspot (at public places).
with adblocking, using AdAway, with these hosts lists:
+ [GoodByeAds + GoodbyeAds YouTube](https://github.com/jerryn70/GoodBye-Ads)
+ [DanHorton's TikTok Blocklist](https://github.com/danhorton7/pihole-block-tiktok/blob/main/tiktok.txt)
+ StevenBlack

then i use AdAway's DNS Activity tab to monitor DNS Activity then scrap any:
- Unknown domains.
- Chinese domains (where lots of bad stuff happening, eg. \*.cn, tiktok.com).
- Russian domains (mostly gambling, porn, invasive tracking/advertising, etc. eg. \*.ru).
- Advertising/Tracking/Malware domains (eg. adx.com, thinkingdata.cn, obstremswiev.site, just to name a few).
- Game server domains (optional/miscellanous, eg. Free fire/garena, MLBB/moonton/youngjoygame/yuanzhan, COC, PUBG/tencent).

that are not on the hosts list listed above and:
- add these to "private lists".
- Export the configuration file.
- Parse the "blocked" section on "adaway-backup.json".
- and add it to BaDomain.
</details>