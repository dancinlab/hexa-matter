#!/usr/bin/env bash
# selftest/run_all.sh — hexa-matter Phase B selftest orchestrator.
#
# Purpose: pre-merge gate that runs all hexa-matter selftests sequentially.
# Mirrors `hexa-bio/selftest/run_all.sh` shape.
#
# Gate categories (28 gates total):
#   Cross-cutting (8): r1_symlink, registry_consistency, regression,
#     n6_axis, cross_doc, canon_provenance, nist_anchor, lattice_fit_audit
#   Group-specific (8): cer_thermal_shock, pol_thermal_stability,
#     fib_tensile, met_alloy_classification, gem_authenticity,
#     prc_yield, fas_dyeing_chemistry, silicon_purity
#   Verb-specific (4): compound_semi_bandgap, magnetic_materials_curie,
#     carbon_cnt_strength_honesty, mof_dac_economics_honesty
#   Python bridge (1): pyproject_smoke (Phase E aggregator over 12 modules;
#     SKIPs optional-dep modules cleanly when RDKit/ASE/pymatgen missing)
#   Research bridge (1): research_bridge_smoke (Phase F aggregator over
#     arxiv_smoke + web_smoke + sources_audit; offline-replay only)
#   Absorption bridge (1): absorption_bridge_smoke (Phase G aggregator over
#     10 selftest modules covering 14 external-system adapters:
#     Materials Project, GNoME, Matlantis, OMat24, SchNet/MACE/ALIGNN/CHGNet/M3GNet,
#     COD, OQMD, AFLOW, NOMAD)
#   Adapter-specific (4): cod_adapter_smoke (Phase G+1, 2026-05-13:
#     Crystallography Open Database), oqmd_adapter_smoke / aflow_adapter_smoke /
#     nomad_adapter_smoke (Phase G+2, 2026-05-13: DFT/FAIR-data direct-adapter
#     gates, offline-replay only)
#   Parity gates (1): parity_gates_smoke (Phase H, 2026-05-13: aggregator
#     over tests/*_parity.py — 10 stdlib-only Category (b) parity gates
#     anchored to NIST/CRC/ASM/TAPPI/GIA snapshots; offline-only)
#
# Per LATTICE_POLICY §1.2 + §1.3 + raw#10 C3, the gates enforce:
#   - real-limits-first (LIMIT_BREAKTHROUGH anchors)
#   - n=6 lattice is auxiliary only (n6_axis is a math sanity check)
#   - no lattice-fit on external entities (lattice_fit_on_external_entities_audit)
#   - SPEC_FIRST preserved (verify gates already cover this)
#   - UNPROVEN/UNVERIFIED stamps preserved (carbon CNT + MOF DAC gates)
#
# Exit 0 = all PASS, exit 1 = any FAIL.

set -u
HERE="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="${HEXA_MATTER_ROOT:-$(cd "$HERE/.." && pwd)}"
export HEXA_MATTER_ROOT="$REPO_ROOT"

passes=0
fails=0
results=()

run() {
  local label="$1"; shift
  echo "▶ $label"
  if "$@"; then
    echo "  ✓ PASS"
    passes=$((passes + 1))
    results+=("PASS  $label")
  else
    echo "  ✗ FAIL"
    fails=$((fails + 1))
    results+=("FAIL  $label")
  fi
  echo
}

# ── Cross-cutting (8) ─────────────────────────────────────────
run "r1_symlink_audit"                bash    "$HERE/r1_symlink_audit.sh"
run "registry_consistency_audit"      python3 "$HERE/registry_consistency_audit.py"
run "regression_audit"                python3 "$HERE/regression_audit.py"
run "n6_axis_computational_verification" python3 "$HERE/n6_axis_computational_verification.py"
run "cross_doc_audit"                 python3 "$HERE/cross_doc_audit.py"
run "canon_provenance_check"          python3 "$HERE/canon_provenance_check.py"
run "nist_anchor_audit"               python3 "$HERE/nist_anchor_audit.py"
run "lattice_fit_on_external_entities_audit" python3 "$HERE/lattice_fit_on_external_entities_audit.py"

# ── Group-specific (8) ────────────────────────────────────────
run "cer_thermal_shock_audit"         python3 "$HERE/cer_thermal_shock_audit.py"
run "pol_thermal_stability_audit"     python3 "$HERE/pol_thermal_stability_audit.py"
run "fib_tensile_audit"               python3 "$HERE/fib_tensile_audit.py"
run "met_alloy_classification"        python3 "$HERE/met_alloy_classification.py"
run "gem_authenticity_check"          python3 "$HERE/gem_authenticity_check.py"
run "prc_yield_audit"                 python3 "$HERE/prc_yield_audit.py"
run "fas_dyeing_chemistry_audit"      python3 "$HERE/fas_dyeing_chemistry_audit.py"
run "silicon_purity_audit"            python3 "$HERE/silicon_purity_audit.py"

# ── Verb-specific (4) ─────────────────────────────────────────
run "compound_semi_bandgap_audit"     python3 "$HERE/compound_semi_bandgap_audit.py"
run "magnetic_materials_curie_audit"  python3 "$HERE/magnetic_materials_curie_audit.py"
run "carbon_cnt_strength_honesty_audit" python3 "$HERE/carbon_cnt_strength_honesty_audit.py"
run "mof_dac_economics_honesty_audit" python3 "$HERE/mof_dac_economics_honesty_audit.py"

# ── Phase E python bridge (1) — aggregator over 12 modules ────
run "pyproject_smoke"                 bash    "$HERE/pyproject_smoke.sh"

# ── Phase F research bridge (1) — aggregator over arxiv + web + audit ────
run "research_bridge_smoke"           bash    "$HERE/research_bridge_smoke.sh"

# ── Phase G absorption bridge (1) — aggregator over 14 external-system adapters ────
run "absorption_bridge_smoke"         bash    "$HERE/absorption_bridge_smoke.sh"

# ── Phase G+1 COD adapter (1) — Crystallography Open Database direct gate ────
run "cod_adapter_smoke"               bash    "$HERE/cod_adapter_smoke.sh"

# ── Phase G+2 OQMD / AFLOW / NOMAD adapters (3) — DFT/FAIR-data direct gates ────
run "oqmd_adapter_smoke"              bash    "$HERE/oqmd_adapter_smoke.sh"
run "aflow_adapter_smoke"             bash    "$HERE/aflow_adapter_smoke.sh"
run "nomad_adapter_smoke"             bash    "$HERE/nomad_adapter_smoke.sh"

# ── Phase H parity gates (1) — aggregator over 10 tests/*_parity.py gates ────
run "parity_gates_smoke"              bash    "$HERE/parity_gates_smoke.sh"

# ── Summary ──────────────────────────────────────────────────
total=$((passes + fails))
echo "─────────────────────────────────────────────"
echo "hexa-matter selftest summary: $passes PASS / $fails FAIL of $total gates"
for r in "${results[@]}"; do echo "  $r"; done

echo ""
if [ "$fails" -eq 0 ]; then
  echo "__HEXA_MATTER_SELFTEST__ PASS  ($passes/$total)"
  exit 0
fi
echo "__HEXA_MATTER_SELFTEST__ FAIL  ($fails of $total gates failed)"
exit 1
