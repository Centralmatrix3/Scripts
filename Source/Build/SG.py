#!/usr/bin/env python3

import ipaddress
import re
import sys
from pathlib import Path

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
            if not line:
                continue
            if line[0].isdigit():
                try:
                    net = ipaddress.ip_network(line, strict=False)
                    line = f"IP-CIDR,{net}" if isinstance(net, ipaddress.IPv4Network) else f"IP-CIDR6,{net}"
                except ValueError:
                    pass
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
    final = [line for _, line in known] + unknown

    with file_path.open("w", encoding="utf-8") as f:
        f.writelines(line + "\n" for line in final)
    print(f"Processed (Surge) {file_path}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python Surge.py <file>")
        sys.exit(1)
    process_surge(Path(sys.argv[1]))