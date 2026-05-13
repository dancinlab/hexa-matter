# `_absorption_bridge/` — hexa-matter external-system absorption layer

> **Created**: 2026-05-13 (Phase G) · **Updated**: 2026-05-13 (Phase G+1: COD) · **Status**: 11 adapters (6 external systems + 5 universal force-field models)
> **Pattern reference**: `_python_bridge/module/` (Phase E discipline)
> **Selftest wiring**: `selftest/absorption_bridge_smoke.sh` → `selftest/run_all.sh`
> **User directive**: "알파폴드 처럼 흡수할 시스템도 흡수" (absorb systems-that-absorb, AlphaFold-class)

---

## Purpose

`_absorption_bridge/` is hexa-matter's analog to AlphaFold ingestion: a thin,
honest adapter layer that lets the substrate **absorb** external materials-
discovery systems' outputs without lattice-fitting them. Each adapter is a
standalone Python script with a `--selftest` mode that replays a tiny bundled
fixture **offline**; nothing makes a live API call inside the selftest. When
the optional external dep is missing, the adapter SKIPs cleanly (exit 0,
counted PASS) per the `NO MOCKED FUNCTIONALITY` rule from `INIT.md`.

The six external systems plus five universal force fields cover the major
materials-AI absorption surface as of 2026-05:

| Bucket | Systems |
|---|---|
| Database / API (computed) | Materials Project (Berkeley/LBNL) · GNoME (DeepMind) · Matlantis (Preferred Networks) · OMat24 (Meta AI) |
| Database / API (experimental) | COD (Crystallography Open Database, Gražulis et al. 2009/2012) |
| Universal force fields | SchNet · MACE · ALIGNN · CHGNet · M3GNet |

This bridge is the materials-substrate analog to AlphaFold absorption in
`hexa-bio` — we do NOT redo what these systems do; we expose adapter shapes
that let hexa-matter ingest their published metrics honestly.

---

## Layout

```
_absorption_bridge/
  README.md                                # this file
  pyproject.toml                           # optional deps (mp-api / matminer / mace-torch / schnetpack / ase)
  materials_project/
    mp_api_smoke.py                        # Materials Project API adapter (smoke, offline)
    SOURCES.md                             # API endpoint + auth + rate-limit + license
    cache/
      sample_response.json                 # SAMPLE FIXTURE: Si record (mp-149)
  gnome/
    gnome_dataset_smoke.py                 # DeepMind GNoME dataset adapter (2.2M predicted stable crystals)
    SOURCES.md                             # Zenodo DOI + license + honest "predicted not synthesized" note
    cache/
      sample_record.json                   # SAMPLE FIXTURE: one GNoME record schema
  matlantis/
    matlantis_call_smoke.py                # Preferred Networks Matlantis universal NNP adapter (smoke)
    SOURCES.md                             # commercial API note (UNVERIFIED at hexa-matter scale)
    cache/
      sample_response.json                 # SAMPLE FIXTURE: structure → energy record
  omat24/
    omat24_dataset_smoke.py                # Meta AI OMat24 dataset adapter (110M structures + MACE-OMat NNP)
    SOURCES.md                             # HuggingFace dataset + checkpoint + license
    cache/
      sample_record.json                   # SAMPLE FIXTURE: OMat24 record schema
  cod/                                     # Phase G+1 (2026-05-13)
    cod_search_smoke.py                    # Crystallography Open Database adapter (EXPERIMENTAL measurements, CC0 raw data)
    SOURCES.md                             # COD REST endpoint + Gražulis 2009/2012 citation + CC0 license
    cache/
      sample_record.json                   # SAMPLE FIXTURE: COD entry 9008565 (Si) schema
  cod_adapter.md                           # short doc for the COD adapter (Phase G+1)
  universal_ff/
    schnet_call.py                         # SchNet adapter (Schütt et al. 2017)
    mace_call.py                           # MACE adapter (Batatia et al. 2022)
    alignn_call.py                         # ALIGNN adapter (Choudhary & DeCost 2021)
    chgnet_call.py                         # CHGNet adapter (Deng et al. 2023)
    m3gnet_call.py                         # M3GNet adapter (Chen & Ong 2022)
    SOURCES.md                             # aggregate citation/license table for the 5 FFs
    cache/
      sample_structure.json                # SAMPLE FIXTURE: input crystal structure
  selftest/
    materials_project_smoke.py             # offline fixture replay
    gnome_smoke.py                         # offline fixture replay
    matlantis_smoke.py                     # offline fixture replay
    omat24_smoke.py                        # offline fixture replay
    cod_smoke.py                           # offline fixture replay (Phase G+1)
    universal_ff_smoke.py                  # offline fixture replay (all 5 FF adapters)
    sources_audit.py                       # all SOURCES.md present + non-empty + license stated
```

---

## `--selftest` convention

Every adapter accepts `--selftest` and emits a fixed sentinel:

```
__HEXA_MATTER_<MODULE_UPPER>__ PASS
```

or, on missing optional dep:

```
__HEXA_MATTER_<MODULE_UPPER>__ PASS (SKIP mode)
```

The aggregator (`selftest/absorption_bridge_smoke.sh`) emits:

```
__HEXA_MATTER_ABSORPTION_BRIDGE__ PASS  (N/N modules, M skipped)
```

Selftests are offline / deterministic / tiny. Live network calls during
`--selftest` are FORBIDDEN — they would break determinism and risk hitting
external rate limits during CI.

---

## Honesty (per `INIT.md` hard rules)

This bridge must NOT:

1. **Apply n=6 lattice formulas to external system data** (`raw#10 C3`).
   Materials Project DFT outputs, GNoME predictions, Matlantis NNP outputs,
   OMat24 records, and universal-FF energies all carry their OWN published
   invariants. The bridge passes them through untouched.

2. **Claim measurements the repo does not own** (`SPEC_FIRST`). Adapters
   surface external system records as-is; hexa-matter spec docs may
   reference them but do not re-derive them.

3. **Disguise mock data as real**. The bundled `cache/sample_*.json`
   fixtures are explicitly tagged `// SAMPLE FIXTURE — not real data,
   for selftest replay only` in their header field.

4. **Make live API calls during selftest**. Every selftest reads from
   the bundled cache fixture. Real adapter use against the live API is
   a runtime concern, not a CI concern.

5. **Misrepresent UNPROVEN status**. GNoME records are *predictions, not
   synthesized*. OMat24 structures are computational. The adapters
   preserve those markers verbatim in their docstrings.

6. **Pretend Matlantis is free**. It is a commercial Preferred Networks
   product. The adapter SKIPs by default and `matlantis/SOURCES.md`
   states "COMMERCIAL — UNVERIFIED at hexa-matter scale economics".

---

## License honesty matrix

| System | License | Cost | Honest note |
|---|---|---|---|
| Materials Project | CC-BY 4.0 (data); API requires free key | $0 with key | Berkeley/LBNL, Persson et al. 2013 |
| GNoME (DeepMind) | CC-BY 4.0 (Zenodo DOI 10.5281/zenodo.10371563) | $0 download | Merchant et al. 2023 Nature; **predicted, NOT synthesized** |
| Matlantis (Preferred Networks) | Commercial closed | $$$ (UNVERIFIED at scale) | Takamoto et al. 2022 Nat. Comm. (PFP universal NNP) |
| OMat24 (Meta AI) | CC-BY 4.0 (HuggingFace dataset + checkpoint) | $0 download | Barroso-Luque et al. 2024 (110M structures + MACE-OMat) |
| COD (Crystallography Open Database) | CC0 / public-domain raw data; no API key | $0 | Gražulis et al. 2009 J. Appl. Crystallogr. + 2012 Nucleic Acids Res.; **EXPERIMENTAL measurements, not predictions** |
| SchNet | MIT (schnetpack) | $0 | Schütt et al. 2017 J. Chem. Phys. |
| MACE | MIT (mace-torch) | $0 | Batatia et al. 2022 NeurIPS |
| ALIGNN | MIT (NIST jarvis-tools / alignn) | $0 | Choudhary & DeCost 2021 npj Comput. Mater. |
| CHGNet | BSD-3-Clause | $0 | Deng et al. 2023 Nat. Mach. Intell. |
| M3GNet | BSD-3-Clause (matgl) | $0 | Chen & Ong 2022 Nat. Comput. Sci. |

---

## When modules SKIP vs FAIL

| Situation | Outcome |
|---|---|
| Optional dep missing (mp-api / mace-torch / schnetpack / matgl / alignn / chgnet) | **SKIP** (exit 0, counted PASS) |
| Optional dep present + fixture replay fails | **FAIL** (exit 1) |
| Fixture replay succeeds | **PASS** (exit 0) |
| Live API attempted inside `--selftest` | **FORBIDDEN** (would violate offline determinism) |

---

## Install (optional deps)

Stdlib-only fallback works out of the box on Python 3.9+; adapters SKIP
their compute path when the optional dep is missing.

```bash
# all optional deps
pip install -e "_absorption_bridge[all]"

# per-system
pip install -e "_absorption_bridge[materials_project]"   # mp-api
pip install -e "_absorption_bridge[universal_ff]"        # schnetpack, mace-torch, matgl, alignn, chgnet
pip install -e "_absorption_bridge[meta_omat24]"         # mace-torch + huggingface_hub
```

---

## Wiring

`selftest/absorption_bridge_smoke.sh` (in the top-level `selftest/` dir,
Phase B's selftest infrastructure) invokes every
`_absorption_bridge/selftest/*.py --selftest` and aggregates PASS/FAIL/SKIP.
The aggregator becomes selftest gate **23** in `selftest/run_all.sh`
(gate 22 is reserved for Phase F's `_research_bridge/`).

Phase G+1 (2026-05-13) adds a dedicated COD-only gate at
`selftest/cod_adapter_smoke.sh` (gate **24**) that runs the COD adapter
directly so a COD regression is identifiable without rerunning the full
absorption aggregator.

---

## Cross-link

- `INIT.md` §"Phase G" — phase scope + commit log
- `V1_2_0_HANDOFF.md` §6 — Phase G absorption-target shopping list
- `AXIS_CLOSURE_PLAN.md` — per-group closure roadmap
- `LATTICE_POLICY.md` §1.2 + §1.3 — real-limits-first + lattice auxiliary
- `LIMIT_BREAKTHROUGH.md` — HARD / SOFT wall classification

---

*Document authored 2026-05-13 by 박민우 <nerve011235@gmail.com> as Phase G elevation.*
