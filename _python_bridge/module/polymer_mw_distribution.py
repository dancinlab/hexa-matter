#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
polymer_mw_distribution.py — polymer molecular-weight distribution
arithmetic (PDI, M_n, M_w, M_z) from per-chain length distribution.

Status: FUNCTIONAL (stdlib only — no optional deps).

Closes a tiny but load-bearing utility for the POL group (polymer
chemistry — aramid, epoxy, nylon, PET, elastomer, adhesive,
biodegradable-plastics, liquid-crystal, PCM, PSA).

Definitions (Flory, Principles of Polymer Chemistry, 1953):
  M_n  =  Σ N_i M_i  /  Σ N_i            (number-average MW)
  M_w  =  Σ N_i M_i²  /  Σ N_i M_i       (weight-average MW)
  M_z  =  Σ N_i M_i³  /  Σ N_i M_i²      (z-average MW)
  PDI  =  M_w / M_n                       (polydispersity index)

Most-probable / Flory-Schulz distribution: PDI → 2.
Anionic / living polymerization (Poisson): PDI → 1 + 1/X_n ≈ 1.
Step-growth at full conversion: PDI → 1 + p where p is degree of polymerization.

lattice formulas to vendor MWD GPC data. Spec validity check only.

License: MIT (hexa-matter Phase E).
"""

from __future__ import annotations
import sys
import argparse
from typing import Sequence, Tuple


def moments(N: Sequence[float], M: Sequence[float]) -> Tuple[float, float, float, float]:
    """Compute (M_n, M_w, M_z, PDI) from chain-count N_i at mass M_i."""
    if len(N) != len(M):
        raise ValueError(f"len mismatch N={len(N)} M={len(M)}")
    if not N:
        raise ValueError("empty distribution")
    if any(n < 0 for n in N):
        raise ValueError("negative chain counts")
    if any(m <= 0 for m in M):
        raise ValueError("non-positive molecular weights")

    s0 = sum(N)
    s1 = sum(n * m for n, m in zip(N, M))
    s2 = sum(n * m * m for n, m in zip(N, M))
    s3 = sum(n * m * m * m for n, m in zip(N, M))

    if s0 == 0 or s1 == 0 or s2 == 0:
        raise ValueError("zero moment denominator")

    Mn = s1 / s0
    Mw = s2 / s1
    Mz = s3 / s2
    PDI = Mw / Mn
    return Mn, Mw, Mz, PDI


def _selftest() -> int:
    # Case 1: monodisperse — PDI must be exactly 1.0.
    Mn, Mw, Mz, PDI = moments([100.0], [50_000.0])
    if not (abs(PDI - 1.0) < 1e-12 and Mn == 50_000.0):
        print(f"  FAIL: monodisperse  PDI={PDI}  Mn={Mn}")
        print("__HEXA_MATTER_POLYMER_MW_DISTRIBUTION__ FAIL")
        return 1
    print(f"  PASS: monodisperse  Mn={Mn}  PDI={PDI}")

    # Case 2: Flory-Schulz approximation (small toy).
    # PDI for ideal step-growth at conversion p approaches 2.
    # Toy: two equal populations at M=1000 and M=2000.
    Mn, Mw, Mz, PDI = moments([10.0, 10.0], [1000.0, 2000.0])
    expected_Mn = 1500.0
    if not (abs(Mn - expected_Mn) < 1e-9 and 1.05 < PDI < 1.15):
        print(f"  FAIL: bidisperse  Mn={Mn} (expect 1500)  PDI={PDI} (expect ~1.11)")
        print("__HEXA_MATTER_POLYMER_MW_DISTRIBUTION__ FAIL")
        return 1
    print(f"  PASS: bidisperse  Mn={Mn}  Mw={Mw:.1f}  PDI={PDI:.4f}")

    # Case 3: ordering Mz >= Mw >= Mn (always true by Cauchy-Schwarz).
    Mn, Mw, Mz, PDI = moments([100, 50, 20, 5], [1000, 5000, 20000, 100000])
    if not (Mz >= Mw >= Mn > 0):
        print(f"  FAIL: ordering  Mn={Mn}  Mw={Mw}  Mz={Mz}")
        print("__HEXA_MATTER_POLYMER_MW_DISTRIBUTION__ FAIL")
        return 1
    print(f"  PASS: ordering  Mn={Mn:.1f}  Mw={Mw:.1f}  Mz={Mz:.1f}  PDI={PDI:.3f}")

    print("__HEXA_MATTER_POLYMER_MW_DISTRIBUTION__ PASS")
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
