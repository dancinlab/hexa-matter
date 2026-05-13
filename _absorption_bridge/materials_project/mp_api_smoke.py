#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
mp_api_smoke.py — Materials Project API adapter (smoke, offline replay).

Status: PARTIAL (offline fixture replay PASS; live API SKIPs without mp-api).

Two paths:
  1. Offline (`--selftest`): load `cache/sample_response.json`, validate schema
     (material_id, formula, structure.lattice.a, etc.), emit sentinel. Always
     offline; deterministic.
  2. Live (`--mp-id mp-XXX`, optional): if `mp-api` is installed AND the
     `MP_API_KEY` env var is set, fetch the requested record. NOT exercised in
     --selftest (per `NO LIVE API CALLS in selftest` rule from INIT.md Phase G).

The selftest never hits the network. The cache fixture is bundled.

raw#10 C3: this adapter does NOT apply n=6 lattice formulas to MP data.
It only validates schema + passes through the record.

Optional dep: mp-api >= 0.41.0  (`pip install mp-api`)
License: MIT (hexa-matter Phase G).
"""

from __future__ import annotations
import argparse
import hashlib
import json
import os
import sys
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
CACHE_DIR = HERE / "cache"
SAMPLE_FIXTURE = CACHE_DIR / "sample_response.json"


def _have_mp_api() -> bool:
    try:
        import mp_api  # noqa: F401
        return True
    except ImportError:
        return False


def load_fixture(path: Path = SAMPLE_FIXTURE) -> dict:
    """Load the bundled sample fixture. Offline-only."""
    with open(path, "r", encoding="utf-8") as f:
        return json.load(f)


def validate_mp_record(rec: dict) -> tuple[bool, str]:
    """Schema-validate a Materials Project record (or fixture).

    Returns (ok, reason). Required fields: material_id, formula_pretty,
    elements, nsites, structure.lattice.a.
    """
    required = ["material_id", "formula_pretty", "elements", "nsites", "structure"]
    for k in required:
        if k not in rec:
            return False, f"missing required field: {k}"
    if not isinstance(rec["material_id"], str) or not rec["material_id"].startswith("mp-"):
        return False, f"material_id not mp-XXX format: {rec.get('material_id')!r}"
    if "lattice" not in rec["structure"] or "a" not in rec["structure"]["lattice"]:
        return False, "structure.lattice.a missing"
    a = rec["structure"]["lattice"]["a"]
    if not isinstance(a, (int, float)) or a <= 0:
        return False, f"structure.lattice.a not positive: {a!r}"
    return True, "ok"


def md5_stamp(payload: Any) -> str:
    """Deterministic md5 stamp for cache filename."""
    blob = json.dumps(payload, sort_keys=True).encode("utf-8")
    return hashlib.md5(blob).hexdigest()[:12]


def _selftest() -> int:
    if not SAMPLE_FIXTURE.exists():
        print(f"  FAIL: fixture not found at {SAMPLE_FIXTURE}")
        print("__HEXA_MATTER_MP_API_SMOKE__ FAIL")
        return 1

    try:
        rec = load_fixture()
    except Exception as e:
        print(f"  FAIL: fixture load raised {type(e).__name__}: {e}")
        print("__HEXA_MATTER_MP_API_SMOKE__ FAIL")
        return 1

    ok, reason = validate_mp_record(rec)
    if not ok:
        print(f"  FAIL: schema check: {reason}")
        print("__HEXA_MATTER_MP_API_SMOKE__ FAIL")
        return 1
    print(f"  PASS: fixture schema OK (material_id={rec['material_id']}, a={rec['structure']['lattice']['a']} Å)")

    # Honest C3: the live MP path is intentionally NOT exercised in selftest.
    if _have_mp_api():
        print("  NOTE: mp-api installed, but live API is OUT-OF-SCOPE for selftest (offline determinism)")
    else:
        print("  NOTE: mp-api not installed; live API path SKIPPED in selftest (per NO LIVE API CALLS rule)")

    stamp = md5_stamp(rec)
    print(f"  PASS: md5 cache stamp = {stamp}")
    print("__HEXA_MATTER_MP_API_SMOKE__ PASS")
    return 0


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__.splitlines()[1])
    p.add_argument("--selftest", action="store_true")
    p.add_argument("--mp-id", default=None, help="Materials Project ID (e.g. mp-149); requires mp-api + MP_API_KEY")
    args = p.parse_args()

    if args.selftest:
        return _selftest()

    if args.mp_id:
        if not _have_mp_api():
            print("error: mp-api not installed; `pip install mp-api`", file=sys.stderr)
            return 2
        key = os.environ.get("MP_API_KEY")
        if not key:
            print("error: MP_API_KEY env var not set", file=sys.stderr)
            return 2
        # NOTE: live API call path. Not exercised in CI/selftest.
        from mp_api.client import MPRester  # type: ignore
        with MPRester(key) as mpr:
            doc = mpr.materials.summary.search(material_ids=[args.mp_id])[0]
            print(json.dumps(doc.dict(), indent=2, default=str))
        return 0

    p.print_help()
    return 0


if __name__ == "__main__":
    sys.exit(main())
