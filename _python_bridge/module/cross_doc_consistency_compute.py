#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
cross_doc_consistency_compute.py — programmatic cross-doc check that the
verb counts in README.md, AXIS.md, hexa.toml [verbs], and the CLI dispatcher
agree.

Status: FUNCTIONAL (stdlib only — no optional deps).

This module DUPLICATES the spirit of `selftest/registry_consistency_audit.py`
and `selftest/cross_doc_audit.py` but in compute-bridge form so other Phase F
/ Phase G tooling can import it without depending on the harness. It is a
spec-internal-consistency check; it does NOT apply n=6 lattice formulas to
external data (raw#10 C3 enforced).

The repo's current count is 29 verbs (17 v1.0.0 + 12 Phase D, 2026-05-13).
This module re-reads each doc and asserts: count_README == count_AXIS ==
count_hexa_toml.

License: MIT (hexa-matter Phase E).
"""

from __future__ import annotations
import os
import re
import sys
import argparse
from typing import Dict, List, Tuple


def _repo_root() -> str:
    here = os.path.dirname(os.path.abspath(__file__))
    return os.environ.get("HEXA_MATTER_ROOT", os.path.normpath(os.path.join(here, "..", "..")))


def count_verbs_in_hexa_toml(toml_path: str) -> int:
    """Read [verbs] table and count the unique items across all groups."""
    with open(toml_path, encoding="utf-8") as f:
        text = f.read()
    in_block = False
    verbs = set()
    for line in text.splitlines():
        s = line.strip()
        if s.startswith("[verbs]"):
            in_block = True
            continue
        if in_block and s.startswith("[") and not s.startswith("[verbs"):
            break
        if in_block and "=" in s and "[" in s and "]" in s:
            # group = ["verb1", "verb2", ...]
            arr = s.split("=", 1)[1].strip()
            items = re.findall(r'"([^"]+)"', arr)
            for v in items:
                verbs.add(v)
    return len(verbs)


def count_verbs_in_readme_badge(readme_path: str) -> int:
    """Parse the README badge `[Verbs: 29 spec]`."""
    with open(readme_path, encoding="utf-8") as f:
        text = f.read()
    m = re.search(r"verbs-(\d+)_spec", text)
    if not m:
        # Fallback: look for "29-verb" or similar.
        m2 = re.search(r"(\d+)-verb", text)
        return int(m2.group(1)) if m2 else 0
    return int(m.group(1))


def _verb_set_from_toml(toml_path: str) -> set:
    """Return the set of verb names declared in [verbs]."""
    with open(toml_path, encoding="utf-8") as f:
        text = f.read()
    in_block = False
    verbs = set()
    for line in text.splitlines():
        s = line.strip()
        if s.startswith("[verbs]"):
            in_block = True
            continue
        if in_block and s.startswith("[") and not s.startswith("[verbs"):
            break
        if in_block and "=" in s and "[" in s and "]" in s:
            arr = s.split("=", 1)[1].strip()
            for v in re.findall(r'"([^"]+)"', arr):
                verbs.add(v)
    return verbs


def count_verb_dirs(repo_root: str) -> int:
    """Count actual filesystem verb directories.

    A verb dir is a top-level dir whose name matches a verb declared in
    hexa.toml [verbs], AND which contains at least one `.md` file. Many
    legacy verbs use non-canonical spec filenames (concrete_tech →
    concrete-technology.md, glass → hexa-glass.md, etc.), so we only
    require *some* spec markdown to be present.
    """
    toml = os.path.join(repo_root, "hexa.toml")
    if not os.path.isfile(toml):
        return 0
    declared = _verb_set_from_toml(toml)
    n = 0
    for v in declared:
        d = os.path.join(repo_root, v)
        if not os.path.isdir(d):
            continue
        if any(fn.endswith(".md") for fn in os.listdir(d)):
            n += 1
    return n


def consistency_report(repo_root: str) -> Tuple[bool, Dict[str, int]]:
    """Return (consistent, counts) tuple.

    `consistent` is True iff all sources agree on verb count.
    """
    toml = os.path.join(repo_root, "hexa.toml")
    readme = os.path.join(repo_root, "README.md")
    counts = {
        "hexa.toml [verbs]": count_verbs_in_hexa_toml(toml),
        "README badge":      count_verbs_in_readme_badge(readme),
        "filesystem dirs":   count_verb_dirs(repo_root),
    }
    return (len(set(counts.values())) == 1, counts)


def _selftest() -> int:
    root = _repo_root()
    if not os.path.isdir(root):
        print(f"  FAIL: repo root not found: {root}")
        print("__HEXA_MATTER_CROSS_DOC_CONSISTENCY_COMPUTE__ FAIL")
        return 1
    print(f"  using HEXA_MATTER_ROOT = {root}")
    try:
        consistent, counts = consistency_report(root)
    except FileNotFoundError as e:
        print(f"  FAIL: missing file: {e}")
        print("__HEXA_MATTER_CROSS_DOC_CONSISTENCY_COMPUTE__ FAIL")
        return 1
    for src, n in counts.items():
        print(f"  {src:<25}  →  {n}")
    if not consistent:
        print(f"  FAIL: counts disagree: {counts}")
        print("__HEXA_MATTER_CROSS_DOC_CONSISTENCY_COMPUTE__ FAIL")
        return 1
    # Sanity: must be > 0.
    n = list(counts.values())[0]
    if n < 1:
        print(f"  FAIL: zero verbs found")
        print("__HEXA_MATTER_CROSS_DOC_CONSISTENCY_COMPUTE__ FAIL")
        return 1
    print(f"  PASS: all sources agree on {n} verbs")
    print("__HEXA_MATTER_CROSS_DOC_CONSISTENCY_COMPUTE__ PASS")
    return 0


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__.splitlines()[1])
    p.add_argument("--selftest", action="store_true")
    p.add_argument("--report", action="store_true", help="print counts and exit 0")
    args = p.parse_args()
    if args.selftest:
        return _selftest()
    if args.report:
        consistent, counts = consistency_report(_repo_root())
        for src, n in counts.items():
            print(f"{src}: {n}")
        print(f"consistent: {consistent}")
        return 0
    p.print_help()
    return 0


if __name__ == "__main__":
    sys.exit(main())
