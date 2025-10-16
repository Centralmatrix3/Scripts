#!/usr/bin/env python3

import json
import ipaddress
import re
import sys
from pathlib import Path
from collections import defaultdict
#=================#
#    RuleClean    #
#=================#
def process_clean(lines):
    for line in lines:
        line = line.strip()
        line = re.sub(r'(?<!:)//.*$', '', line).strip()
        if not line or line.startswith("#"):
            continue
        yield line
#=================#
#    RuleClass    #
#=================#
def process_class(lines):
    result = []
    for line in lines:
        try:
            net = ipaddress.ip_network(line, strict=False)
            line = f"IP-CIDR,{net}" if isinstance(net, ipaddress.IPv4Network) else f"IP-CIDR6,{net}"
        except ValueError:
            pass
        result.append(line)
    return result
#=================#
#    RuleOrder    #
#=================#
def process_order(lines, keep_unknown=False):
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
    for line in lines:
        key = line.lower()
        if key in seen:
            continue
        seen.add(key)
        rule_index = next((i for i, p in enumerate(rule_order) if line.startswith(p + ",")), None)
        if rule_index is not None:
            known.append((rule_index, line))
        elif keep_unknown:
            unknown.append(line)
    known.sort(key=lambda x: (x[0], x[1]))
    unknown.sort()
    return [line for _, line in known] + unknown
#=================#
#     General     #
#=================#
def preprocess(lines, setup_clean=True, setup_class=True, setup_order=True, keep_unknown=False):
    if setup_clean:
        lines = list(process_clean(lines))
    else:
        lines = [line.strip() for line in lines]
    if setup_class:
        lines = process_class(lines)
    if setup_order:
        lines = process_order(lines, keep_unknown=keep_unknown)
    return lines
DEFAULT_CONFIG = {
    "Egern":       {"setup_clean": False, "setup_class": False, "setup_order": False},
    "QuantumultX": {"setup_clean": False, "setup_class": False, "setup_order": False},
    "Singbox":     {"setup_clean": False, "setup_class": False, "setup_order": False},
    "Stash":       {"setup_clean": False, "setup_class": False, "setup_order": False},
    "Surge":       {"setup_clean": True,  "setup_class": True,  "setup_order": True}
}
#=================#
#      Egern      #
#=================#
def process_egern(file_path: Path):
    cfg = DEFAULT_CONFIG["Egern"]
    lines = file_path.read_text(encoding="utf-8").splitlines()
    lines = preprocess(lines, **cfg)
    cidr_map = ("IP-CIDR", "IP-CIDR6", "IP-ASN", "GEOIP")
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
    for line in lines:
        prefix, value = map(str.strip, line.split(",", 1))
        if prefix in cidr_map and "no-resolve" in value:
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
#=================#
#   QuantumultX   #
#=================#
def process_quantumultx(file_path: Path):
    cfg = DEFAULT_CONFIG["QuantumultX"]
    lines = file_path.read_text(encoding="utf-8").splitlines()
    lines = preprocess(lines, **cfg)
    domain_re = re.compile(r"^DOMAIN(-SUFFIX|-KEYWORD|-WILDCARD)?,")
    ipcidr_re = re.compile(r"^IP-CIDR6,")
    rule_name = file_path.stem
    out = []
    for line in lines:
        line = domain_re.sub(r"HOST\1,", line)
        line = ipcidr_re.sub("IP6-CIDR,", line)
        line = line.replace(",no-resolve", "")
        out.append(f"{line},{rule_name}")
    file_path.write_text("\n".join(out) + "\n", encoding="utf-8")
    print(f"Processed (QuantumultX) {file_path}")
#=================#
#     Singbox     #
#=================#
def process_singbox(file_path: Path):
    cfg = DEFAULT_CONFIG["Singbox"]
    lines = file_path.read_text(encoding="utf-8").splitlines()
    lines = preprocess(lines, **cfg)
    rule_map = {
        "domain": ["DOMAIN"],
        "domain_suffix": ["DOMAIN-SUFFIX"],
        "domain_keyword": ["DOMAIN-KEYWORD"],
        "domain_regex": ["DOMAIN-REGEX"],
        "ip_cidr": ["IP-CIDR", "IP-CIDR6"]
    }
    rules_dict = defaultdict(list)
    for line in lines:
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
#=================#
#      Stash      #
#=================#
def process_stash(file_path: Path):
    cfg = DEFAULT_CONFIG["Stash"]
    lines = file_path.read_text(encoding="utf-8").splitlines()
    lines = preprocess(lines, **cfg)
    domain_re = re.compile(r"^(AdBlock|Advertising|GreatFireWall|DIRECT|PROXY|REJECT)$")
    ipcidr_re = re.compile(r"^(CNCIDR|CNCIDR4|CNCIDR6)$")
    rule_name = file_path.stem
    out = []
    for line in lines:
        if domain_re.match(rule_name):
            line = re.sub(r"^DOMAIN,", "", line)
            line = re.sub(r"^DOMAIN-SUFFIX,", "+.", line)
            line = f"  - '{line}'"
        elif ipcidr_re.match(rule_name):
            line = re.sub(r"^IP-CIDR,", "", line)
            line = re.sub(r"^IP-CIDR6,", "", line)
            line = f"  - '{line}'"
        else:
            line = f"  - {line}"
        out.append(line)
    file_path.write_text("payload:\n" + "\n".join(out) + "\n", encoding="utf-8")
    print(f"Processed (Stash) {file_path}")
#=================#
#      Surge      #
#=================#
def process_surge(file_path: Path):
    cfg = DEFAULT_CONFIG["Surge"]
    lines = file_path.read_text(encoding="utf-8").splitlines()
    lines = preprocess(lines, **cfg)
    file_path.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"Processed (Surge) {file_path}")
#=================#
#   Entry Point   #
#=================#
def main():
    if len(sys.argv) < 3:
        print("Usage: python Build.py <mode> <file>")
        sys.exit(1)
    mode = sys.argv[1]
    file_path = Path(sys.argv[2])
    if not file_path.is_file():
        print(f"{file_path} not found.")
        sys.exit(1)
    processors = {
        "Egern":       process_egern,
        "QuantumultX": process_quantumultx,
        "Singbox":     process_singbox,
        "Stash":       process_stash,
        "Surge":       process_surge
    }
    if mode not in processors:
        print("Invalid type. Use 'Egern', 'QuantumultX', 'Singbox', 'Stash', or 'Surge'.")
        sys.exit(1)
    processors[mode](file_path)

if __name__ == "__main__":
    main()