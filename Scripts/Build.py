#!/usr/bin/env python3

import json
import sys
import re
import ipaddress
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
RULE_TO_INDEX = {rule: index for index, rule in enumerate(RULE_TYPE_ORDER)}

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
    try:
        network = ipaddress.ip_network(line, strict=False)
        return f"IP-CIDR,{network}" if network.version == 4 else f"IP-CIDR6,{network}"
    except ValueError:
        return line

def rules_order(lines, unknown_rule=False):
    def sort_rule(line):
        rule_type, rule_value = line.split(",", 1)[0], line.partition(",")[2]
        type_index = RULE_TO_INDEX.get(rule_type, len(RULE_TYPE_ORDER))
        return type_index, rule_value
    seen = set()
    for line in sorted(lines, key=sort_rule):
        lower = line.lower()
        rule_type = line.split(",", 1)[0]
        if lower in seen or (rule_type not in RULE_TO_INDEX and not unknown_rule):
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

def rules_write(file_path, rule_name, rule_count, rules):
    with file_path.open("w", encoding="utf-8") as f:
        f.write(f"# 规则名称: {rule_name}\n")
        f.write(f"# 规则统计: {rule_count}\n\n")
        f.writelines(f"{line}\n" for line in rules)

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
    output_data = []
    for rule_type, rule_list in rule_data.items():
        if not rule_list:
            continue
        output_data.append((rule_type, rule_list))
    output = ["no_resolve: true"] if no_resolve else []
    for rule_type, rule_list in output_data:
        output.append(f"{rule_type}:")
        output.extend(f"  - {value}" for value in rule_list)
    rule_count = sum(line.startswith("  - ") for line in output)
    rules_write(file_path, rule_name, rule_count, output)
    print(f"Processed (Egern) {file_path}")

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
    rules_write(file_path, rule_name, rule_count, output)
    print(f"Processed (QuantumultX) {file_path}")

def process_singbox(file_path, enable_type=False, enable_order=False):
    rule_name = file_path.stem
    _, parsed = rules_load(file_path, enable_type=enable_type, enable_order=enable_order)
    rule_data = defaultdict(list)
    for style, value, field in parsed:
        if style not in SINGBOX_RULE_MAP:
            continue
        rule_type = SINGBOX_RULE_MAP[style]
        rule_data[rule_type].append(value)
    output_data = []
    for rule_type, rule_list in rule_data.items():
        if not rule_list:
            continue
        output_data.append({rule_type: rule_list})
    output = {"version": 3, "rules": output_data}
    with file_path.open("w", encoding="utf-8") as f:
        json.dump(output, f, indent=2, ensure_ascii=False)
        f.write("\n")
    print(f"Processed (Singbox) {file_path}")

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
    rules_write(file_path, rule_name, rule_count, output)
    print(f"Processed (Stash) {file_path}")

def process_surge(file_path, enable_type=False, enable_order=False):
    rule_name = file_path.stem
    source, _ = rules_load(file_path, enable_type=enable_type, enable_order=enable_order)
    output = list(source)
    rule_count = len(output)
    rules_write(file_path, rule_name, rule_count, output)
    print(f"Processed (Surge) {file_path}")

def main():
    def error_exit(message):
        print(message)
        sys.exit(1)
    if len(sys.argv) < 3:
        error_exit("USAGE: Python Build.py <platform> [--type] [--order] <file_or_dir>")
    arguments_type = "--type" in sys.argv
    arguments_order = "--order" in sys.argv
    arguments = [arg for arg in sys.argv[1:] if not arg.startswith("--")]
    if len(arguments) < 2:
        error_exit("USAGE: Python Build.py <platform> [--type] [--order] <file_or_dir>")
    platform = arguments[0]
    file_path = Path(arguments[1])
    platform_map = {
        "Egern": process_egern,
        "QuantumultX": process_quantumultx,
        "Singbox": process_singbox,
        "Stash": process_stash,
        "Surge": process_surge
    }
    process_func = platform_map.get(platform)
    if not process_func:
        error_exit(f"Unknown platform: {platform}")
    signature = inspect.signature(process_func)
    default_enable_type = signature.parameters["enable_type"].default
    default_enable_order = signature.parameters["enable_order"].default
    if arguments_type or arguments_order:
        print("========== Build.py 参数状态 ==========")
        print(f"规则添加类型: {'已启用' if arguments_type else '未启用'} (--type) ")
        print(f"规则排序去重: {'已启用' if arguments_order else '未启用'} (--order) ")
        print("======================================")
    else:
        print("========== Build.py 默认行为 ==========")
        print(f"规则添加类型: {'已启用' if default_enable_type else '未启用'}（默认）")
        print(f"规则排序去重: {'已启用' if default_enable_order else '未启用'}（默认）")
        print("======================================")
    if file_path.is_file():
        if platform == "Singbox" and file_path.suffix != ".json":
            error_exit(f"Singbox only supports JSON files: {file_path.suffix}")
        files_to_process = [file_path]
    elif file_path.is_dir():
        if platform == "Singbox":
            files_to_process = sorted(file_path.glob("*.json"))
        else:
            files_to_process = sorted(f for f in file_path.iterdir() if f.is_file())
    else:
        error_exit(f"{file_path} not found or unsupported type.")
    if not files_to_process:
        print(f"No supported files found in: {file_path}")
        return
    print(f"Platform: {platform}")
    print(f"Processed {len(files_to_process)} file(s) in: {file_path}")
    for f in files_to_process:
        try:
            if arguments_type or arguments_order:
                process_func(f, enable_type=arguments_type, enable_order=arguments_order)
            else:
                process_func(f)
        except Exception as e:
            print(f"Failed to process {f}: {e}")
    print("Processed Completed.")

if __name__ == "__main__":
    main()