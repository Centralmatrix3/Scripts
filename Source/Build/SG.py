#!/usr/bin/env python3

# [Standard Library]
import ipaddress
import re
import sys
from pathlib import Path

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

def process_surge(file_path):
    rule_name = file_path.stem
    lines = rules_read(file_path)
    output = list(lines)
    rule_count = len(output)
    rules_write(file_path, rule_name, rule_count, output)
    print(f"Processed (Surge) {file_path}")

# [Extra]
def process_extra(file_path):
    rule_name = file_path.stem
    lines = rules_order(rules_type(rules_read(file_path)))
    output = list(lines)
    rule_count = len(output)
    rules_write(file_path, rule_name, rule_count, output)
    print(f"Processed (Extra) {file_path}")

# [Entry Point]
def main():
    def error_exit(message):
        print(message)
        sys.exit(1)
    if len(sys.argv) < 3:
        error_exit("USAGE: Python Build.py <mode> <file_or_dir>")
    mode = sys.argv[1].lower()
    file_path = Path(sys.argv[2])
    mode_map = {
        "surge": process_surge,
        "extra": process_extra
    }
    process_func = mode_map.get(mode)
    if not process_func:
        error_exit(f"Unknown mode: {mode}")
    if file_path.is_file():
        files_to_process = [file_path]
    elif file_path.is_dir():
        files_to_process = sorted(f for f in file_path.iterdir() if f.is_file())
    else:
        error_exit(f"{file_path} not found or unsupported type.")
    if not files_to_process:
        print(f"No supported files found in: {file_path}")
        return
    print(f"Platform: surge/extra ({mode})")
    print(f"Found {len(files_to_process)} file(s) in: {file_path}")
    for f in files_to_process:
        try:
            process_func(f)
        except Exception as e:
            print(f"Failed to process {f}: {e}")
    print("Processing completed.")


if __name__ == "__main__":
    main()