#!/usr/bin/env python3

import os
import sys
import re
import json
import argparse
import urllib.request
import ipaddress
from pathlib import Path
from collections import defaultdict

RULE_SOURCE_LINK = "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset"

INLINE_COMMENTS = re.compile(r"(?<!:)//.*$")

RULE_TYPE_ORDER = [
    "DOMAIN",
    "DOMAIN-SUFFIX",
    "DOMAIN-KEYWORD",
    "DOMAIN-WILDCARD",
    "IP-CIDR",
    "IP-CIDR6",
    "IP-ASN",
    "GEOIP"
]
RULE_TYPE_INDEX = {rule: index for index, rule in enumerate(RULE_TYPE_ORDER)}
RULE_TYPE_PATCH = {"PROCESS-NAME", "PROTOCOL", "USER-AGENT", "URL-REGEX"}
RULE_TYPE_KNOWN = set(RULE_TYPE_ORDER) | RULE_TYPE_PATCH

EGERN_RULE_MAP = {
    "DOMAIN": "domain_set",
    "DOMAIN-SUFFIX": "domain_suffix_set",
    "DOMAIN-KEYWORD": "domain_keyword_set",
    "DOMAIN-WILDCARD": "domain_wildcard_set",
    "IP-CIDR": "ip_cidr_set",
    "IP-CIDR6": "ip_cidr6_set",
    "IP-ASN": "asn_set",
    "GEOIP": "geoip_set"
}
EGERN_RULE_QUOTE = {
    "domain_wildcard_set",
    "domain_regex_set"
}

QUANTUMULTX_RULE_MAP = {
    "DOMAIN": "HOST",
    "DOMAIN-SUFFIX": "HOST-SUFFIX",
    "DOMAIN-KEYWORD": "HOST-KEYWORD",
    "DOMAIN-WILDCARD": "HOST-WILDCARD",
    "IP-CIDR": "IP-CIDR",
    "IP-CIDR6": "IP6-CIDR",
    "IP-ASN": "IP-ASN",
    "GEOIP": "GEOIP"
}

SINGBOX_RULE_MAP = {
    "DOMAIN": "domain",
    "DOMAIN-SUFFIX": "domain_suffix",
    "DOMAIN-KEYWORD": "domain_keyword",
    "IP-CIDR": "ip_cidr",
    "IP-CIDR6": "ip_cidr"
}

STASH_RULE_DOMAIN = re.compile(r"^(AdBlock|Advertising|GreatFireWall|DIRECT|PROXY|REJECT)$")
STASH_RULE_IPCIDR = re.compile(r"^(CNCIDR|CNCIDR4|CNCIDR6)$")

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

def run_content(args):
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

def process_type(line):
    rule_part, _, rule_extra = line.partition(",")
    rule_param = f",{rule_extra}" if rule_extra else ""
    if rule_part.upper() in RULE_TYPE_KNOWN:
        return line
    try:
        rule_value = ipaddress.ip_network(rule_part, strict=False)
        rule_type = "IP-CIDR6" if rule_value.version == 6 else "IP-CIDR"
        return f"{rule_type},{rule_value}{rule_param}"
    except ValueError:
        rule_value = rule_part[1:] if rule_part.startswith(".") else rule_part
        rule_type = "DOMAIN-SUFFIX" if rule_part.startswith(".") else "DOMAIN"
        return f"{rule_type},{rule_value}"

def process_order(lines, unknown_rule=False):
    def rule_sort(line):
        rule_type, _, rule_extra = line.partition(",")
        rule_index = RULE_TYPE_INDEX.get(rule_type, len(RULE_TYPE_ORDER))
        return rule_index, rule_extra
    seen = set()
    for line in sorted(lines, key=rule_sort):
        lower = line.lower()
        rule_type = line.partition(",")[0]
        if lower in seen or (rule_type not in RULE_TYPE_INDEX and not unknown_rule):
            continue
        seen.add(lower)
        yield line

def content_read(file_path, enable_type=False, enable_order=False):
    source = [
        INLINE_COMMENTS.sub("", line).strip()
        for line in file_path.read_text(encoding="utf-8").splitlines()
        if line.strip() and not line.lstrip().startswith("#")
    ]
    if enable_type:
        source = [process_type(line) for line in source]
    if enable_order:
        source = list(process_order(source))
    parsed = [
        tuple(parts[index] if index < len(parts) else "" for index in range(3))
        for parts in (line.split(",", 2) for line in source)
    ]
    return source, parsed

def content_write(file_path, rule_name, rule_count, rule_data, platform):
    with file_path.open("w", encoding="utf-8", newline="\n") as f:
        if platform == "Singbox":
            f.write(json.dumps(rule_data, indent=2, ensure_ascii=False) + "\n")
        else:
            f.write(f"# 规则名称: {rule_name}\n")
            f.write(f"# 规则统计: {rule_count}\n\n")
            f.writelines(f"{line}\n" for line in rule_data)
    if platform:
        print(f"Processed ({platform}): {file_path}")

def convert_egern(file_path, enable_type=False, enable_order=False):
    _, parsed = content_read(file_path, enable_type=enable_type, enable_order=enable_order)
    rule_name = file_path.stem
    rule_dict = defaultdict(list)
    no_resolve = False
    for style, value, param in parsed:
        no_resolve |= param == "no-resolve"
        if style in EGERN_RULE_MAP:
            rule_type = EGERN_RULE_MAP[style]
            rule_value = f'"{value}"' if rule_type in EGERN_RULE_QUOTE else value
            rule_dict[rule_type].append(rule_value)
    output = ["no_resolve: true"] if no_resolve else []
    for rule_type, rule_data in rule_dict.items():
        output.append(f"{rule_type}:")
        output.extend(f"  - {value}" for value in rule_data)
    rule_count = sum(line.startswith("  - ") for line in output)
    content_write(file_path, rule_name, rule_count, output, "Egern")

def convert_quantumultx(file_path, enable_type=False, enable_order=False):
    _, parsed = content_read(file_path, enable_type=enable_type, enable_order=enable_order)
    rule_name = file_path.stem
    output = []
    for style, value, param in parsed:
        if style in QUANTUMULTX_RULE_MAP:
            rule_type = QUANTUMULTX_RULE_MAP[style]
            output.append(f"{rule_type},{value},{rule_name}")
    rule_count = len(output)
    content_write(file_path, rule_name, rule_count, output, "QuantumultX")

def convert_singbox(file_path, enable_type=False, enable_order=False):
    _, parsed = content_read(file_path, enable_type=enable_type, enable_order=enable_order)
    rule_name = file_path.stem
    rule_dict = defaultdict(list)
    for style, value, param in parsed:
        if style in SINGBOX_RULE_MAP:
            rule_type = SINGBOX_RULE_MAP[style]
            rule_dict[rule_type].append(value)
    rule_data = [{rule_type: value} for rule_type, value in rule_dict.items()]
    output = {"version": 3, "rules": rule_data}
    content_write(file_path, None, None, output, "Singbox")

def convert_stash(file_path, enable_type=False, enable_order=False):
    _, parsed = content_read(file_path, enable_type=enable_type, enable_order=enable_order)
    rule_name = file_path.stem
    output = ["payload:"]
    for style, value, param in parsed:
        if STASH_RULE_DOMAIN.match(rule_name):
            if style == "DOMAIN-SUFFIX":
                value = f"+.{value}"
            formatted = f"  - '{value}'"
        elif STASH_RULE_IPCIDR.match(rule_name):
            formatted = f"  - '{value}'"
        else:
            formatted = f"  - {style},{value}" + (f",{param}" if param else "")
        output.append(formatted)
    rule_count = sum(line.startswith("  - ") for line in output)
    content_write(file_path, rule_name, rule_count, output, "Stash")

def convert_surge(file_path, enable_type=False, enable_order=False):
    source, _ = content_read(file_path, enable_type=enable_type, enable_order=enable_order)
    rule_name = file_path.stem
    output = list(source)
    rule_count = len(output)
    content_write(file_path, rule_name, rule_count, output, "Surge")

def run_convert(args):
    print("============== Build.py ==============")
    print(f"规则添加类型: {'已启用' if args.type else '未启用'} (--type)")
    print(f"规则排序去重: {'已启用' if args.order else '未启用'} (--order)")
    print("======================================")
    platform_map = {
        "Egern": convert_egern,
        "QuantumultX": convert_quantumultx,
        "Singbox": convert_singbox,
        "Stash": convert_stash,
        "Surge": convert_surge
    }
    convert_function = platform_map[args.platform]
    if args.file_path.is_file():
        if args.platform == "Singbox" and args.file_path.suffix != ".json":
            sys.exit(f"Singbox only supports JSON File: {args.file_path.suffix}")
        file_to_process = [args.file_path]
    elif args.file_path.is_dir():
        if args.platform == "Singbox":
            file_to_process = sorted(f for f in args.file_path.iterdir() if f.is_file() and f.suffix == ".json")
        else:
            file_to_process = sorted(f for f in args.file_path.iterdir() if f.is_file())
    else:
        sys.exit(f"{args.file_path} Not Found or Unknown Type.")
    if not file_to_process:
        print(f"No File Found in: {args.file_path}")
        return
    print(f"Platform: {args.platform}")
    print(f"Processed {len(file_to_process)} file(s) in: {args.file_path}")
    for f in file_to_process:
        try:
            if args.type or args.order:
                convert_function(f, enable_type=args.type, enable_order=args.order)
            else:
                convert_function(f)
        except Exception as e:
            print(f"Failed to Process {f}: {e}")
    print("Processed Completed.")

def main():
    parser = argparse.ArgumentParser("Rule Build")
    sub = parser.add_subparsers(dest="command", required=True)
    src = sub.add_parser("content", help="Rule Content")
    group = src.add_mutually_exclusive_group(required=True)
    group.add_argument("--download", action="store_true")
    group.add_argument("--copy", action="store_true")
    cvt = sub.add_parser("convert", help="Rule Convert")
    cvt.add_argument("platform", choices=["Egern", "QuantumultX", "Singbox", "Stash", "Surge"])
    cvt.add_argument("--type", action="store_true")
    cvt.add_argument("--order", action="store_true")
    cvt.add_argument("file_path", type=Path)
    args = parser.parse_args()
    if args.command == "content":
        run_content(args)
    elif args.command == "convert":
        run_convert(args)

if __name__ == "__main__":
    main()