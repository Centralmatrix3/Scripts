#!/usr/bin/env python3

import json
import sys
import re
import ipaddress
import argparse
import inspect
from pathlib import Path
from collections import defaultdict

INLINE_COMMENT_RE = re.compile(r"(?<!:)//.*$")

STASH_DOMAIN_FILE = re.compile(r"^(AdBlock|Advertising|GreatFireWall|DIRECT|PROXY|REJECT)$")
STASH_IPCIDR_FILE = re.compile(r"^(CNCIDR|CNCIDR4|CNCIDR6)$")

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
RULE_TYPE_EXIST = set(RULE_TYPE_ORDER)

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
EGERN_RULE_QUOTE = {"domain_wildcard_set"}

QUANTUMULTX_RULE_MAP = {
    "DOMAIN": "HOST",
    "DOMAIN-SUFFIX": "HOST-SUFFIX",
    "DOMAIN-KEYWORD": "HOST-KEYWORD",
    "DOMAIN-WILDCARD": "HOST-WILDCARD",
    "IP-CIDR6": "IP6-CIDR"
}

SINGBOX_RULE_MAP = {
    "DOMAIN": "domain",
    "DOMAIN-SUFFIX": "domain_suffix",
    "DOMAIN-KEYWORD": "domain_keyword",
    "IP-CIDR": "ip_cidr",
    "IP-CIDR6": "ip_cidr"
}

def rules_type(line):
    first_part = line.split(",", 1)[0]
    if first_part.upper() in RULE_TYPE_EXIST:
        return line
    try:
        rule_value = ipaddress.ip_network(first_part, strict=False)
        rule_type = "IP-CIDR6" if rule_value.version == 6 else "IP-CIDR"
        return f"{rule_type},{rule_value}"
    except ValueError:
        return line

"""
def rules_type(line):
    first_part, sep, rest = line.partition(",")
    rule_field = sep + rest if sep else ""
    if first_part.upper() in RULE_TYPE_EXIST:
        return line
    try:
        rule_value = ipaddress.ip_network(first_part, strict=False)
        rule_type = "IP-CIDR6" if rule_value.version == 6 else "IP-CIDR"
    except ValueError:
        if sep: return line
        rule_type = "DOMAIN-SUFFIX" if first_part.startswith(".") else "DOMAIN"
        rule_value = first_part[1:] if first_part.startswith(".") else first_part
    return f"{rule_type},{rule_value}{rule_field}"
"""

def rules_order(lines, unknown_rule=False):
    def rule_sort(line):
        rule_type, rule_value = line.split(",", 1)[0], line.partition(",")[2]
        rule_index = RULE_TYPE_INDEX.get(rule_type, len(RULE_TYPE_ORDER))
        return rule_index, rule_value
    seen = set()
    for line in sorted(lines, key=rule_sort):
        lower = line.lower()
        rule_type = line.split(",", 1)[0]
        if lower in seen or (rule_type not in RULE_TYPE_INDEX and not unknown_rule):
            continue
        seen.add(lower)
        yield line

def rules_load(file_path, enable_type=False, enable_order=False):
    source = [
        INLINE_COMMENT_RE.sub("", line).strip()
        for line in file_path.read_text(encoding="utf-8").splitlines()
        if line.strip() and not line.lstrip().startswith("#")
    ]
    if enable_type:
        source = [rules_type(line) for line in source]
    if enable_order:
        source = list(rules_order(source))
    parsed = [
        tuple(parts[index] if index < len(parts) else "" for index in range(3))
        for parts in (line.split(",", 2) for line in source)
    ]
    return source, parsed

def rules_write(file_path, rule_name, rule_count, rule_data, platform):
    if platform == "Singbox":
        with file_path.open("w", encoding="utf-8") as f:
            json.dump(rule_data, f, indent=2, ensure_ascii=False)
            f.write("\n")
    else:
        with file_path.open("w", encoding="utf-8") as f:
            f.write(f"# 规则名称: {rule_name}\n")
            f.write(f"# 规则统计: {rule_count}\n\n")
            f.writelines(f"{line}\n" for line in rule_data)
    if platform:
        print(f"Processed ({platform}): {file_path}")

def process_egern(file_path, enable_type=False, enable_order=False):
    rule_name = file_path.stem
    _, parsed = rules_load(file_path, enable_type=enable_type, enable_order=enable_order)
    rule_data = defaultdict(list)
    no_resolve = False
    for style, value, field in parsed:
        if style not in EGERN_RULE_MAP:
            continue
        if field == "no-resolve":
            no_resolve = True
        rule_type = EGERN_RULE_MAP[style]
        rule_value = f'"{value}"' if rule_type in EGERN_RULE_QUOTE else value
        rule_data[rule_type].append(rule_value)
    output = ["no_resolve: true"] if no_resolve else []
    for rule_type, rule_list in rule_data.items():
        output.append(f"{rule_type}:")
        output.extend(f"  - {value}" for value in rule_list)
    rule_count = sum(line.startswith("  - ") for line in output)
    rules_write(file_path, rule_name, rule_count, output, "Egern")

def process_quantumultx(file_path, enable_type=False, enable_order=False):
    rule_name = file_path.stem
    _, parsed = rules_load(file_path, enable_type=enable_type, enable_order=enable_order)
    output = []
    for style, value, field in parsed:
        if not style:
            continue
        rule_type = QUANTUMULTX_RULE_MAP.get(style, style)
        output.append(f"{rule_type},{value},{rule_name}")
    rule_count = len(output)
    rules_write(file_path, rule_name, rule_count, output, "QuantumultX")

def process_singbox(file_path, enable_type=False, enable_order=False):
    rule_name = file_path.stem
    _, parsed = rules_load(file_path, enable_type=enable_type, enable_order=enable_order)
    rule_data = defaultdict(list)
    for style, value, field in parsed:
        if style not in SINGBOX_RULE_MAP:
            continue
        rule_type = SINGBOX_RULE_MAP[style]
        rule_data[rule_type].append(value)
    rule_list = [{rule_type: value} for rule_type, value in rule_data.items()]
    output = {"version": 3, "rules": rule_list}
    rules_write(file_path, None, None, output, platform="Singbox")

def process_stash(file_path, enable_type=False, enable_order=False):
    rule_name = file_path.stem
    _, parsed = rules_load(file_path, enable_type=enable_type, enable_order=enable_order)
    output = ["payload:"]
    for style, value, field in parsed:
        if not style:
            continue
        if STASH_DOMAIN_FILE.match(rule_name):
            if style == "DOMAIN-SUFFIX":
                value = f"+.{value}"
            formatted = f"  - '{value}'"
        elif STASH_IPCIDR_FILE.match(rule_name):
            formatted = f"  - '{value}'"
        else:
            formatted = f"  - {style},{value}" + (f",{field}" if field else "")
        output.append(formatted)
    rule_count = sum(line.startswith("  - ") for line in output)
    rules_write(file_path, rule_name, rule_count, output, "Stash")

def process_surge(file_path, enable_type=False, enable_order=False):
    rule_name = file_path.stem
    source, _ = rules_load(file_path, enable_type=enable_type, enable_order=enable_order)
    output = list(source)
    rule_count = len(output)
    rules_write(file_path, rule_name, rule_count, output, "Surge")

def main():
    parser = argparse.ArgumentParser(description="规则构建工具")
    parser.add_argument("platform", choices=["Egern", "QuantumultX", "Singbox", "Stash", "Surge"])
    parser.add_argument("file_path", type=Path, help="规则文件或者路径")
    parser.add_argument("--type", action="store_true", help="启用添加规则类型")
    parser.add_argument("--order", action="store_true", help="启用规则排序去重")
    args = parser.parse_args()
    print("============== Build.py ==============")
    print(f"规则添加类型: {'已启用' if args.type else '未启用'} (--type)")
    print(f"规则排序去重: {'已启用' if args.order else '未启用'} (--order)")
    print("======================================")
    platform_map = {
        "Egern": process_egern,
        "QuantumultX": process_quantumultx,
        "Singbox": process_singbox,
        "Stash": process_stash,
        "Surge": process_surge
    }
    process_func = platform_map[args.platform]
    if args.file_path.is_file():
        if args.platform == "Singbox" and args.file_path.suffix != ".json":
            sys.exit(f"Singbox only supports JSON files: {args.file_path.suffix}")
        files_to_process = [args.file_path]
    elif args.file_path.is_dir():
        if args.platform == "Singbox":
            files_to_process = sorted(f for f in args.file_path.iterdir() if f.is_file() and f.suffix == ".json")
        else:
            files_to_process = sorted(f for f in args.file_path.iterdir() if f.is_file())
    else:
        sys.exit(f"{args.file_path} not found or unsupported type.")
    if not files_to_process:
        print(f"No supported files found in: {args.file_path}")
        return
    print(f"Platform: {args.platform}")
    print(f"Processed {len(files_to_process)} file(s) in: {args.file_path}")
    for f in files_to_process:
        try:
            if args.type or args.order:
                process_func(f, enable_type=args.type, enable_order=args.order)
            else:
                process_func(f)
        except Exception as e:
            print(f"Failed to process {f}: {e}")
    print("Processed Completed.")

if __name__ == "__main__":
    main()