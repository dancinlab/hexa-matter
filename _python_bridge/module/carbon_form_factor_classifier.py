#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
carbon_form_factor_classifier.py — coarse classifier for carbon allotrope
form factors (activated / graphite / CNT / diamond / fullerene / glassy /
pyrolytic / fiber).

Status: FUNCTIONAL (stdlib core) · PARTIAL with RDKit (SMILES path).

Backs the `carbon/` verb (Phase D, 2026-05-13). Carbon ships 7 form factors:
  - activated carbon (porous, high surface area)
  - graphite (sp² layers)
  - pyrolytic carbon (oriented graphite)
  - carbon fiber (high modulus / high strength PAN-derived)
  - CNT (single-wall / multi-wall; 80 GPa lab-mm, UNVERIFIED at production scale)
  - diamond (sp³, Mohs 10)
  - fullerene (C60, C70 closed cages)
  - glassy carbon (random sp²)

Honest C3: CNT 80 GPa caveat from `selftest/carbon_cnt_strength_honesty_audit.py`
is PRESERVED — this module does NOT claim production-scale CNT strength.
It only classifies form-factor identity by structural descriptor.

n=6 lattice formulas to vendor carbon-grade data.

License: MIT (hexa-matter Phase E).
"""

from __future__ import annotations
import sys
import argparse
from typing import Optional


# Form-factor identity keywords (string-based classification on the
# spec's free-text descriptor). Coarse but deterministic.
_KEYWORDS = {
    "diamond":    ["diamond", "sp3", "lonsdaleite"],
    "graphite":   ["graphite", "graphene", "sp2 layer", "hexagonal layer"],
    "cnt":        ["cnt", "carbon nanotube", "swcnt", "mwcnt", "nanotube"],
    "fullerene":  ["c60", "c70", "buckminster", "fullerene"],
    "fiber":      ["carbon fiber", "pan-derived", "high-modulus carbon", "high-strength carbon"],
    "activated":  ["activated carbon", "activated charcoal", "porous carbon"],
    "pyrolytic":  ["pyrolytic", "pyrolyzed"],
    "glassy":     ["glassy carbon", "vitreous carbon", "amorphous carbon"],
}


def classify_by_descriptor(descriptor: str) -> Optional[str]:
    """Classify a free-text descriptor into one of the carbon form factors.

    Returns the form-factor key or None if no match. Lowercase + substring.
    """
    if not descriptor or not isinstance(descriptor, str):
        return None
    d = descriptor.lower()
    # Order matters: more specific first.
    for form in ("cnt", "fullerene", "diamond", "fiber", "pyrolytic",
                 "glassy", "activated", "graphite"):
        for kw in _KEYWORDS[form]:
            if kw in d:
                return form
    return None


def classify_by_smiles(smiles: str) -> Optional[str]:
    """Optional RDKit-backed classification. SKIPs cleanly without RDKit."""
    try:
        from rdkit import Chem  # noqa: F401
    except ImportError:
        return None  # SKIP path
    # If RDKit is present, validate the SMILES is parseable as a carbon-only
    # structure. We do NOT attempt to disambiguate CNT from graphite from
    # diamond at SMILES level — that requires periodic structure (CIF/XYZ).
    from rdkit import Chem
    mol = Chem.MolFromSmiles(smiles)
    if mol is None:
        return None
    # Pure-carbon check.
    syms = {a.GetSymbol() for a in mol.GetAtoms()}
    if syms == {"C"}:
        return "pure-carbon-smiles-validated"
    return None


def _selftest() -> int:
    cases = [
        ("Multi-wall CNT yarn (lab mm-scale 80 GPa UNVERIFIED at production)", "cnt"),
        ("CVD diamond wafer (Mohs 10)",                                       "diamond"),
        ("PAN-derived carbon fiber T700S",                                    "fiber"),
        ("Buckminsterfullerene C60 cage",                                     "fullerene"),
        ("Activated charcoal coconut-shell 1500 m²/g",                        "activated"),
        ("Pyrolytic graphite oriented",                                       "pyrolytic"),
        ("Glassy carbon vitreous",                                            "glassy"),
        ("Bulk graphite electrode HOPG",                                      "graphite"),
        ("",                                                                   None),
        ("random irrelevant text",                                            None),
    ]
    for desc, expected in cases:
        got = classify_by_descriptor(desc)
        if got != expected:
            print(f"  FAIL: descriptor={desc!r}  expected={expected}  got={got}")
            print("__HEXA_MATTER_CARBON_FORM_FACTOR_CLASSIFIER__ FAIL")
            return 1
        tag = "PASS" if got else "PASS (no-match)"
        print(f"  {tag}: {desc[:60]!r:<62} → {got}")

    # Optional RDKit path (SKIP cleanly if missing).
    try:
        import rdkit  # noqa: F401
        result = classify_by_smiles("c1ccccc1")  # benzene, pure-C
        if result != "pure-carbon-smiles-validated":
            print(f"  FAIL: rdkit SMILES path expected pure-carbon-smiles-validated, got {result}")
            print("__HEXA_MATTER_CARBON_FORM_FACTOR_CLASSIFIER__ FAIL")
            return 1
        print(f"  PASS: RDKit SMILES path validated benzene as pure-carbon")
    except ImportError:
        print(f"  SKIP: rdkit not installed (RDKit SMILES path)")

    print("__HEXA_MATTER_CARBON_FORM_FACTOR_CLASSIFIER__ PASS")
    return 0


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__.splitlines()[1])
    p.add_argument("--selftest", action="store_true")
    p.add_argument("--descriptor", default=None, help="classify a free-text descriptor")
    args = p.parse_args()
    if args.selftest:
        return _selftest()
    if args.descriptor:
        print(f"{classify_by_descriptor(args.descriptor)}")
        return 0
    p.print_help()
    return 0


if __name__ == "__main__":
    sys.exit(main())
