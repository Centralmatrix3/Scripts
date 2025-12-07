#!/usr/bin/env python3

import json
import ipaddress
import re
import sys
from pathlib import Path
from collections import defaultdict

INLINE_COMMENT = re.compile(r"(?<!:)//.*$")

ST_DOMAIN_NAME = re.compile(r"^(AdBlock|Advertising|GreatFireWall|DIRECT|PROXY|REJECT)$")
ST_IPCIDR_NAME = re.compile(r"^(CNCIDR|CNCIDR4|CNCIDR6)$")

ORDER_TYPE = [
    "DOMAIN",
    "DOMAIN-SUFFIX",
    "DOMAIN-KEYWORD",
    "DOMAIN-WILDCARD",
    "IP-CIDR",
    "IP-CIDR6",
    "IP-ASN",
    "GEOIP"
]
ORDER_MAP = {
    rule: index
    for index, rule in enumerate(ORDER_TYPE)
}

EG_TYPE_MAP = {
    "DOMAIN":          "domain_set",
    "DOMAIN-SUFFIX":   "domain_suffix_set",
    "DOMAIN-KEYWORD":  "domain_keyword_set",
    "DOMAIN-WILDCARD": "domain_wildcard_set",
    "IP-CIDR":         "ip_cidr_set",
    "IP-CIDR6":        "ip_cidr6_set",
    "IP-ASN":          "asn_set",
    "GEOIP":           "geoip_set"
}

SB_TYPE_MAP = {
    "DOMAIN":         "domain",
    "DOMAIN-SUFFIX":  "domain_suffix",
    "DOMAIN-KEYWORD": "domain_keyword",
    "IP-CIDR":        "ip_cidr",
    "IP-CIDR6":       "ip_cidr"
}

def rules_load(file_path, enable_type=False, enable_order=False):
    source = []
    for line in file_path.read_text(encoding="utf-8").splitlines():
        line = INLINE_COMMENT.sub("", line).strip()
        if not line or line.startswith("#"):
            continue
        source.append(line)
    if enable_type:
        source = [rules_type(rule) for rule in source]
    if enable_order:
        source = list(rules_order(source))
    parsed = []
    for line in source:
        parts = line.split(",", 2)
        style = parts[0] if len(parts) > 0 else ""
        value = parts[1] if len(parts) > 1 else ""
        field = parts[2] if len(parts) > 2 else ""
        parsed.append((style, value, field))
    return source, parsed

def rules_type(line):
    try:
        network = ipaddress.ip_network(line, strict=False)
        if network.version == 4:
            return f"IP-CIDR,{network}"
        else:
            return f"IP-CIDR6,{network}"
    except ValueError:
        return line

def _get_order_key(line):
    return line.partition(",")[2]
def rules_order(lines, unknown_rule=False):
    rules_all = []
    for line in lines:
        type_key = line.split(",", 1)[0]
        type_index = ORDER_MAP.get(type_key, len(ORDER_TYPE))
        rules_all.append((type_index, line))
    rules_all.sort(key=lambda x: (x[0], _get_order_key(x[1])))
    rules_seen = set()
    for type_index, rule in rules_all:
        rule_lower = rule.lower()
        if rule_lower in rules_seen:
            continue
        rules_seen.add(rule_lower)
        if type_index == len(ORDER_TYPE) and not unknown_rule:
            continue
        yield rule

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
        if not style or style not in EG_TYPE_MAP:
            continue
        if field == "no-resolve":
            no_resolve = True
        key = EG_TYPE_MAP[style]
        if key == "domain_wildcard_set":
            value = f'"{value}"'
        rule_data[key].append(value)
    output = []
    if no_resolve:
        output.append("no_resolve: true")
    for key, rules in rule_data.items():
        if not rules:
            continue
        output.append(f"{key}:")
        output.extend(f"  - {value}" for value in rules)
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
        if style.startswith("DOMAIN"):
            style = "HOST" + style[len("DOMAIN"):]
        elif style.startswith("IP-CIDR6"):
            style = "IP6-CIDR"
        output.append(f"{style},{value},{rule_name}")
    rule_count = len(output)
    rules_write(file_path, rule_name, rule_count, output)
    print(f"Processed (QuantumultX) {file_path}")

def process_singbox(file_path, enable_type=False, enable_order=False):
    rule_name = file_path.stem
    _, parsed = rules_load(file_path, enable_type=enable_type, enable_order=enable_order)
    rule_data = defaultdict(list)
    for style, value, field in parsed:
        if not style or style not in SB_TYPE_MAP:
            continue
        key = SB_TYPE_MAP[style]
        rule_data[key].append(value)
    output = {"version": 3, "rules": [{key: value} for key, value in rule_data.items() if value]}
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
        if ST_DOMAIN_NAME.match(rule_name):
            if style == "DOMAIN-SUFFIX":
                value = f"+.{value}"
            formatted = f"  - '{value}'"
        elif ST_IPCIDR_NAME.match(rule_name):
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
    arg_type = "--type" in sys.argv
    arg_order = "--order" in sys.argv
    args = [arg for arg in sys.argv[1:] if arg not in ("--type", "--order")]
    if len(args) < 2:
        error_exit("USAGE: Python Build.py <platform> [--type] [--order] <file_or_dir>")
    platform = args[0].lower()
    file_path = Path(args[1])
    platform_map = {
        "egern":       process_egern,
        "quantumultx": process_quantumultx,
        "singbox":     process_singbox,
        "stash":       process_stash,
        "surge":       process_surge
    }
    process_func = platform_map.get(platform)
    if not process_func:
        error_exit(f"Unknown platform: {platform}")
    if file_path.is_file():
        if platform == "singbox" and file_path.suffix != ".json":
            error_exit(f"Singbox only supports JSON files: {file_path.suffix}")
        files_to_process = [file_path]
    elif file_path.is_dir():
        if platform == "singbox":
            files_to_process = sorted(file_path.glob("*.json"))
        else:
            files_to_process = sorted(f for f in file_path.iterdir() if f.is_file())
    else:
        error_exit(f"{file_path} not found or unsupported type.")
    if not files_to_process:
        print(f"No supported files found in: {file_path}")
        return
    print(f"Platform: {platform}")
    print(f"Flags: --type={arg_type}, --order={arg_order}")
    print(f"Found {len(files_to_process)} file(s) in: {file_path}")
    for f in files_to_process:
        try:
            if arg_type or arg_order:
                process_func(f, enable_type=arg_type, enable_order=arg_order)
            else:
                process_func(f)
        except Exception as e:
            print(f"Failed to process {f}: {e}")
    print("Processing completed.")

if __name__ == "__main__":
    main()