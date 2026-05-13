#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
selftest/novel_verb_xref_audit.py — Phase J.5 NOVEL ↔ verb spec xref audit.

For each of the 7 Tier-1 NOVEL candidates (per NOVEL_ROADMAP.md §5 Tier-1
promotion list), enforces bidirectional cross-link discipline:

  (forward)  NOVEL.md subsection contains `Verb spec link:` line that points
             to the candidate's primary verb-spec home (markdown link form).
  (back)     The linked verb-spec file contains a `Related NOVEL candidate`
             line and the candidate's `hxm-*` ID.

Per LATTICE_POLICY §1.2 / §1.3 / raw#10 C3 + SPEC_FIRST: cross-link
annotations are nav links, NOT promotion to EXTERNAL-VERIFIED. UNPROVEN /
UNVERIFIED markers stay untouched. Gate is purely structural.

stdlib-only. Exit 0 PASS / 1 FAIL.

Sentinel: `__HEXA_MATTER_NOVEL_VERB_XREF__ PASS (7/7 Tier-1 linked,
0 broken)` on success.
"""
from __future__ import annotations

import os
import re
import sys

REPO_ROOT = os.environ.get("HEXA_MATTER_ROOT") or os.path.dirname(
    os.path.dirname(os.path.abspath(__file__))
)

# 7 Tier-1 candidates with their primary verb-spec home(s).
# Each entry: candidate_id -> tuple of verb-spec relative paths.
# Multi-home (pv-tandem) lists both primary and secondary.
TIER1: dict[str, tuple[str, ...]] = {
    "hxm-pv-tandem-002": (
        "perovskite/perovskite.md",
        "silicon/silicon.md",
    ),
    "hxm-bat-cath-drx-001": ("electrode-material/electrode-material.md",),
    "hxm-bat-anode-li-metal-001": ("electrode-material/electrode-material.md",),
    "hxm-co2-cap-mof-mfm-002": ("mof/mof.md",),
    "hxm-te-half-zrnisn-001": ("metallurgy/swordsmithing.md",),
    "hxm-cement-mgo-co2neg-001": ("concrete_tech/concrete-technology.md",),
    "hxm-h2-elec-iro2-doped-001": ("electrode-material/electrode-material.md",),
}

NOVEL = os.path.join(REPO_ROOT, "NOVEL.md")

# Section header pattern within NOVEL.md (e.g., `### 4.A.1 Title` or
# `#### 4.B.1 Title` or `### 3.7 Title`).
SECTION_RE = re.compile(r"^#{2,4}\s+(\d+\.[A-Z]?(?:\.\d+)?)\s+")

# Verb-spec link line pattern (within risk-flags paragraph).
VERBLINK_RE = re.compile(
    r"\*\*Verb spec link\*\*[^\n]*?\[`([^`]+\.md)`\]\(([^)]+\.md)\)"
)


def read(path: str) -> str:
    with open(path, "r", encoding="utf-8", errors="ignore") as fh:
        return fh.read()


def find_candidate_section(text: str, cid: str) -> tuple[str, int, int] | None:
    """Return (section_id, start_line, end_line) of the subsection containing cid.

    Walks NOVEL.md top-down, tracking the most recent section header. When the
    line containing `cid` (in a row) is hit, returns the enclosing section.
    """
    lines = text.splitlines()
    cur_section = None
    cur_start = None
    cid_line = None
    next_section_line = None
    for idx, line in enumerate(lines):
        sm = SECTION_RE.match(line)
        if sm:
            if cid_line is not None and cur_section is not None:
                # We previously found cid; now this is the next section header.
                next_section_line = idx
                return (cur_section, cur_start or 0, next_section_line)
            cur_section = sm.group(1)
            cur_start = idx
        # Look for the row that introduces the candidate ID. The token must
        # appear inside backticks as a leading-row identifier (avoid matching
        # cross-references in body prose).
        if cid_line is None and f"`{cid}`" in line:
            # Confirm we found the table row, not a parenthetical mention —
            # the candidate row always starts with `| `<id>` |`.
            stripped = line.lstrip()
            if stripped.startswith("|") and f"`{cid}`" in stripped:
                cid_line = idx
    # If we hit EOF after finding cid, return up to end-of-file.
    if cid_line is not None and cur_section is not None:
        return (cur_section, cur_start or 0, len(lines))
    return None


def main() -> int:
    print("hexa-matter/selftest/novel_verb_xref_audit — NOVEL ↔ verb spec xref")
    print(f"  root: {REPO_ROOT}\n")

    if not os.path.exists(NOVEL):
        print("  [FAIL] NOVEL.md missing")
        print("__HEXA_MATTER_NOVEL_VERB_XREF__ FAIL  (NOVEL.md missing)")
        return 1

    novel_text = read(NOVEL)
    fail = 0
    linked_ok = 0

    for cid, verb_paths in TIER1.items():
        # (forward) find the candidate's subsection and verify Verb spec link line.
        sect = find_candidate_section(novel_text, cid)
        if sect is None:
            print(f"  [FAIL] {cid}: NOT FOUND in NOVEL.md")
            fail += 1
            continue
        section_id, s, e = sect
        sub = "\n".join(novel_text.splitlines()[s:e])
        if "Verb spec link" not in sub:
            print(f"  [FAIL] {cid} (§{section_id}): missing `Verb spec link:` line")
            fail += 1
            continue
        # Confirm each expected verb-spec path is linked (forward direction).
        forward_ok = True
        for vp in verb_paths:
            if vp not in sub:
                print(f"  [FAIL] {cid} (§{section_id}): forward link to `{vp}` missing")
                fail += 1
                forward_ok = False
        if not forward_ok:
            continue

        # (back) verify each verb-spec file mentions this cid + has 'Related NOVEL candidate'
        back_ok = True
        for vp in verb_paths:
            vp_abs = os.path.join(REPO_ROOT, vp)
            if not os.path.exists(vp_abs):
                print(f"  [FAIL] {cid}: verb spec `{vp}` does not exist on disk")
                fail += 1
                back_ok = False
                continue
            vtext = read(vp_abs)
            if "Related NOVEL candidate" not in vtext:
                print(f"  [FAIL] {cid}: `{vp}` missing `Related NOVEL candidate` line")
                fail += 1
                back_ok = False
                continue
            if cid not in vtext:
                print(f"  [FAIL] {cid}: `{vp}` does NOT mention this candidate ID")
                fail += 1
                back_ok = False
        if back_ok:
            print(f"  [PASS] {cid} (§{section_id}) ↔ {', '.join(verb_paths)}")
            linked_ok += 1

    print()
    n = len(TIER1)
    if fail > 0:
        print(
            f"__HEXA_MATTER_NOVEL_VERB_XREF__ FAIL  "
            f"({linked_ok}/{n} Tier-1 linked, {fail} broken)"
        )
        return 1
    print(
        f"__HEXA_MATTER_NOVEL_VERB_XREF__ PASS  "
        f"({linked_ok}/{n} Tier-1 linked, 0 broken)"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
