#!/usr/bin/env python3

import json
import ipaddress
import re
import sys
from pathlib import Path
from collections import defaultdict
from typing import Iterable, Iterator, Tuple, Callable, List

RE_INLINE_COMMENT = re.compile(r'(?<!:)//.*$')

STASH_DOMAIN_NAME = re.compile(r"^(AdBlock|Advertising|GreatFireWall|DIRECT|PROXY|REJECT)$")
STASH_IPCIDR_NAME = re.compile(r"^(CNCIDR|CNCIDR4|CNCIDR6)$")

ORDER_TYPE = [
    "DOMAIN", "DOMAIN-SUFFIX", "DOMAIN-KEYWORD", "DOMAIN-WILDCARD",
    "IP-CIDR", "IP-CIDR6", "IP-ASN", "GEOIP"
]
ORDER_MAP = {rule: index for index, rule in enumerate(ORDER_TYPE)}

EGERN_TYPE_MAP = {
    "DOMAIN": "domain_set",
    "DOMAIN-SUFFIX": "domain_suffix_set",
    "DOMAIN-KEYWORD": "domain_keyword_set",
    "DOMAIN-WILDCARD": "domain_wildcard_set",
    "IP-CIDR": "ip_cidr_set",
    "IP-CIDR6": "ip_cidr6_set",
    "IP-ASN": "asn_set",
    "GEOIP": "geoip_set"
}

QUANTUMULTX_TYPE_MAP = {
    "DOMAIN": "HOST",
    "IP-CIDR6": "IP6-CIDR"
}

SINGBOX_TYPE_MAP = {
    "DOMAIN": "domain",
    "DOMAIN-SUFFIX": "domain_suffix",
    "DOMAIN-KEYWORD": "domain_keyword",
    "IP-CIDR": "ip_cidr",
    "IP-CIDR6": "ip_cidr"
}

def error_exit(message: str) -> None:
    print(f"[ERROR] {message}")
    sys.exit(1)

def rules_read(file_path: Path) -> Iterator[str]:
    sub = RE_INLINE_COMMENT.sub
    with file_path.open("r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            if "//" in line:
                line = sub("", line).strip()
                if not line:
                    continue
            yield line

def rules_type(lines: Iterable[str]) -> Iterator[str]:
    ip_network = ipaddress.ip_network
    prefix_map = {4: "IP-CIDR", 6: "IP-CIDR6"}
    for line in lines:
        line = line.strip()
        try:
            network = ip_network(line, strict=False)
            yield f"{prefix_map[network.version]},{network}"
        except ValueError:
            yield line

def _get_order_key(line: str) -> str:
    return line.partition(",")[2]
def rules_order(lines: Iterable[str], unknown_rule: bool = False) -> Iterator[str]:
    rules_all = [
        (ORDER_MAP.get(line.partition(",")[0], len(ORDER_TYPE)), line)
        for line in lines
    ]
    rules_all.sort(key=lambda x: (x[0], _get_order_key(x[1])))
    seen = set()
    for type_index, rule in rules_all:
        rule_lower = rule.lower()
        if rule_lower in seen:
            continue
        if type_index == len(ORDER_TYPE) and not unknown_rule:
            continue
        seen.add(rule_lower)
        yield rule

def rules_parse(lines: Iterator[str]) -> Iterator[Tuple[str, str, str]]:
    for line in lines:
        parts = line.strip().split(",", 2)
        style, value, field = (parts + [""] * 3)[:3]
        yield style, value, field

def rules_write(file_path: Path, rule_name: str, rule_count: int, rules: Iterable[str]) -> None:
    with file_path.open("w", encoding="utf-8", newline="") as f:
        f.write(f"# 规则名称: {rule_name}\n")
        f.write(f"# 规则统计: {rule_count}\n\n")
        f.writelines(f"{line}\n" for line in rules)

def process_egern(file_path: Path) -> None:
    rule_name = file_path.stem
    lines: Iterable[str] = rules_order(rules_type(rules_read(file_path)))
    rule_data: dict[str, list[str]] = defaultdict(list)
    no_resolve = False
    for style, value, field in rules_parse(lines):
        if not style:
            continue
        key = EGERN_TYPE_MAP.get(style)
        if not key:
            continue
        if field == "no-resolve":
            no_resolve = True
        if key == "domain_wildcard_set":
            value = f'"{value}"'
        rule_data[key].append(value)
    output: List[str] = []
    if no_resolve:
        output.append("no_resolve: true")
    for key, values in rule_data.items():
        if not values:
            continue
        output.append(f"{key}:")
        output.extend(f"  - {v}" for v in values)
    rule_count = sum(len(values) for values in rule_data.values())
    rules_write(file_path, rule_name, rule_count, output)
    print(f"[INFO] Processed (Egern) {file_path}")

def process_quantumultx(file_path: Path) -> None:
    rule_name = file_path.stem
    lines: Iterable[str] = rules_order(rules_type(rules_read(file_path)))
    output: List[str] = []
    for style, value, field in rules_parse(lines):
        if not style:
            continue
        for original, new in QUANTUMULTX_TYPE_MAP.items():
            if style.startswith(original):
                style = new + style[len(original):]
                break
        output.append(f"{style},{value},{rule_name}")
    rules_write(file_path, rule_name, len(output), output)
    print(f"[INFO] Processed (QuantumultX) {file_path}")

def process_singbox(file_path: Path) -> None:
    rule_name = file_path.stem
    lines: Iterable[str] = rules_order(rules_type(rules_read(file_path)))
    rule_data: dict[str, list[str]] = defaultdict(list)
    for style, value, field in rules_parse(lines):
        if not style:
            continue
        key = SINGBOX_TYPE_MAP.get(style)
        if not key:
            continue
        rule_data[key].append(value)
    rules_list = [{key: values} for key, values in rule_data.items() if values]
    output = {"version": 3, "rules": rules_list}
    with file_path.open("w", encoding="utf-8", newline="") as f:
        json.dump(output, f, indent=2, ensure_ascii=False)
        f.write("\n")
    print(f"[INFO] Processed (Singbox) {file_path}")

def process_stash(file_path: Path) -> None:
    rule_name = file_path.stem
    lines: Iterable[str] = rules_order(rules_type(rules_read(file_path)))
    output: List[str] = ["payload:"]
    is_domain = STASH_DOMAIN_NAME.match(rule_name)
    is_ipcidr = STASH_IPCIDR_NAME.match(rule_name)
    for style, value, field in rules_parse(lines):
        if not style:
            continue
        if is_domain:
            if style == "DOMAIN-SUFFIX":
                value = f"+.{value}"
            formatted = f"  - '{value}'"
        elif is_ipcidr:
            formatted = f"  - '{value}'"
        else:
            formatted = f"  - {style},{value}" + (f",{field}" if field else "")
        output.append(formatted)
    rules_write(file_path, rule_name, sum(line.startswith("  - ") for line in output), output)
    print(f"[INFO] Processed (Stash) {file_path}")

def process_surge(file_path: Path) -> None:
    rule_name = file_path.stem
    lines: Iterable[str] = rules_order(rules_type(rules_read(file_path)))
    output: List[str] = list(lines)
    rules_write(file_path, rule_name, len(output), output)
    print(f"[INFO] Processed (Surge) {file_path}")

def main() -> None:
    if len(sys.argv) < 3:
        error_exit("USAGE: python Build.py <platform> <file_or_dir>")
    platform = sys.argv[1].lower()
    file_path = Path(sys.argv[2])
    platform_map: dict[str, Callable[[Path], None]] = {
        "egern": process_egern,
        "quantumultx": process_quantumultx,
        "singbox": process_singbox,
        "stash": process_stash,
        "surge": process_surge
    }
    process_func = platform_map.get(platform)
    if not process_func:
        error_exit(f"Unknown platform: {platform}")
    files_to_process: List[Path] = []
    if file_path.is_file():
        if platform == "singbox" and file_path.suffix != ".json":
            error_exit(f"Singbox only supports JSON files: {file_path.suffix}")
        files_to_process = [file_path]
    elif file_path.is_dir():
        if platform == "singbox":
            files_to_process = sorted(file_path.glob("*.json"))
        else:
            files_to_process = sorted(f for f in file_path.iterdir() if f.is_file())
    else:
        error_exit(f"{file_path} not found or unsupported type.")
    if not files_to_process:
        print(f"[INFO] No supported files found in: {file_path}")
        return
    print(f"[INFO] Platform: {platform}")
    print(f"[INFO] Found {len(files_to_process)} file(s) in: {file_path}")
    for f in files_to_process:
        try:
            process_func(f)
        except Exception as e:
            print(f"[ERROR] Failed to process {f}: {e}")
    print("[INFO] Processing completed.")

if __name__ == "__main__":
    main()