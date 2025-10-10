#!/usr/bin/env python3

import re
import sys
from pathlib import Path

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

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python Stash.py <file>")
        sys.exit(1)
    process_stash(Path(sys.argv[1]))