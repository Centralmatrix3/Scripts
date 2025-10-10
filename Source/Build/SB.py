#!/usr/bin/env python3

import json
import sys
from pathlib import Path
from collections import defaultdict

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

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python Singbox.py <file>")
        sys.exit(1)
    process_singbox(Path(sys.argv[1]))