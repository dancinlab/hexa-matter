#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
metallurgy_alloy_composition.py — weight-% to atomic-% converter and
alloy validity check for MET group specs (superalloy, magnetic-materials,
metallurgy/lutherie).

Status: FUNCTIONAL (stdlib only — no optional deps).

For an alloy with constituents i at weight fraction w_i (Σ w_i = 1) and
atomic mass M_i:

    atomic fraction  x_i  =  (w_i / M_i)  /  Σ_j (w_j / M_j)

Standard atomic masses (IUPAC 2021, kg/kmol = g/mol):
  Cr = 51.996, Fe = 55.845, Ni = 58.693, Co = 58.933, Cu = 63.546,
  Sn = 118.710, Nd = 144.242, Sm = 150.36, B = 10.811, Mo = 95.95,
  Nb = 92.906, Ti = 47.867, Al = 26.982, C  = 12.011, Mn = 54.938,
  Si = 28.085, V  = 50.942, W  = 183.84.

Used by:
  - superalloy/superalloy.md   (Inconel 718: 52.5 Ni / 19 Cr / 18.5 Fe / 5 Nb / 3 Mo / 1 Ti / 0.5 Al, wt-%)
  - magnetic-materials/magnetic-materials.md  (NdFeB Nd2Fe14B, bell-bronze 78 Cu / 22 Sn)
  - lutherie/lutherie.md       (bell-bronze, bronze 88 Cu / 12 Sn)

composition data. Specs cite ASM Handbook / vendor datasheets directly.

License: MIT (hexa-matter Phase E).
"""

from __future__ import annotations
import sys
import argparse
from typing import Dict


# IUPAC standard atomic masses (g/mol, 2021 values).
ATOMIC_MASS: Dict[str, float] = {
    "H":   1.008,   "C":  12.011,   "N":  14.007,   "O":  15.999,
    "Al": 26.982,   "Si": 28.085,   "P":  30.974,   "S":  32.06,
    "Ti": 47.867,   "V":  50.942,   "Cr": 51.996,   "Mn": 54.938,
    "Fe": 55.845,   "Co": 58.933,   "Ni": 58.693,   "Cu": 63.546,
    "Zn": 65.38,    "Ga": 69.723,   "Ge": 72.630,   "As": 74.922,
    "Mo": 95.95,    "Nb": 92.906,   "Sn": 118.710,
    "B":  10.811,   "Nd": 144.242,  "Sm": 150.36,
    "W":  183.84,   "Pt": 195.084,  "Au": 196.967,  "Pb": 207.2,
}


def wt_pct_to_at_pct(wt_pct: Dict[str, float], tol: float = 1e-6) -> Dict[str, float]:
    """Convert wt-% composition to at-% composition.

    wt_pct values are weight percents (must sum to 100 within `tol*100`).
    Returns a dict of atomic percents (sums to 100).
    """
    if not wt_pct:
        raise ValueError("empty composition")
    total = sum(wt_pct.values())
    if abs(total - 100.0) > tol * 100:
        raise ValueError(f"wt-% must sum to 100 (got {total})")

    moles = {}
    for sym, wt in wt_pct.items():
        if sym not in ATOMIC_MASS:
            raise ValueError(f"unknown element symbol: {sym}")
        if wt < 0:
            raise ValueError(f"negative wt-% for {sym}: {wt}")
        moles[sym] = wt / ATOMIC_MASS[sym]
    mole_total = sum(moles.values())
    if mole_total == 0:
        raise ValueError("zero moles total")
    return {sym: 100.0 * m / mole_total for sym, m in moles.items()}


def is_valid_alloy(wt_pct: Dict[str, float]) -> bool:
    """Coarse validity: composition sums to 100 and has >=2 components >0."""
    if not wt_pct:
        return False
    if abs(sum(wt_pct.values()) - 100.0) > 1e-3:
        return False
    nonzero = sum(1 for v in wt_pct.values() if v > 0)
    return nonzero >= 2


def _selftest() -> int:
    # Case 1: bell-bronze 78 Cu / 22 Sn  (lutherie spec).
    # By M_Cu=63.546, M_Sn=118.710: moles_Cu = 78/63.546 = 1.2275;
    # moles_Sn = 22/118.71 = 0.18532; total = 1.4128.
    # → at-% Cu = 86.88, at-% Sn = 13.12 (Sn heavier → at-% < wt-%).
    a = wt_pct_to_at_pct({"Cu": 78.0, "Sn": 22.0})
    if not (86.0 < a["Cu"] < 87.5 and 12.5 < a["Sn"] < 14.0):
        print(f"  FAIL: bell-bronze  Cu_at={a['Cu']:.2f}  Sn_at={a['Sn']:.2f}")
        print("__HEXA_MATTER_METALLURGY_ALLOY_COMPOSITION__ FAIL")
        return 1
    print(f"  PASS: bell-bronze 78Cu/22Sn  →  {a['Cu']:.2f}at-%Cu  {a['Sn']:.2f}at-%Sn")

    # Case 2: Inconel 718 nominal (truncated 3-component version).
    # Ni 52.5 / Cr 19 / Fe 18.5 / Nb 5 / Mo 3 / Ti 1 / Al 0.5 / (sum to 99.5; pad with 0.5 Co)
    inconel = {"Ni": 52.5, "Cr": 19.0, "Fe": 18.5, "Nb": 5.0, "Mo": 3.0, "Ti": 1.0, "Al": 0.5, "Co": 0.5}
    if abs(sum(inconel.values()) - 100.0) > 1e-9:
        print(f"  FAIL: inconel sums to {sum(inconel.values())}, not 100")
        print("__HEXA_MATTER_METALLURGY_ALLOY_COMPOSITION__ FAIL")
        return 1
    a = wt_pct_to_at_pct(inconel)
    if not (50 < a["Ni"] < 55 and 18 < a["Cr"] < 25 and abs(sum(a.values()) - 100.0) < 1e-6):
        print(f"  FAIL: inconel at-%  Ni={a['Ni']}  Cr={a['Cr']}  sum={sum(a.values())}")
        print("__HEXA_MATTER_METALLURGY_ALLOY_COMPOSITION__ FAIL")
        return 1
    print(f"  PASS: Inconel 718  Ni_at={a['Ni']:.2f}  Cr_at={a['Cr']:.2f}  Fe_at={a['Fe']:.2f}")

    # Case 3: validity check.
    if not is_valid_alloy({"Fe": 60.0, "Ni": 40.0}):
        print("  FAIL: 60Fe/40Ni alloy rejected as invalid")
        print("__HEXA_MATTER_METALLURGY_ALLOY_COMPOSITION__ FAIL")
        return 1
    if is_valid_alloy({"Fe": 100.0}):
        print("  FAIL: pure Fe accepted as alloy (needs ≥ 2 components)")
        print("__HEXA_MATTER_METALLURGY_ALLOY_COMPOSITION__ FAIL")
        return 1
    print("  PASS: validity check (60Fe/40Ni accepted, pure Fe rejected)")

    print("__HEXA_MATTER_METALLURGY_ALLOY_COMPOSITION__ PASS")
    return 0


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__.splitlines()[1])
    p.add_argument("--selftest", action="store_true")
    args = p.parse_args()
    if args.selftest:
        return _selftest()
    p.print_help()
    return 0


if __name__ == "__main__":
    sys.exit(main())
