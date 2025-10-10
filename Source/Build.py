#!/usr/bin/env python3

import json
import ipaddress
import re
import sys
from pathlib import Path
from collections import defaultdict

# ----- Egern ----- #
def process_egern(file_path: Path):
    ip_types = ("IP-CIDR", "IP-CIDR6", "IP-ASN", "GEOIP")
    rule_map = {
        "domain_set": ["DOMAIN"],
        "domain_suffix_set": ["DOMAIN-SUFFIX"],
        "domain_keyword_set": ["DOMAIN-KEYWORD"],
        "domain_wildcard_set": ["DOMAIN-WILDCARD"],
        "ip_cidr_set": ["IP-CIDR"],
        "ip_cidr6_set": ["IP-CIDR6"],
        "asn_set": ["IP-ASN"],
        "geoip_set": ["GEOIP"]
    }
    rules_dict = {key: [] for key in rule_map}
    add_no_resolve = False
    with file_path.open("r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#") or "," not in line:
                continue
            prefix, value = map(str.strip, line.split(",", 1))
            if prefix in ip_types and "no-resolve" in value:
                add_no_resolve = True
            for key, prefixes in rule_map.items():
                if prefix in prefixes:
                    if key == "domain_wildcard_set":
                        value = f'"{value}"'
                    elif key in ("ip_cidr_set", "ip_cidr6_set", "asn_set", "geoip_set"):
                        value = value.split(",")[0].strip()
                    rules_dict[key].append(value)
                    break
    with file_path.open("w", encoding="utf-8") as f:
        if add_no_resolve:
            f.write("no_resolve: true\n")
        for key, values in rules_dict.items():
            if values:
                f.write(f"{key}:\n")
                f.writelines(f"  - {v}\n" for v in values)
    print(f"Processed (Egern) {file_path}")

# ----- QuantumultX ----- #
domain_re = re.compile(r"^DOMAIN(-SUFFIX|-KEYWORD|-WILDCARD)?,")
ipcidr_re = re.compile(r"^IP-CIDR6,")
def process_quantumultx(file_path: Path):
    rule_name = file_path.stem
    out = []
    with file_path.open("r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            line = domain_re.sub(r"HOST\1,", line)
            line = ipcidr_re.sub("IP6-CIDR,", line)
            line = line.replace(",no-resolve", "")
            out.append(f"{line},{rule_name}")
    with file_path.open("w", encoding="utf-8") as f:
        f.writelines(line + "\n" for line in out)
    print(f"Processed (QuantumultX) {file_path}")

# ----- Singbox ----- #
def process_singbox(file_path: Path):
    rule_map = {
        "domain": ["DOMAIN"],
        "domain_suffix": ["DOMAIN-SUFFIX"],
        "domain_keyword": ["DOMAIN-KEYWORD"],
        "ip_cidr": ["IP-CIDR", "IP-CIDR6"]
    }
    rules_dict = defaultdict(list)
    with file_path.open("r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#") or "," not in line:
                continue
            prefix, value = map(str.strip, line.split(",", 1))
            for key, prefixes in rule_map.items():
                if prefix in prefixes:
                    if key == "ip_cidr":
                        value = value.split(",")[0].strip()
                    rules_dict[key].append(value)
                    break
    output = {"version": 3, "rules": [{key: v} for key, v in rules_dict.items() if v]}
    with file_path.open("w", encoding="utf-8") as f:
        json.dump(output, f, indent=2, ensure_ascii=False)
        f.write("\n")
    print(f"Processed (Sing-box) {file_path}")

# ----- Stash ----- #
stash_re = re.compile(r"^(AdBlock|Advertising|GreatFireWall|DIRECT|PROXY|REJECT)$")
def process_stash(file_path: Path):
    rule_name = file_path.stem
    stash_prefix = bool(stash_re.match(rule_name))
    out = []
    with file_path.open("r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            if stash_prefix:
                line = re.sub(r"^DOMAIN,", "", line)
                line = re.sub(r"^DOMAIN-SUFFIX,", "+.", line)
                line = f"  - '{line}'"
            elif "CIDR" in rule_name:
                line = re.sub(r"^IP-CIDR,|^IP-CIDR6,", "", line)
                line = f"  - '{line}'"
            else:
                line = f"  - {line}"
            out.append(line)
    with file_path.open("w", encoding="utf-8") as f:
        f.write("payload:\n")
        f.writelines(line + "\n" for line in out)
    print(f"Processed (Stash) {file_path}")

# ----- Surge ----- #
def process_surge(file_path: Path, keep_unknown=False):
    rule_order = [
        "DOMAIN",
        "DOMAIN-SUFFIX",
        "DOMAIN-KEYWORD",
        "DOMAIN-WILDCARD",
        "IP-CIDR",
        "IP-CIDR6",
        "IP-ASN",
        "GEOIP"
    ]
    seen, known, unknown = set(), [], []
    with file_path.open("r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            line = re.sub(r'(?<!:)//.*$', '', line).strip()
            if not line: continue
            if line[0].isdigit():
                try:
                    net = ipaddress.ip_network(line, strict=False)
                    line = f"IP-CIDR,{net}" if isinstance(net, ipaddress.IPv4Network) else f"IP-CIDR6,{net}"
                except ValueError: pass
            key = line.lower()
            if key in seen: continue
            seen.add(key)
            rule_index = next((i for i, p in enumerate(rule_order) if line.startswith(p + ",")), None)
            if rule_index is not None:
                known.append((rule_index, line))
            elif keep_unknown:
                unknown.append(line)
    known.sort(key=lambda x: (x[0], x[1]))
    unknown.sort()
    final = [line for _, line in known] + unknown
    with file_path.open("w", encoding="utf-8") as f:
        f.writelines(line + "\n" for line in final)
    print(f"Processed (Surge) {file_path}")

# ----- Setup ----- #
def main():
    if len(sys.argv) < 3:
        print("Usage: python Build.py <Egern|QuantumultX|Singbox|Stash|Surge> <file>")
        sys.exit(1)
    mode = sys.argv[1]
    file_path = Path(sys.argv[2])
    if not file_path.is_file():
        print(f"{file_path} not found.")
        sys.exit(1)
    processors = {
        "Egern": process_egern,
        "QuantumultX": process_quantumultx,
        "Singbox": process_singbox,
        "Stash": process_stash,
        "Surge": process_surge
    }
    if mode not in processors:
        print("Invalid type. Use 'Egern', 'QuantumultX', 'Singbox', 'Stash', or 'Surge'.")
        sys.exit(1)
    processors[mode](file_path)

if __name__ == "__main__":
    main()