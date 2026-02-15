#!/usr/bin/env python3

import os
import sys
import argparse
import urllib.request

RULE_SOURCE_LINK = "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset"

def download(output_file, source_link):
    with open(output_file, "w", encoding="utf-8") as output:
        for link in source_link:
            try:
                with urllib.request.urlopen(link) as resp:
                    output.write(resp.read().decode("utf-8"))
                output.write("\n")
                print(f"Processed (Download): {link} -> {output_file}")
            except Exception:
                sys.exit(f"Download Failed: {link}")

def copy(output_file, source_file):
    with open(output_file, "w", encoding="utf-8") as output:
        for file in source_file:
            try:
                with open(file, "r", encoding="utf-8") as f:
                    output.write(f.read())
                output.write("\n")
                print(f"Processed (Copy): {file} -> {output_file}")
            except Exception:
                sys.exit(f"Copy Failed: {file}")

def main():
    parser = argparse.ArgumentParser(description="Rule Loading")
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument("--download", action="store_true")
    group.add_argument("--copy", action="store_true")
    args = parser.parse_args()
    print("============== Build.py ==============")
    print(f"使用下载规则: {'已启用' if args.download else '未启用'} (--download)")
    print(f"使用复制规则: {'已启用' if args.copy else '未启用'} (--copy)")
    print("======================================")
    execute_action = download if args.download else copy
    repository = os.path.basename(os.environ.get("GITHUB_REPOSITORY", ""))
    if repository == "Scripts":
        print(f"Execute in {repository} Repository")
        rule_dir = ["Ruleset", "QuantumultX/Ruleset", "Stash/Ruleset", "Surge/Ruleset"]
        for rule_path in rule_dir:
            os.makedirs(rule_path, exist_ok=True)
        rule_extra_source = {
            "Ruleset/AdBlockLite.list": """
                https://raw.githubusercontent.com/ConnersHua/RuleGo/master/Surge/Ruleset/Extra/Reject/Advertising.list
                https://raw.githubusercontent.com/ConnersHua/RuleGo/master/Surge/Ruleset/Extra/Reject/Malicious.list
                https://raw.githubusercontent.com/ConnersHua/RuleGo/master/Surge/Ruleset/Extra/Reject/Tracking.list
                https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanAD.list
                https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanProgramAD.list
                https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanEasyListChina.list
            """,
            "Ruleset/Global.list": """
                https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ProxyGFWlist.list
                https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/gfw.txt
            """,
            "Ruleset/AdBlock.list": "https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/master/anti-ad-surge.txt",
            "Ruleset/AdGuardBlock.list": "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/AdGuardSDNSFilter/AdGuardSDNSFilter.list",
            "Ruleset/Advertising.list": "https://raw.githubusercontent.com/Cats-Team/AdRules/main/adrules.list",
            "Ruleset/Alibaba.list": "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Alibaba.list",
            "Ruleset/Amazon.list": "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Amazon.list",
            "Ruleset/AmazonIP.list": "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/AmazonIp.list",
            "Ruleset/Apple.list": "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Apple.list",
            "Ruleset/Baidu.list": "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Baidu.list",
            "Ruleset/ByteDance.list": "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/ByteDance.list",
            "Ruleset/BiliBili.list": "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Bilibili.list",
            "Ruleset/CNCIDR.list": "https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/cn.txt",
            "Ruleset/CNCIDR4.list": "https://raw.githubusercontent.com/Hackl0us/GeoIP2-CN/release/CN-ip-cidr.txt",
            "Ruleset/CNCIDR6.list": "https://raw.githubusercontent.com/Masaiki/GeoIP2-CN/release/CN-ip-cidr.txt",
            "Ruleset/China.list": "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ChinaDomain.list",
            "Ruleset/ChinaASN.list": "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/ChinaASN/ChinaASN_Resolve.list",
            "Ruleset/ChinaIPBGP.list": "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/ChinaIPsBGP/ChinaIPsBGP.list",
            "Ruleset/ChinaIPMax.list": "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/ChinaIPs/ChinaIPs.list",
            "Ruleset/ChinaIPv4.list": "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ChinaIp.list",
            "Ruleset/ChinaIPv6.list": "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ChinaIpV6.list",
            "Ruleset/ChinaMax.list": "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/ChinaMax/ChinaMax.list",
            "Ruleset/ChinaMediaMax.list": "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/ChinaMedia/ChinaMedia.list",
            "Ruleset/DIRECT.list": "https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/direct.txt",
            "Ruleset/Easylist.list": "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanEasyList.list",
            "Ruleset/Facebook.list": "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Facebook.list",
            "Ruleset/Game.list": "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Game/Game.list",
            "Ruleset/GlobalMax.list": "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Global/Global.list",
            "Ruleset/GlobalMediaMax.list": "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/GlobalMedia/GlobalMedia.list",
            "Ruleset/Google.list": "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Google.list",
            "Ruleset/GreatFire.list": "https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/greatfire.txt",
            "Ruleset/GreatFireWall.list": "https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/gfw.txt",
            "Ruleset/Microsoft.list": "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Microsoft.list",
            "Ruleset/Netflix.list": "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Netflix.list",
            "Ruleset/PROXY.list": "https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/proxy.txt",
            "Ruleset/Privacy.list": "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanEasyPrivacy.list",
            "Ruleset/Private.list": "https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/private.txt",
            "Ruleset/PrivateTracker.list": "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/PrivateTracker.list",
            "Ruleset/REJECT.list": "https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/reject.txt",
            "Ruleset/Tld-Not-CN.list": "https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/tld-not-cn.txt",
            "Ruleset/USCIDR.list": "https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/us.txt",
            "Ruleset/WeChat.list": "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Wechat.list"
        }
        for output_file, rule_link in rule_extra_source.items():
            source_link = [line.strip() for line in rule_link.splitlines() if line.strip()]
            download(output_file, source_link)
        rule_local_source = {
            "AdBlock": "AdBlock.list",
            "Advertising": "Advertising.list",
            "AppStore": "AppStore.list",
            "Apple": "Apple.list",
            "BiliBili": "BiliBili.list",
            "ChinaASN": "ChinaASN.list",
            "ChinaMedia": "ChinaMedia.list",
            "DouYin": "DouYin.list",
            "GEOIPCN": "GEOIPCN.list",
            "GitHub": "GitHub.list",
            "Global": "Global.list",
            "GlobalMedia": "GlobalMedia.list",
            "Google": "Google.list",
            "HMTMedia": "HMTMedia.list",
            "LAN": "LAN.list",
            "Microsoft": "Microsoft.list",
            "Telegram": "Telegram.list",
            "TikTok": "TikTok.list",
            "Unbreak": "Unbreak.list",
            "WeChat": "WeChat.list"
        }
        formats = {
            "QuantumultX": "list",
            "Stash": "yaml",
            "Surge": "list"
        }
        exclude = {
            "QuantumultX": {},
            "Stash": {},
            "Surge": {}
        }
        for rule, file in rule_local_source.items():
            for platform, extension in formats.items():
                if rule in exclude.get(platform, set()):
                    print(f"Exclude {rule} for {platform}")
                    continue
                output_file = f"{platform}/Ruleset/{rule}.{extension}"
                source_link = [f"{RULE_SOURCE_LINK}/{f}" for f in file.split()]
                source_file = [f"Ruleset/{f}" for f in file.split()]
                if args.download:
                    execute_action(output_file, source_link)
                elif args.copy:
                    execute_action(output_file, source_file)
        print(f"{repository} Repository: All Ruleset Processed!")

    elif repository == "Matrix-io":
        print(f"Execute in {repository} Repository")
        rule_dir = ["Clash", "Egern", "Loon", "QuantumultX", "Shadowrocket", "Sing-box", "Stash", "Surge"]
        for rule_path in rule_dir:
            os.makedirs(f"{rule_path}/Ruleset", exist_ok=True)
        rule_local_source = {
            "ABC": "ABC.list",
            "AMAP": "AMAP.list",
            "AcFun": "AcFun.list",
            "AdBlock": "AdBlock.list",
            "Advertising": "Advertising.list",
            "AliPay": "AliPay.list",
            "Alibaba": "Alibaba.list",
            "All4": "All4.list",
            "Amazon": "Amazon.list",
            "AmazonCN": "AmazonCN.list",
            "Android": "Android.list",
            "AppStore": "AppStore.list",
            "Apple": "Apple.list",
            "AppleTV": "AppleTV.list",
            "Baidu": "Baidu.list",
            "BiliBili": "BiliBili.list",
            "Blizzard": "Blizzard.list",
            "ByteDance": "ByteDance.list",
            "CNCIDR": "CNCIDR.list",
            "CNCIDR4": "CNCIDR4.list",
            "CNCIDR6": "CNCIDR6.list",
            "ChinaASN": "ChinaASN.list",
            "ChinaIPBGP": "ChinaIPBGP.list",
            "ChinaIPMax": "ChinaIPMax.list",
            "ChinaIPv4": "ChinaIPv4.list",
            "ChinaIPv6": "ChinaIPv6.list",
            "ChinaMax": "ChinaMax.list",
            "ChinaMedia": "ChinaMedia.list",
            "Claude": "Claude.list",
            "Coolapk": "Coolapk.list",
            "Copilot": "Copilot.list",
            "DIRECT": "DIRECT.list",
            "Deezer": "Deezer.list",
            "Discord": "Discord.list",
            "Docker": "Docker.list",
            "DouBan": "DouBan.list",
            "DouYin": "DouYin.list",
            "DouYu": "DouYu.list",
            "Dropbox": "Dropbox.list",
            "Facebook": "Facebook.list",
            "GEOIPCN": "GEOIPCN.list",
            "GitHub": "GitHub.list",
            "GitLab": "GitLab.list",
            "Global": "Global.list",
            "GlobalMax": "GlobalMax.list",
            "GlobalMedia": "GlobalMedia.list",
            "Google": "Google.list",
            "GoogleCN": "GoogleCN.list",
            "GreatFireWall": "GreatFireWall.list",
            "HBO": "HBO.list",
            "HBOAsia": "HBOAsia.list",
            "HMTMedia": "HMTMedia.list",
            "Heroku": "Heroku.list",
            "HuYa": "HuYa.list",
            "Hulu": "Hulu.list",
            "HuluJP": "HuluJP.list",
            "ICloud": "ICloud.list",
            "IQiYi": "IQiYi.list",
            "JOOX": "JOOX.list",
            "LAN": "LAN.list",
            "Microsoft": "Microsoft.list",
            "MyTVSuper": "MyTVSuper.list",
            "NetEase": "NetEase.list",
            "NetEaseMusic": "NetEaseMusic.list",
            "Netflix": "Netflix.list",
            "NivodTV": "NivodTV.list",
            "Onedrive": "Onedrive.list",
            "OpenAI": "OpenAI.list",
            "Oracle": "Oracle.list",
            "PROXY": "PROXY.list",
            "PayPal": "PayPal.list",
            "PikPak": "PikPak.list",
            "PornHub": "PornHub.list",
            "Qobuz": "Qobuz.list",
            "Quark": "Quark.list",
            "Quora": "Quora.list",
            "REJECT": "REJECT.list",
            "SoundCloud": "SoundCloud.list",
            "Speedtest": "Speedtest.list",
            "Spotify": "Spotify.list",
            "Steam": "Steam.list",
            "SteamCN": "SteamCN.list",
            "TIDAL": "TIDAL.list",
            "TapTap": "TapTap.list",
            "Telegram": "Telegram.list",
            "Tencent": "Tencent.list",
            "TencentVideo": "TencentVideo.list",
            "TikTok": "TikTok.list",
            "Twitch": "Twitch.list",
            "Twitter": "Twitter.list",
            "Unbreak": "Unbreak.list",
            "Vercel": "Vercel.list",
            "WeChat": "WeChat.list",
            "WeiBo": "WeiBo.list",
            "WhatsApp": "WhatsApp.list",
            "Wikipedia": "Wikipedia.list",
            "Ximalaya": "Ximalaya.list",
            "Yandex": "Yandex.list",
            "YouTube": "YouTube.list",
            "Youku": "Youku.list"
        }
        formats = {
            "Clash": "yaml",
            "Egern": "yaml",
            "Loon": "list",
            "QuantumultX": "list",
            "Shadowrocket": "list",
            "Sing-box": "json",
            "Stash": "yaml",
            "Surge": "list"
        }
        exclude = {
            "Clash": {},
            "Egern": {},
            "Loon": {},
            "QuantumultX": {},
            "Shadowrocket": {},
            "Sing-box": {"ChinaASN", "GEOIPCN"},
            "Stash": {},
            "Surge": {}
        }
        for rule, file in rule_local_source.items():
            for platform, extension in formats.items():
                if rule in exclude.get(platform, set()):
                    print(f"Exclude {rule} for {platform}")
                    continue
                output_file = f"{platform}/Ruleset/{rule}.{extension}"
                source_link = [f"{RULE_SOURCE_LINK}/{f}" for f in file.split()]
                source_file = [f"Scripts/Ruleset/{f}" for f in file.split()]
                if args.download:
                    execute_action(output_file, source_link)
                elif args.copy:
                    execute_action(output_file, source_file)
        print(f"{repository} Repository: All Ruleset Processed!")

    else:
        print(f"Execute Repository: {repository}")
        print("Please Execute in Scripts Repository.")
        print("Please Execute in Matrix-io Repository.")
        sys.exit(1)

if __name__ == "__main__":
    main()