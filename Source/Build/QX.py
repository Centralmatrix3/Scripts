#!/usr/bin/env python3

import re
import sys
from pathlib import Path

def process_quantumultx(file_path: Path):
    domain_re = re.compile(r"^DOMAIN(-SUFFIX|-KEYWORD|-WILDCARD)?,")
    ipcidr_re = re.compile(r"^IP-CIDR6,")
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

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python QuantumultX.py <file>")
        sys.exit(1)
    process_quantumultx(Path(sys.argv[1]))