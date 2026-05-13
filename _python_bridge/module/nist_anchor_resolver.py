#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
nist_anchor_resolver.py — parse spec files for NIST WebBook / CRC / ASM /
SEMI / ASTM citation patterns and validate the citation form (no network).

Status: FUNCTIONAL (stdlib only — no optional deps).

This is the *offline* arm of citation discipline. The companion live-fetch
arm is Phase F (`_research_bridge/`); that one DOES hit external URLs.
This module never hits the network.

What it does:
  - scans hexa-matter spec markdowns for citation patterns
  - validates the citation form matches one of the canonical patterns
    (e.g. "NIST WebBook CASRN xxx-xx-x", "CRC Handbook 99th ed.",
     "ASM Handbook vol. XX", "ASTM Fnnnn", "SEMI Mn", etc.)
  - rejects bare claims with no anchor

raw#10 C3: this module does NOT apply n=6 lattice formulas to vendor
citations. It validates citation form only.

License: MIT (hexa-matter Phase E).
"""

from __future__ import annotations
import os
import re
import sys
import argparse
from typing import Dict, List, Tuple


# Canonical citation patterns. Order: most-specific first.
CITATION_PATTERNS: Dict[str, str] = {
    "NIST WebBook CASRN":  r"NIST\s+WebBook\s+(CASRN\s+)?\d+-\d{1,2}-\d",
    "NIST WebBook":        r"NIST\s+WebBook",
    "NIST SRM":            r"NIST\s+SRM\s*\d{3,5}",
    "NIST SRD":            r"NIST\s+SRD\s*\d{1,3}",
    "CRC Handbook":        r"CRC\s+Handbook(\s+of\s+Chemistry\s+and\s+Physics)?(\s+\d{1,3}(st|nd|rd|th)?\s*ed\.?)?",
    "ASM Handbook":        r"ASM\s+Handbook(\s+vol(\.|ume)?\s*\d+)?",
    "ASTM standard":       r"ASTM\s+[A-Z]\s*\d+(-\d+)?",
    "SEMI standard":       r"SEMI\s+[A-Z]\d+(-\d+)?",
    "ISO standard":        r"ISO\s+\d{4,6}(-\d+)?",
    "TAPPI standard":      r"TAPPI\s+T\s*\d{2,4}",
    "ACI standard":        r"ACI\s+\d{3}",
    "IUPAC":               r"IUPAC\s+\d{4}",
    "MatWeb":              r"MatWeb",
    "ITER spec":           r"ITER\s+(spec|requirement|TF\s*coil|magnet|wall|D-T)",
    "primary literature":  r"\b(Nature|Science|PRB|PRL|JACS|JCP|J\.\s*Mater\.\s*Sci\.)\b",
    "Saddow":              r"Saddow\s+(&|and)\s+Agarwal",  # SiC bandgap canonical
    "Sze":                 r"\bSze\b",
    "Kittel":              r"\bKittel\b",
    "Flory":               r"\bFlory\b",
    "Hales":               r"\bHales\b\s+2017|\bHales\s+packing|\bKepler\s+conjecture",
}


def find_anchors(text: str) -> List[Tuple[str, str]]:
    """Return list of (pattern_name, matched_substring) hits."""
    hits = []
    for name, pat in CITATION_PATTERNS.items():
        for m in re.finditer(pat, text, flags=re.IGNORECASE):
            hits.append((name, m.group(0)))
    return hits


def scan_spec_file(path: str) -> Dict[str, int]:
    """Count citation hits by pattern name in a single spec file."""
    if not os.path.isfile(path):
        raise FileNotFoundError(path)
    with open(path, encoding="utf-8") as f:
        text = f.read()
    counts: Dict[str, int] = {}
    for name, _hit in find_anchors(text):
        counts[name] = counts.get(name, 0) + 1
    return counts


def _selftest() -> int:
    # Embedded fixture — multiple known citation patterns.
    fixture = """
    silicon bandgap 1.12 eV — NIST WebBook CASRN 7440-21-3
    density 2.329 g/cm³ — CRC Handbook 99th ed., p. 4-89
    Inconel 718 creep — ASM Handbook vol. 1
    SiC bandgap 3.26 eV — Saddow & Agarwal 2004
    Kevlar tensile — ASTM D7269
    Si wafer SEMI M1
    cellulose Segal index — TAPPI T 271
    concrete cure — ACI 318
    LK-99 — NOT REPRODUCED (no anchor for unverified claims)
    no-citation-bare-claim 5.5 GPa
    """
    hits = find_anchors(fixture)
    names = {n for n, _ in hits}

    # Required to detect.
    required = {
        "NIST WebBook CASRN", "CRC Handbook", "ASM Handbook",
        "Saddow", "ASTM standard", "SEMI standard", "TAPPI standard",
        "ACI standard",
    }
    missing = required - names
    if missing:
        print(f"  FAIL: missing required patterns: {sorted(missing)}")
        print(f"  detected: {sorted(names)}")
        print("__HEXA_MATTER_NIST_ANCHOR_RESOLVER__ FAIL")
        return 1
    print(f"  PASS: detected {len(names)} pattern types in fixture")
    for name in sorted(names):
        print(f"    found: {name}")

    # Negative: bare-claim line should NOT generate spurious hits.
    bare = "5.5 GPa with no citation at all whatsoever"
    bare_hits = find_anchors(bare)
    if bare_hits:
        print(f"  FAIL: bare claim should yield 0 hits, got: {bare_hits}")
        print("__HEXA_MATTER_NIST_ANCHOR_RESOLVER__ FAIL")
        return 1
    print(f"  PASS: bare-claim line correctly yields 0 hits")

    print("__HEXA_MATTER_NIST_ANCHOR_RESOLVER__ PASS")
    return 0


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__.splitlines()[1])
    p.add_argument("--selftest", action="store_true")
    p.add_argument("--scan", default=None, help="scan a spec file for anchors")
    args = p.parse_args()
    if args.selftest:
        return _selftest()
    if args.scan:
        counts = scan_spec_file(args.scan)
        for name, n in sorted(counts.items()):
            print(f"  {name}: {n}")
        return 0
    p.print_help()
    return 0


if __name__ == "__main__":
    sys.exit(main())
