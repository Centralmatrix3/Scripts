#!/usr/bin/env python3

import ipaddress
import re
import sys
from pathlib import Path
#=================#
#      Clean      #
#=================#
def process_clean(lines):
    result = []
    for line in lines:
        line = line.strip()
        line = re.sub(r'(?<!:)//.*$', '', line).strip()
        if not line or line.startswith("#"):
            continue
        result.append(line)
    return result
#=================#
#      Class      #
#=================#
def process_class(lines):
    result = []
    for line in lines:
        try:
            net = ipaddress.ip_network(line, strict=False)
            line = f"IP-CIDR,{net}" if net.version == 4 else f"IP-CIDR6,{net}"
        except ValueError:
            pass
        result.append(line)
    return result
#=================#
#      Order      #
#=================#
def process_order(lines, keep_unknown=False):
    rule_order = ["DOMAIN","DOMAIN-SUFFIX","DOMAIN-KEYWORD","DOMAIN-WILDCARD",
                  "IP-CIDR","IP-CIDR6","IP-ASN","GEOIP"]
    seen, known, unknown = set(), [], []
    for line in lines:
        key = line.lower()
        if key in seen:
            continue
        seen.add(key)
        index = next((i for i, p in enumerate(rule_order) if line.startswith(p + ",")), None)
        if index is not None:
            known.append((index, line))
        elif keep_unknown:
            unknown.append(line)
    known.sort(key=lambda x: (x[0], x[1]))
    unknown.sort()
    return [line for _, line in known] + unknown
#=================#
#   QuantumultX   #
#=================#
def process_quantumultx(file_path: Path):
    lines = file_path.read_text(encoding="utf-8").splitlines()
    lines = process_clean(lines)
    lines = process_class(lines)
    lines = process_order(lines)
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
#   Entry Point   #
#=================#
def main():
    if len(sys.argv) < 2:
        print("Usage: python QuantumultX.py <file>")
        sys.exit(1)
    file_path = Path(sys.argv[1])
    if not file_path.is_file():
        print(f"{file_path} not found.")
        sys.exit(1)
    process_quantumultx(file_path)

if __name__ == "__main__":
    main()