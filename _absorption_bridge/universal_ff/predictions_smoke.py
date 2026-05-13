#!/usr/bin/env python3
"""predictions_smoke.py — Phase J.2 (2026-05-13)

Walks every `_absorption_bridge/universal_ff/predictions/*.json` snapshot and
validates the raw#10 C3 invariants for a SIM-NNP-PROXY status promotion:

  - `__fixture_tag__` present and starts with "VENDORED UNIVERSAL-FF PREDICTION"
  - `candidate_id` matches `hxm-<class>-<target>-<NNN>` pattern
  - `predicted_value` present (numeric)
  - `proxy_source` present (peer-reviewed paper / vendor datasheet anchor)
  - `n6_lattice_fit_applied: false` mandatory (LATTICE_POLICY §1.3 + raw#10 C3)
  - `is_measurement: false` mandatory (raw#10 C3 — SIM-NNP-PROXY ≠ measurement)
  - `is_external_verification: false` mandatory (does NOT promote to EXTERNAL-VERIFIED)

Hard list — the 7 Tier-1 promoted candidates must all be present:

  - hxm-pv-tandem-002 (§4.A.4 of NOVEL_ROADMAP / §4.A.11 of NOVEL)
  - hxm-bat-cath-drx-001 (§4.A.1)
  - hxm-bat-anode-li-metal-001 (§4.A.2 of roadmap / §4.A.5 of NOVEL)
  - hxm-co2-cap-mof-mfm-002 (§4.F.1)
  - hxm-te-half-zrnisn-001 (§4.B.2)
  - hxm-cement-mgo-co2neg-001 (§4.D.6)
  - hxm-h2-elec-iro2-doped-001 (§4.B.1)

Sentinel: `__HEXA_MATTER_UFF_PREDICTIONS__ PASS (7/7 predictions, 0 invalid)`.
"""

from __future__ import annotations

import json
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
PREDICTIONS_DIR = HERE / "predictions"

REQUIRED_FIELDS = (
    "__fixture_tag__",
    "candidate_id",
    "predicted_value",
    "proxy_source",
    "n6_lattice_fit_applied",
    "is_measurement",
    "is_external_verification",
)

TIER1_REQUIRED = {
    "hxm-pv-tandem-002",
    "hxm-bat-cath-drx-001",
    "hxm-bat-anode-li-metal-001",
    "hxm-co2-cap-mof-mfm-002",
    "hxm-te-half-zrnisn-001",
    "hxm-cement-mgo-co2neg-001",
    "hxm-h2-elec-iro2-doped-001",
}

ID_RE = re.compile(r"^hxm-[a-z0-9][a-z0-9-]*-\d{3}$")


def validate_snapshot(path: Path) -> list[str]:
    errors: list[str] = []
    try:
        snap = json.loads(path.read_text(encoding="utf-8"))
    except json.JSONDecodeError as exc:
        return [f"{path.name}: not valid JSON ({exc})"]

    for field in REQUIRED_FIELDS:
        if field not in snap:
            errors.append(f"{path.name}: missing required field '{field}'")

    if "__fixture_tag__" in snap and not str(snap["__fixture_tag__"]).startswith(
        "VENDORED UNIVERSAL-FF PREDICTION"
    ):
        errors.append(
            f"{path.name}: __fixture_tag__ must start with 'VENDORED UNIVERSAL-FF PREDICTION'"
        )

    if "candidate_id" in snap and not ID_RE.match(str(snap["candidate_id"])):
        errors.append(
            f"{path.name}: candidate_id '{snap['candidate_id']}' fails hxm-<class>-<target>-<NNN> shape"
        )

    if snap.get("n6_lattice_fit_applied") is not False:
        errors.append(
            f"{path.name}: n6_lattice_fit_applied must be literal false (raw#10 C3)"
        )
    if snap.get("is_measurement") is not False:
        errors.append(
            f"{path.name}: is_measurement must be literal false (raw#10 C3 — SIM-NNP-PROXY ≠ measurement)"
        )
    if snap.get("is_external_verification") is not False:
        errors.append(
            f"{path.name}: is_external_verification must be literal false (does NOT promote to EXTERNAL-VERIFIED)"
        )
    if "proxy_source" in snap and not str(snap["proxy_source"]).strip():
        errors.append(f"{path.name}: proxy_source must be non-empty")

    return errors


def main() -> int:
    args = sys.argv[1:]
    selftest = "--selftest" in args

    if not PREDICTIONS_DIR.is_dir():
        print(f"FAIL: predictions directory not found: {PREDICTIONS_DIR}")
        print("__HEXA_MATTER_UFF_PREDICTIONS__ FAIL (predictions/ missing)")
        return 1

    files = sorted(PREDICTIONS_DIR.glob("*.json"))
    invalid: list[str] = []
    seen_ids: set[str] = set()
    for path in files:
        errs = validate_snapshot(path)
        if errs:
            invalid.extend(errs)
            continue
        snap = json.loads(path.read_text(encoding="utf-8"))
        seen_ids.add(snap["candidate_id"])

    missing_tier1 = TIER1_REQUIRED - seen_ids
    if missing_tier1:
        invalid.append(
            f"Tier-1 candidate(s) missing from predictions/: {sorted(missing_tier1)}"
        )

    total = len(TIER1_REQUIRED)
    found = len(TIER1_REQUIRED & seen_ids)

    if invalid:
        if not selftest:
            for line in invalid:
                print(f"  ! {line}")
        print(
            f"__HEXA_MATTER_UFF_PREDICTIONS__ FAIL ({found}/{total} predictions, {len(invalid)} invalid)"
        )
        if selftest:
            for line in invalid:
                print(f"  ! {line}")
        return 1

    print(
        f"__HEXA_MATTER_UFF_PREDICTIONS__ PASS ({found}/{total} predictions, 0 invalid)"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
