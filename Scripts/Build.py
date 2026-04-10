#!/usr/bin/env python3

import argparse
import sys
import re
import json
import ipaddress
import dataclasses
from library import source # source
from pathlib import Path
from collections import defaultdict

INLINE_COMMENTS = re.compile(r"(?<!:)//.*$")

RULE_TYPE_ORDER = [
    "DOMAIN", "DOMAIN-SUFFIX",
    "DOMAIN-KEYWORD", "DOMAIN-WILDCARD",
    "IP-CIDR", "IP-CIDR6",
    "IP-ASN", "GEOIP"
]
RULE_TYPE_PATCH = {
    "USER-AGENT", "URL-REGEX",
    "PROTOCOL", "PROCESS-NAME"
}
RULE_TYPE_INDEX = {rule: index for index, rule in enumerate(RULE_TYPE_ORDER)}
RULE_TYPE_KNOWN = frozenset(RULE_TYPE_ORDER) | RULE_TYPE_PATCH

EGERN_RULE_MAP = {
    "DOMAIN": "domain_set", "DOMAIN-SUFFIX": "domain_suffix_set",
    "DOMAIN-KEYWORD": "domain_keyword_set", "DOMAIN-WILDCARD": "domain_wildcard_set",
    "IP-CIDR": "ip_cidr_set", "IP-CIDR6": "ip_cidr6_set",
    "IP-ASN": "asn_set", "GEOIP": "geoip_set"
}
EGERN_RULE_QUOTE = {"domain_wildcard_set"}

QUANTUMULTX_RULE_MAP = {
    "DOMAIN": "HOST", "DOMAIN-SUFFIX": "HOST-SUFFIX",
    "DOMAIN-KEYWORD": "HOST-KEYWORD", "DOMAIN-WILDCARD": "HOST-WILDCARD",
    "IP-CIDR": "IP-CIDR", "IP-CIDR6": "IP6-CIDR",
    "IP-ASN": "IP-ASN", "GEOIP": "GEOIP"
}

SINGBOX_RULE_MAP = {
    "DOMAIN": "domain", "DOMAIN-SUFFIX": "domain_suffix",
    "DOMAIN-KEYWORD": "domain_keyword",
    "IP-CIDR": "ip_cidr", "IP-CIDR6": "ip_cidr"
}

STASH_RULE_DOMAIN = {"AdBlock", "Advertising", "DIRECT", "GreatFireWall", "PROXY", "REJECT"}
STASH_RULE_IPCIDR = {"CNCIDR", "CNCIDR4", "CNCIDR6"}

@dataclasses.dataclass
class Rule:
    type: str; value: str; param: str = ""
@dataclasses.dataclass
class RuleSet:
    name: str; rules: list = dataclasses.field(default_factory=list)

def process_parse(line, enable_type=False, enable_param=False):
    line = INLINE_COMMENTS.sub("", line).strip()
    if not line or line.startswith("#"):
        return None
    parts = line.split(",", 2)
    while len(parts) < 3:
        parts.append("")
    rule_type, rule_value, rule_param = (parts + [""])[:3]
    if enable_type and rule_type.upper() not in RULE_TYPE_KNOWN:
        if rule_value and not rule_param:
            rule_param, rule_value = rule_value, ""
        try:
            rule_value = ipaddress.ip_network(rule_type, strict=False)
            rule_type = "IP-CIDR6" if rule_value.version == 6 else "IP-CIDR"
        except ValueError:
            rule_value = rule_type.lstrip(".")
            rule_type = "DOMAIN-SUFFIX" if rule_type.startswith(".") else "DOMAIN"
    rule_type, rule_value, rule_param = rule_type.upper(), str(rule_value), rule_param.strip()
    if enable_param and rule_type in {"IP-CIDR", "IP-CIDR6"}:
        param = [item.strip() for item in rule_param.split(",") if item.strip()]
        if "no-resolve" not in param:
            param.append("no-resolve")
        rule_param = ",".join(param)
    return Rule(rule_type, rule_value, rule_param)

def process_order(rules, unknown_rule=False):
    seen, result = set(), []
    def rule_sort(rule):
        return (RULE_TYPE_INDEX.get(rule.type, len(RULE_TYPE_ORDER)), rule.value)
    for rule in sorted(rules, key=rule_sort):
        rule_data = (rule.type.lower(), rule.value.lower())
        if rule_data in seen:
            continue
        if rule.type not in RULE_TYPE_INDEX and not unknown_rule:
            continue
        seen.add(rule_data)
        result.append(rule)
    return result

def process_read(file_path, enable_type=False, enable_order=False, enable_param=False, unknown_rule=False):
    rules = [
        process_parse(line, enable_type=enable_type, enable_param=enable_param)
        for line in file_path.read_text(encoding="utf-8").splitlines()
    ]
    rules = [rule for rule in rules if rule]
    if enable_order:
        rules = process_order(rules, unknown_rule=unknown_rule)
    return RuleSet(file_path.stem, rules)

def process_write(file_path, rule_name, rule_data, platform):
    def rule_count(rule_data, platform):
        if platform in {"Egern", "Stash"}:
            return sum(line.startswith("  - ") for line in rule_data)
        if platform in {"QuantumultX", "Surge"}:
            return len(rule_data)
        return None
    with file_path.open("w", encoding="utf-8", newline="\n") as f:
        if platform == "Singbox":
            f.write(json.dumps(rule_data, indent=2, ensure_ascii=False) + "\n")
        else:
            rule_total = rule_count(rule_data, platform)
            f.write(f"# 规则名称: {rule_name}\n")
            f.write(f"# 规则统计: {rule_total}\n\n")
            f.writelines(f"{line}\n" for line in rule_data)
    print(f"Processed ({platform}): {file_path}")

def convert_rules(ruleset, platform):
    rule_list, rule_name = ruleset.rules, ruleset.name
    if platform == "Egern":
        rule_dict = defaultdict(list)
        no_resolve = any(rule.param == "no-resolve" for rule in rule_list)
        for rule in rule_list:
            if rule.type in EGERN_RULE_MAP:
                rule_type = EGERN_RULE_MAP[rule.type]
                rule_value = f'"{rule.value}"' if rule_type in EGERN_RULE_QUOTE else rule.value
                rule_dict[rule_type].append(rule_value)
        output = ["no_resolve: true"] if no_resolve else []
        for rule_type, rule_data in rule_dict.items():
            output.append(f"{rule_type}:")
            output.extend(f"  - {rule_value}" for rule_value in rule_data)
        return output
    elif platform == "QuantumultX":
        output = []
        for rule in rule_list:
            if rule.type in QUANTUMULTX_RULE_MAP:
                rule_type = QUANTUMULTX_RULE_MAP[rule.type]
                output.append(f"{rule_type},{rule.value},{rule_name}")
        return output
    elif platform == "Singbox":
        rule_dict = defaultdict(list)
        for rule in rule_list:
            if rule.type in SINGBOX_RULE_MAP:
                rule_type = SINGBOX_RULE_MAP[rule.type]
                rule_dict[rule_type].append(rule.value)
        rule_data = [{rule_type: rule_value} for rule_type, rule_value in rule_dict.items()]
        output = {"version": 3, "rules": rule_data}
        return output
    elif platform == "Stash":
        output = ["payload:"]
        for rule in rule_list:
            if rule_name in STASH_RULE_DOMAIN:
                rule_value = f"+.{rule.value}" if rule.type == "DOMAIN-SUFFIX" else rule.value
                output.append(f"  - '{rule_value}'")
            elif rule_name in STASH_RULE_IPCIDR:
                output.append(f"  - '{rule.value}'")
            else:
                rule_data = f"{rule.type},{rule.value}" + (f",{rule.param}" if rule.param else "")
                output.append(f"  - {rule_data}")
        return output
    elif platform == "Surge":
        output = []
        for rule in rule_list:
            rule_data = f"{rule.type},{rule.value}" + (f",{rule.param}" if rule.param else "")
            output.append(rule_data)
        return output

"""
def parse_arguments():
    parser = argparse.ArgumentParser(description="Rule Convert")
    parser.add_argument("platform", choices=["Egern", "QuantumultX", "Singbox", "Stash", "Surge"])
    parser.add_argument("file_path", type=Path)
    parser.add_argument("--type", action=argparse.BooleanOptionalAction)
    parser.add_argument("--param", action=argparse.BooleanOptionalAction)
    parser.add_argument("--order", action=argparse.BooleanOptionalAction)
    parser.add_argument("--unknown-rule", action=argparse.BooleanOptionalAction)
    return parser.parse_args()
"""
def parse_arguments():
    parser = argparse.ArgumentParser(description="Rule Convert")
    parser.add_argument("platform", nargs="?", choices=["Egern", "QuantumultX", "Singbox", "Stash", "Surge"])
    parser.add_argument("file_path", nargs="?", type=Path)
    parser.add_argument("--type", action=argparse.BooleanOptionalAction)
    parser.add_argument("--param", action=argparse.BooleanOptionalAction)
    parser.add_argument("--order", action=argparse.BooleanOptionalAction)
    parser.add_argument("--unknown-rule", action=argparse.BooleanOptionalAction)
    group = parser.add_mutually_exclusive_group()
    group.add_argument("--download", action="store_true")
    group.add_argument("--copy", action="store_true")
    return parser.parse_args()

def capture_file(file_path, platform):
    if not file_path.exists():
        sys.exit(f"{file_path} Not Found.")
    if file_path.is_file():
        if platform == "Singbox" and file_path.suffix != ".json":
            sys.exit(f"Singbox only supports JSON File: {file_path.suffix}")
        return [file_path]
    if file_path.is_dir():
        file = [file for file in file_path.iterdir() if file.is_file()]
        if platform == "Singbox":
            file = [file for file in file if file.suffix == ".json"]
        return sorted(file)
    sys.exit(f"{file_path} Unknown Type.")

def process_file(file_list, args):
    enable_type, enable_param = args.type, args.param
    enable_order, unknown_rule = args.order, args.unknown_rule
    for file_path in file_list:
        try:
            rule_read = process_read(file_path, enable_type, enable_order, enable_param, unknown_rule)
            rule_data = convert_rules(rule_read, args.platform)
            process_write(file_path, rule_read.name, rule_data, args.platform)
        except Exception as e:
            print(f"Failed to process {file_path}: {e}")
    print("Processed Completed.")

"""
def main():
    args = parse_arguments()
    print("============== Build.py ==============")
    for name, enabled in [
        ("添加规则类型", args.type),
        ("添加规则参数", args.param),
        ("排序规则去重", args.order),
        ("未知规则保留", args.unknown_rule)
    ]:
        print(f"{name}: {'已启用' if enabled else '未启用'}")
    print("======================================")
    file = capture_file(args.file_path, args.platform)
    if not file:
        print(f"No File Found in: {args.file_path}")
        return
    print(f"Platform: {args.platform}")
    print(f"Processed {len(file)} file(s) in: {args.file_path}")
    process_file(file, args)

if __name__ == "__main__":
    main()
"""

def run_content_mode(args):
    if any([
        args.platform, args.file_path,
        args.type, args.param,
        args.order, args.unknown_rule,
    ]):
        sys.exit("Error: --download 和 --copy 不能与转换模式一起使用")
    print("============== Build.py ==============")
    for name, enabled in [
        ("使用下载规则", args.download),
        ("使用复制规则", args.copy)
    ]:
        print(f"{name}: {'已启用' if enabled else '未启用'}")
    print("======================================")
    source.process_source("download" if args.download else "copy")

def run_convert_mode(args):
    if not args.platform or not args.file_path:
        sys.exit("Error: 转换模式请提供平台(platform)文件或路径")
    print("============== Build.py ==============")
    for name, enabled in [
        ("添加规则类型", args.type),
        ("添加规则参数", args.param),
        ("排序规则去重", args.order),
        ("未知规则保留", args.unknown_rule)
    ]:
        print(f"{name}: {'已启用' if enabled else '未启用'}")
    print("======================================")
    file = capture_file(args.file_path, args.platform)
    if not file:
        print(f"No File Found in: {args.file_path}")
        return
    print(f"Platform: {args.platform}")
    print(f"Processed {len(file)} file(s) in: {args.file_path}")
    process_file(file, args)

def main():
    args = parse_arguments()
    if args.download or args.copy:
        run_content_mode(args)
    elif args.platform and args.file_path:
        run_convert_mode(args)
    else:
        sys.exit("Error: 请使用 --download/--copy，或提供 platform 和 file_path 进行规则转换")

if __name__ == "__main__":
    main()