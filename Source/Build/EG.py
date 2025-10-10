#!/usr/bin/env python3

import sys
from pathlib import Path

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

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python Egern.py <file>")
        sys.exit(1)
    process_egern(Path(sys.argv[1]))