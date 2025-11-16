#!/usr/bin/env python3

# [Standard Library]
import json
import ipaddress
import re
import sys
from pathlib import Path
from collections import defaultdict

# [Read]
def rules_read(file_path):
    remark_re = re.compile(r'(?<!:)//.*$')
    with file_path.open("r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            line = remark_re.sub("", line).strip()
            if not line:
                continue
            yield line

# [Type]
def rules_type(lines):
    for line in lines:
        line = line.strip()
        try:
            network = ipaddress.ip_network(line, strict=False)
            if network.version == 4:
                yield f"IP-CIDR,{network}"
            else:
                yield f"IP-CIDR6,{network}"
        except ValueError:
            yield line

# [Order]
def rules_order(lines, unknown_rule=False):
    order_type = [
        "DOMAIN", "DOMAIN-SUFFIX", "DOMAIN-KEYWORD", "DOMAIN-WILDCARD",
        "IP-CIDR", "IP-CIDR6", "IP-ASN", "GEOIP"
    ]
    order_key = lambda line: line.partition(",")[2]
    rules_all = []
    rules_map = {rule: index for index, rule in enumerate(order_type)}
    for line in lines:
        type_key = line.split(",", 1)[0]
        type_index = rules_map.get(type_key, len(order_type))
        rules_all.append((type_index, line))
    rules_all.sort(key=lambda x: (x[0], order_key(x[1])))
    rules_seen = set()
    for type_index, rule in rules_all:
        rule_lower = rule.lower()
        if rule_lower in rules_seen:
            continue
        rules_seen.add(rule_lower)
        if type_index == len(order_type) and not unknown_rule:
            continue
        yield rule

# [Parse]
def rules_parse(lines):
    for line in lines:
        parts = line.strip().split(",", 2)
        style = parts[0] if len(parts) > 0 else ""
        value = parts[1] if len(parts) > 1 else ""
        field = parts[2] if len(parts) > 2 else ""
        yield style, value, field

# [Write]
def rules_write(file_path, rule_name, rule_count, rules):
    with file_path.open("w", encoding="utf-8") as f:
        f.write(f"# 规则名称: {rule_name}\n")
        f.write(f"# 规则统计: {rule_count}\n\n")
        for line in rules:
            f.write(line + "\n")

# [Singbox]
def process_singbox(file_path):
    rule_name = file_path.stem
    lines = rules_order(rules_type(rules_read(file_path)))
    rule_dict = {
        "DOMAIN":          "domain",
        "DOMAIN-SUFFIX":   "domain_suffix",
        "DOMAIN-KEYWORD":  "domain_keyword",
        "IP-CIDR":         "ip_cidr",
        "IP-CIDR6":        "ip_cidr"
    }
    rule_data = defaultdict(list)
    for style, value, field in rules_parse(lines):
        if not style or style not in rule_dict:
            continue
        key = rule_dict[style]
        rule_data[key].append(value)
    output = {
        "version": 3,
        "rules": [{key: value} for key, value in rule_data.items() if value]
    }
    with file_path.open("w", encoding="utf-8") as f:
        json.dump(output, f, indent=2, ensure_ascii=False)
        f.write("\n")
    print(f"Processed (Singbox) {file_path}")

# [Entry Point]
def main():
    def error_exit(message):
        print(message)
        sys.exit(1)
    if len(sys.argv) < 2:
        error_exit("USAGE: Python Singbox.py <file_or_dir>")
    file_path = Path(sys.argv[1])
    if file_path.is_file():
        if file_path.suffix != ".json":
            error_exit(f"Singbox only supports JSON files: {file_path.suffix}")
        files_to_process = [file_path]
    elif file_path.is_dir():
        files_to_process = sorted(file_path.glob("*.json"))
    else:
        error_exit(f"{file_path} not found or unsupported type.")
    if not files_to_process:
        print(f"No supported JSON files found in: {file_path}")
        return
    print(f"Platform: singbox")
    print(f"Found {len(files_to_process)} file(s) in: {file_path}")
    for f in files_to_process:
        try:
            process_singbox(f)
        except Exception as e:
            print(f"Failed to process {f}: {e}")
    print("Processing completed.")


if __name__ == "__main__":
    main()