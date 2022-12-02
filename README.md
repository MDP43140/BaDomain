## BaDomain (Bad Domains)
this is an addon hosts file that blocks more bad things.
this hosts file was only meant to improve blocking of your existing hosts list.
Facebook, TikTok, Xiaomi, Free Fire, Mobile Legends, Roblox, Apple domains are also included (as misc)

## Contributing
You can help this project by
- adding your list of bad domains
- or issue some whitelist domain
- add an issue or create pull request

## Note:
I'm scraping the domains by deploying a free hotspot (at public places).
with adblocking, using AdAway, with these hosts lists:
- [GoodByeAds + GoodbyeAds YouTube](https://github.com/jerryn70/GoodBye-Ads)
- [DanHorton's TikTok Blocklist](https://github.com/danhorton7/pihole-block-tiktok/blob/main/tiktok.txt)
- StevenBlack

then i use AdAway's DNS Activity tab to monitor DNS Activity then scrap any:
- Unknown domains.
- Chinese domains (eg. *.cn, tiktok.com).
- Tracking domains (eg. adx.com).
- Game server domains (optional/miscellanous, eg. Free fire/garena, MLBB/moonton/youngjoygame/yuanzhan, COC, PUBG/tencent).

that are not on the hosts list listed above and:
- add these to "private lists".
- Export the configuration file.
- Parse the "blocked" section on "adaway-backup.json".
- and add it to BaDomain.