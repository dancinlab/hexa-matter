#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
silicon_purity_compute.py — purity nomenclature converter for silicon
feedstock specs (Si-L1 9N anchor).

Status: FUNCTIONAL (stdlib only — no optional deps).

Closes a tiny but load-bearing utility for the silicon verb: converting
between the industry "nN" purity nomenclature (e.g. "9N" = 99.9999999%),
the atomic fraction of impurities, and ppba (parts per billion atomic).

  nN  →  purity fraction   p   =  1 - 10^(-n)
  ppba                     =  (1 - p) * 1e9
  ppma                     =  (1 - p) * 1e6

Si-L1 (from `silicon/silicon.md` and `LIMIT_BREAKTHROUGH.md`):
  electronic-grade poly-Si  =  9N  →  1 ppba impurity ceiling (SOFT wall;
  process + measurement bound, not a fundamental physical wall — bond-energy
  HARD wall is Si-L5 melting point 1687 K).

This is a SPEC-CONSISTENCY compute path, not a measurement. The repo does
not own a mass-spec readout; vendor data (Wacker / GCL / Hemlock) carries
that layer. We only validate that the spec's nN ↔ ppba arithmetic is
internally self-consistent.

data. It is purely the arithmetic identity nN ↔ ppba.

License: MIT (hexa-matter Phase E).
"""

from __future__ import annotations
import sys
import argparse


def nN_to_purity_fraction(n: float) -> float:
    """nN nomenclature → purity fraction in [0, 1).

    9N  → 0.999999999  (nine nines)
    11N → 0.99999999999
    """
    if n <= 0:
        raise ValueError(f"nN must be positive (got {n})")
    return 1.0 - 10.0 ** (-n)


def purity_fraction_to_ppba(p: float) -> float:
    """purity fraction → ppba impurity (parts per billion atomic)."""
    if not (0.0 <= p < 1.0):
        raise ValueError(f"purity fraction must be in [0,1) (got {p})")
    return (1.0 - p) * 1e9


def nN_to_ppba(n: float) -> float:
    """Direct: nN → ppba.  9N → 1 ppba.  11N → 0.01 ppba."""
    return purity_fraction_to_ppba(nN_to_purity_fraction(n))


def _selftest() -> int:
    cases = [
        # (nN, expected ppba, label)
        (6, 1000.0, "6N (solar-grade Siemens upstream)"),
        (9, 1.0, "9N (Si-L1 electronic-grade poly-Si SOFT wall)"),
        (11, 0.01, "11N (research-grade isotope-separated Si-28)"),
    ]
    for n, expected, label in cases:
        got = nN_to_ppba(n)
        # Tolerance must account for IEEE-754 representation of 10^(-n);
        # relative tolerance 1e-6 is well within "9N means 1 ppba" engineering use.
        if abs(got - expected) / expected > 1e-6:
            print(f"  FAIL: {label}  nN={n}  expected={expected}  got={got}")
            print("__HEXA_MATTER_SILICON_PURITY_COMPUTE__ FAIL")
            return 1
        print(f"  PASS: {label}  nN={n}  ppba={got:.6g}")

    # Sanity: monotonic decrease in ppba as nN increases.
    prev = float("inf")
    for n in (3, 6, 9, 11, 13):
        p = nN_to_ppba(n)
        if p >= prev:
            print(f"  FAIL: non-monotonic at nN={n}  ppba={p}  prev={prev}")
            print("__HEXA_MATTER_SILICON_PURITY_COMPUTE__ FAIL")
            return 1
        prev = p

    print("__HEXA_MATTER_SILICON_PURITY_COMPUTE__ PASS")
    return 0


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__.splitlines()[1])
    p.add_argument("--selftest", action="store_true", help="run built-in selftest")
    p.add_argument("--nN", type=float, default=None, help="nN purity → ppba")
    args = p.parse_args()

    if args.selftest:
        return _selftest()
    if args.nN is not None:
        print(f"nN={args.nN}  →  ppba={nN_to_ppba(args.nN):.6g}")
        return 0
    p.print_help()
    return 0


if __name__ == "__main__":
    sys.exit(main())
