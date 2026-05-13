#!/usr/bin/env bash
# selftest/run_all.sh — hexa-matter Phase B selftest orchestrator.
#
# Purpose: pre-merge gate that runs all hexa-matter selftests sequentially.
# Mirrors `hexa-bio/selftest/run_all.sh` shape.
#
# Gate categories (29 gates total):
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
#     12 selftest modules covering 16 external-system adapters:
#     Materials Project, GNoME, Matlantis, OMat24, SchNet/MACE/ALIGNN/CHGNet/M3GNet,
#     COD, OQMD, AFLOW, NOMAD, NIMS-MatNavi, Catalysis-Hub)
#   Adapter-specific (6): cod_adapter_smoke (Phase G+1, 2026-05-13:
#     Crystallography Open Database), oqmd_adapter_smoke / aflow_adapter_smoke /
#     nomad_adapter_smoke (Phase G+2, 2026-05-13: DFT/FAIR-data direct-adapter
#     gates, offline-replay only), nims_mats_adapter_smoke / catalysis_hub_adapter_smoke
#     (Phase J.3, 2026-05-13: Japan-industrial dual-mode DB + DFT surface-reaction
#     DB direct-adapter gates, offline-replay only)
#   Parity gates (1): parity_gates_smoke (Phase H + Phase I.1, 2026-05-13:
#     aggregator over tests/*_parity.py — now 20 stdlib-only Category (b)
#     parity gates (10 Phase H + 10 Phase I.1) anchored to NIST/CRC/ASM/
#     TAPPI/GIA/Hales/Sugano/ISO snapshots; offline-only)
#   Closure-meta (1): cross_link_integrity_audit (2026-05-13: boundary
#     discipline gate — enforces CROSS_LINK.md sister-repo boundaries +
#     NOVEL.md candidate invariants + doc-reference integrity)
#   Category (c) handoff (1): c_handoff_completeness_audit (2026-05-13:
#     walks every §C row in CLOSURE_RESIDUAL_BACKLOG.md and asserts
#     DEST cell non-empty + LIMIT_BREAKTHROUGH wall classification present
#     + no n=6 lattice-fit pattern (raw#10 C3) + row count matches §C
#     summary table. Software cannot CLOSE (c) — but it CAN guarantee
#     handoff documentation is complete.)
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

# ── Phase J.3 NIMS-MatNavi / Catalysis-Hub adapters (2) — Japan dual-mode + DFT surface-reaction direct gates ────
# 2026-05-13: 14→16 adapter expansion. nims_mats_adapter_smoke covers the
# NIMS Materials Database (MatNavi/MITS) — Japan-focused, ~50k records,
# carries BOTH experimental AND computed entries; sample fixture is a
# SUS304 / SS304 austenitic stainless steel mechanical record per ASTM A240 /
# JIS G4304. catalysis_hub_adapter_smoke covers Catalysis-Hub (NTNU + Stanford
# SUNCAT), > 100k DFT surface-reaction / adsorption-energy records; sample
# fixture is a CO2 → CO adsorption energy on Cu(111) per Winther 2019 +
# Schlexer Lamoureux 2019. Both gates offline-replay only — no live REST /
# GraphQL hits in CI. License: CC-BY 4.0 on the open-data subsets.
run "nims_mats_adapter_smoke"         bash    "$HERE/nims_mats_adapter_smoke.sh"
run "catalysis_hub_adapter_smoke"     bash    "$HERE/catalysis_hub_adapter_smoke.sh"

# ── Phase H parity gates (1) — aggregator over 10 tests/*_parity.py gates ────
run "parity_gates_smoke"              bash    "$HERE/parity_gates_smoke.sh"

# ── Closure-meta cross-link / NOVEL integrity (1) — boundary discipline gate ──
# 2026-05-13: enforces CROSS_LINK.md sister-repo boundaries + NOVEL.md candidate
# invariants (status DESIGN, quantitative falsifier, risk-flags, NNN uniqueness)
# + doc-reference integrity (cited paths exist; sister URLs are
# github.com/dancinlab/hexa-*). Per LATTICE_POLICY §1.2 / §1.3 / raw#10 C3 +
# SPEC_FIRST: structure + boundary checks only, no measurement.
run "cross_link_integrity_audit"      python3 "$HERE/cross_link_integrity_audit.py"
# ── Category (c) handoff completeness audit (1) — §C ledger handoff audit ──
run "c_handoff_completeness_audit"    python3 "$HERE/c_handoff_completeness_audit.py"

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
