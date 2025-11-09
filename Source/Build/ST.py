#!/usr/bin/env python3

import ipaddress
import re
import sys
from pathlib import Path

# [读取文件]
def read_lines(file_path):
    with file_path.open("r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            line = re.sub(r'(?<!:)//.*$', '', line).strip()
            if not line:
                continue
            yield line

# [添加类型]
def process_class(lines):
    for line in lines:
        try:
            network = ipaddress.ip_network(line, strict=False)
            if network.version == 4:
                yield f"IP-CIDR,{network}"
            else:
                yield f"IP-CIDR6,{network}"
        except ValueError:
            yield line

# [排序去重]
def process_order(lines, keep_unknown=False):
    rule_order = [
        "DOMAIN", "DOMAIN-SUFFIX", "DOMAIN-KEYWORD", "DOMAIN-WILDCARD",
        "IP-CIDR", "IP-CIDR6", "IP-ASN", "GEOIP"
    ]
    rulebox = {key: [] for key in rule_order}
    unknown = []
    seenkey = set()
    def sortkey(line):
        return line.partition(",")[2]
    for line in lines:
        linekey = line.lower()
        if linekey in seenkey:
            continue
        seenkey.add(linekey)
        key = line.split(",", 1)[0]
        if key in rulebox:
            rulebox[key].append(line)
        elif keep_unknown:
            unknown.append(line)
    for key in rule_order:
        for line in sorted(rulebox[key], key=sortkey):
            yield line
    if keep_unknown:
        for line in unknown:
            yield line

# [规则解析]
def process_parse(lines):
    for line in lines:
        parts = line.strip().split(",")
        style = parts[0] if len(parts) > 0 else ""
        value = parts[1] if len(parts) > 1 else ""
        field = parts[2] if len(parts) > 2 else ""
        yield style, value, field

# [写回文件]
def write_lines(file_path, lines, rule_name, rule_count):
    with file_path.open("w", encoding="utf-8") as f:
        f.write(f"# 规则名称: {rule_name}\n")
        f.write(f"# 规则统计: {rule_count}\n\n")
        for line in lines:
            f.write(line + "\n")

# [Stash]
def process_stash(file_path):
    rule_name = file_path.stem
    lines = process_order(process_class(read_lines(file_path)))
    domain_re = re.compile(r"^(AdBlock|Advertising|GreatFireWall|DIRECT|PROXY|REJECT)$")
    ipcidr_re = re.compile(r"^(CNCIDR|CNCIDR4|CNCIDR6)$")
    output = ["payload:"]
    for style, value, field in process_parse(lines):
        if not style:
            continue
        if domain_re.match(rule_name):
            if style == "DOMAIN-SUFFIX":
                value = f"+.{value}"
            formatted = f"  - '{value}'"
        elif ipcidr_re.match(rule_name):
            formatted = f"  - '{value}'"
        else:
            formatted = f"  - {style},{value}" + (f",{field}" if field else "")
        output.append(formatted)
    rule_count = sum(line.startswith("  - ") for line in output)
    write_lines(file_path, output, rule_name, rule_count)
    print(f"Processed (Stash) {file_path}")

# [Entry Point]
def main():
    def error_exit(message):
        print(message)
        sys.exit(1)
    if len(sys.argv) < 2:
        error_exit("USAGE: Python Stash.py <file_or_dir>")
    file_path = Path(sys.argv[1])
    if file_path.is_file():
        files_to_process = [file_path]
    elif file_path.is_dir():
        files_to_process = sorted(f for f in file_path.iterdir() if f.is_file())
    else:
        error_exit(f"{file_path} not found or unsupported type.")
    if not files_to_process:
        print(f"No supported files found in: {file_path}")
        return
    print(f"Platform: stash")
    print(f"Found {len(files_to_process)} file(s) in: {file_path}")
    for f in files_to_process:
        try:
            process_stash(f)
        except Exception as e:
            print(f"Failed to process {f}: {e}")
    print("Processing completed.")


if __name__ == "__main__":
    main()