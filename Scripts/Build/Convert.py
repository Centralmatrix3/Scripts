#!/usr/bin/env python3

import sys
import re
import json
import argparse
import inspect
import ipaddress
from pathlib import Path
from collections import defaultdict

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
    "domain_wildcard_set"
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

def main():
    parser = argparse.ArgumentParser(description="Rule Convert")
    parser.add_argument("platform", choices=["Egern", "QuantumultX", "Singbox", "Stash", "Surge"])
    parser.add_argument("--type", action="store_true")
    parser.add_argument("--order", action="store_true")
    parser.add_argument("file_path", type=Path)
    args = parser.parse_args()
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

if __name__ == "__main__":
    main()