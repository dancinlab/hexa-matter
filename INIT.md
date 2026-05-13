# INIT — hexa-matter elevation to hexa-bio level

> **Last updated**: 2026-05-13
> **Purpose**: Working-state record so phase progress is not lost across sessions.
> If you're picking this up cold, read this file first.

## Goal

Elevate `dancinlab/hexa-matter` from a thin 17-verb SPEC_FIRST catalog to the
architectural maturity of `dancinlab/hexa-bio` (77 root `.md` files, 32+ selftest
gates, Category (a)/(b)/(c) closure framework, Python compute bridges, per-axis
depth directories, external-research absorption).

User directive (2026-05-13):
- "hexa-bio 수준으로 hexa-matter 만들고 싶어"
- "Phase A~E 전수" — full scope, all phases
- "web deep research & arxiv deep research & 알파폴드 처럼 흡수할 시스템도 흡수"
  → expanded to Phase F (research bridges) + Phase G (AlphaFold-class absorption)

## Phase status

| Phase | Scope | Status | Commit |
|---|---|---|---|
| **A** | 10 infra docs + 5 deep expansion + 11 stubs | ✅ DONE | `c55199b` |
| **D** | 12 new material verbs (17→29) | ✅ DONE | `99620b2` |
| **B** | selftest harness (21 Python/bash gates) | ✅ DONE | `f24d8a5` |
| **C** | `hexa-*` axis-prefixed depth dirs (9 groups, 36 files, 3913 lines) | ✅ DONE | `6e4928a` |
| **E** | `_python_bridge/` (RDKit/ASE/pymatgen) | ✅ DONE | `b4ebf8f` |
| **F** | `_research_bridge/` (arxiv + web deep research) | ✅ DONE | _(this commit)_ |
| **G** | `_absorption_bridge/` (MaterialsProject, GNoME, Matlantis, OMat24, SchNet/MACE/ALIGNN) | ⏸ BLOCKED by E | |

## Phase A — DONE (commit `c55199b`)

26 files, 5045 lines.

### 10 infrastructure docs
| File | Lines |
|---|---|
| `AXIS.md` | 252 |
| `AXIS_CLOSURE_PLAN.md` | 258 |
| `CLOSURE_RESIDUAL_BACKLOG.md` | 229 |
| `DECOMPOSITION_PLAN.md` | 231 |
| `LESSONS.md` | 274 |
| `RELEASE_NOTES_v1.0.0.md` | 207 |
| `RELEASE_NOTES_v1.1.0.md` | 222 |
| `V1_2_0_HANDOFF.md` | 253 |
| `USER_ACTION_REQUIRED.md` | 235 |
| `IMPORTED_FROM_CANON.md` | 196 |

### 5 deep expansion docs (300+ lines)
SILICON.md (350) · CERAMIC-ENGINEERING.md (299) · METALLURGY-DEEP.md (308) ·
POLYMER-CHEMISTRY.md (439) · GRAPHENE-CARBON.md (353)

### 11 Phase D stubs
ELASTOMER · COMPOUND-SEMI · PEROVSKITE · 2D-MATERIALS · ADHESIVE ·
MAGNETIC-MATERIALS · MOF · LIQUID-CRYSTAL · SUPERALLOY ·
BIODEGRADABLE-PLASTICS · WOOD-CELLULOSE (~939 lines combined)

## Phase D — DONE (commit `99620b2`)

12 verb subdirectories added with `<verb>/<verb>.md` specs (silicon.md template,
~269 lines avg, 3227 total new lines). 17 → **29 verbs**.

12 verbs (with line counts):
| # | Verb | Lines |
|---|---|---|
| 18 | elastomer (natural rubber, SBR, EPDM, silicone rubber, PU, fluoroelastomer) | 249 |
| 19 | compound-semi (GaN, SiC, GaAs, InP) | 263 |
| 20 | perovskite (ABX₃ PV + oxide perovskite) | 255 |
| 21 | 2d-materials (MoS₂, WS₂, hBN, phosphorene, MXene) | 259 |
| 22 | adhesive (PSA, structural, cyanoacrylate, anaerobic, hot-melt) | 255 |
| 23 | magnetic-materials (NdFeB, SmCo, ferrite, Metglas, Finemet) | 263 |
| 24 | mof (HKUST-1, MOF-5, ZIF-8, MIL-101, UiO-66) | 263 |
| 25 | liquid-crystal (thermotropic + lyotropic) | 258 |
| 26 | superalloy (Ni-based, Co-based, Fe-Ni-based) | 267 |
| 27 | biodegradable-plastics (PLA, PHA, PBS, starch blends) | 311 |
| 28 | wood-cellulose (engineered wood, nanocellulose, CA) | 280 |
| 29 | carbon (activated, glassy, pyrolytic, fiber, CNT, diamond, fullerene) | 304 |

Verify scoreboard: **4/4 PASS · 29/29 verbs** ✅

Honest UNPROVEN/UNVERIFIED markers preserved per verb (one-liner each):
- **elastomer** — self-healing rubber + bio-isoprene UNVERIFIED at production
- **compound-semi** — 6/8" bulk GaN ammonothermal UNVERIFIED; diamond-as-semi wafer UNPROVEN
- **perovskite** — LK-99 NOT REPRODUCED (HARD_WALL); large-area + 25-yr-lifetime UNVERIFIED
- **2d-materials** — wafer-scale 2D mobility 10–100× loss vs lab; phosphorene ambient + 2D-magnet T_c > 300 K UNVERIFIED
- **adhesive** — bio-based + self-healing + gecko-inspired aerospace UNVERIFIED
- **magnetic-materials** — rare-earth-free > 35 MGOe UNVERIFIED; tetrataenite/MnBi/Fe₁₆N₂ R&D only
- **mof** — magic-MOF-DAC $100/t CO₂ UNPROVEN (Climeworks amine $600–1000/t)
- **liquid-crystal** — polymer-stabilized blue-phase commercial display UNVERIFIED
- **superalloy** — Re-free 4th-gen SX at parity UNVERIFIED; Co-base SX commercial UNVERIFIED
- **biodegradable-plastics** — marine-biodegradability UNVERIFIED most grades (only certain PHA D7081); cost parity to PE UNVERIFIED
- **wood-cellulose** — 50+ story mass-timber UNVERIFIED; transparent/densified wood UNVERIFIED at cost
- **carbon** — CNT yarn 80 GPa = lab mm-scale (commercial 1–3 GPa); bulk lonsdaleite + carbyne + diamond-semi UNVERIFIED

Small fix during verify: `verify/closure_consistency.hexa` regex `[a-z_0-9]+` → `[a-z_0-9-]+`
to accept dash-named Phase D verbs (`2d-materials`, `compound-semi`, etc.).

## Phase B — selftest harness ✅ DONE

`selftest/` directory at `/Users/ghost/core/hexa-matter/selftest/` with **21
fine-grained gates** (8 cross-cutting + 8 group-specific + 4 verb-specific + 1
bonus). Orchestrator: `selftest/run_all.sh`.

Final result: `__HEXA_MATTER_SELFTEST__ PASS  (21/21)`.

**Cross-cutting (8)**:
- `r1_symlink_audit.sh` — no out-of-repo symlinks in any verb dir
- `registry_consistency_audit.py` — CLI VERBS ≡ hexa.toml [verbs] ≡ verify/spec_presence VERBS ≡ README badge ≡ AXIS.md group sum (all = 29)
- `regression_audit.py` — falsifier preservation across CLOSURE_RESIDUAL_BACKLOG
- `n6_axis_computational_verification.py` — σ/τ/φ/J₂ arithmetic sanity (per LATTICE_POLICY §1.3 auxiliary)
- `cross_doc_audit.py` — README ↔ hexa.toml ↔ AXIS.md ↔ AGENTS.md semantic consistency
- `canon_provenance_check.py` — IMPORTED_FROM_CANON.md row ↔ local file presence
- `nist_anchor_audit.py` — every post-policy spec cites NIST/CRC/ASM/SEMI/ASTM/vendor/primary literature
- `lattice_fit_on_external_entities_audit.py` — **raw#10 C3 enforcement** (post-policy specs must NOT apply n=6 lattice to vendor/NIST/ITER data)

**Group-specific (8)**:
- `cer_thermal_shock_audit.py` — CER thermal-shock parameter R/R′/R″ anchored
- `pol_thermal_stability_audit.py` — POL group T_g numeric anchor (≥ 4 specs)
- `fib_tensile_audit.py` — FIB MPa/GPa/kN-per-m anchor per verb
- `met_alloy_classification.py` — ≥3 alloy families (Ni/Co/Fe-Ni/NdFeB/etc.)
- `gem_authenticity_check.py` — GIA/IGS or ≥3 gemological-property anchors
- `prc_yield_audit.py` — yield claims have falsifier/citation (legacy canon-import noted)
- `fas_dyeing_chemistry_audit.py` — corpus has ≥2 dye classes + ≥2 fiber substrates
- `silicon_purity_audit.py` — Si-L1..Si-L12 + 9N SOFT_WALL + CZ 600 mm + FZ 200 mm anchors

**Verb-specific (4)**:
- `compound_semi_bandgap_audit.py` — GaN/SiC/GaAs/InP bandgap eV cited with Sze/NIST/Saddow anchor
- `magnetic_materials_curie_audit.py` — Curie + BHmax + NdFeB/SmCo + Coey/Hitachi/TDK/Vacuumschmelze anchor
- `carbon_cnt_strength_honesty_audit.py` — CNT 80 GPa carries "lab mm-scale" / UNVERIFIED caveat (refs section excluded)
- `mof_dac_economics_honesty_audit.py` — MOF $100/t kept UNPROVEN with Climeworks $600-1000/t baseline named

**Bonus (1)**:
- `pyproject_smoke.sh` — SKIP cleanly until Phase E (Python bridge) lands

Entry point: `bash selftest/run_all.sh` from repo root. Exit 0 = all 21 PASS.

## Phase C — hexa-* axis-prefixed depth dirs (queued)

9 depth directories, one per AXIS group:
- `hexa-silicon/` (Si depth: wafer, polysilicon, FZ vs CZ, SiO₂ cross-link)
- `hexa-polymer/` (POL group depth: epoxy + nylon + microplastics + pet_film + biodegradable)
- `hexa-ceramic/` (CER group depth: ceramics + concrete + glass + silicon-cross-link + SiC + perovskite)
- `hexa-metal/` (MET group depth: metallurgy + lutherie + superalloy + magnetic)
- `hexa-fiber/` (FIB group depth: aramid + fabric + paper + wood-cellulose + carbon-fiber)
- `hexa-gem/` (GEM group: gemology)
- `hexa-fashion/` (FAS group: textile-dyeing + fashion-textile)
- `hexa-recycle/` (recycling + recycle_n6)
- `hexa-synthesis/` (synthesis pathway depth)

Each contains its own sub-spec markdowns + cross-links back to verb dirs.

## Phase E — `_python_bridge/` ✅ DONE (2026-05-13)

12 runnable scientific-compute modules ship under `_python_bridge/module/`.
Each accepts `--selftest`, runs offline/deterministically, and SKIPs
cleanly when its optional dep is missing. Bridge aggregator
(`selftest/pyproject_smoke.sh`) wires into `selftest/run_all.sh` as gate 21.

| Module | Status | Optional dep |
|---|---|---|
| `silicon_purity_compute.py` | **FUNCTIONAL** | stdlib only |
| `polymer_mw_distribution.py` | **FUNCTIONAL** | stdlib only |
| `metallurgy_alloy_composition.py` | **FUNCTIONAL** | stdlib only |
| `carbon_form_factor_classifier.py` | **FUNCTIONAL** | stdlib + optional RDKit |
| `cross_doc_consistency_compute.py` | **FUNCTIONAL** | stdlib only |
| `nist_anchor_resolver.py` | **FUNCTIONAL** | stdlib only |
| `rdkit_smiles_audit.py` | PARTIAL (SKIPs without RDKit) | rdkit-pypi |
| `rdkit_descriptor_calc.py` | PARTIAL (SKIPs without RDKit) | rdkit-pypi |
| `ase_atoms_construct.py` | PARTIAL (SKIPs without ASE) | ase |
| `ase_relaxation_check.py` | PARTIAL (SKIPs without ASE) | ase |
| `pymatgen_structure_io.py` | PARTIAL (stdlib MP-ID regex works; pymatgen CIF round-trip SKIPs) | pymatgen |
| `pymatgen_phasediagram_smoke.py` | PARTIAL (SKIPs without pymatgen) | pymatgen |

Stock-Python env (no optional deps installed) result:
`__HEXA_MATTER_PYTHON_BRIDGE__ PASS (12/12 modules, 5 skipped)`.

Full selftest (Phase B harness + Phase E gate):
`__HEXA_MATTER_SELFTEST__ PASS (21/21)`.

Honest C3: every SKIPped module prints why (e.g. `SKIP: rdkit not installed`)
and exits 0. No mocked compute is disguised as real — the harness treats
SKIP as PASS per the `NO MOCKED FUNCTIONALITY` rule.

## Phase F — `_research_bridge/` ✅ DONE (2026-05-13)

External-literature absorption layer. 8 runnable modules ship under
`_research_bridge/`. Each module accepts `--selftest` and runs OFFLINE
(fixtures replayed from local cache; NO live network calls in selftest).
Live mode is gated behind explicit `--live` flag and is rate-limit aware
(arxiv 3-sec backoff, vendor robots.txt, USPTO/EPO polite query cadence).

| Subsystem | Module | Status | Optional dep |
|---|---|---|---|
| **arxiv** | `arxiv/arxiv_pull.py` | FUNCTIONAL (stdlib urllib) | none |
| **arxiv** | `arxiv/arxiv_digest.py` | FUNCTIONAL (stdlib) | none |
| **web**   | `web/vendor_datasheet_pull.py` | FUNCTIONAL (stdlib regex; bs4 optional) | beautifulsoup4 |
| **web**   | `web/materials_news_feed.py` | FUNCTIONAL (stdlib ElementTree; feedparser optional) | feedparser |
| **web**   | `web/patent_search.py` | FUNCTIONAL (stdlib JSON) | none |
| **selftest** | `selftest/arxiv_smoke.py` | aggregator (PASS over 2 arxiv modules) | none |
| **selftest** | `selftest/web_smoke.py` | aggregator (PASS over 3 web modules) | none |
| **selftest** | `selftest/sources_audit.py` | SOURCES.md + speculative-flag-list audit | none |

Top-level Phase F gate: `selftest/research_bridge_smoke.sh` (gate 22 in
`selftest/run_all.sh`). Result: `__HEXA_MATTER_RESEARCH_BRIDGE__ PASS
(3/3 modules, 0 skipped)`.

Full selftest scoreboard after Phase F:
`__HEXA_MATTER_SELFTEST__ PASS (22/22)`.

Bundled offline-replay fixtures (synthetic, not real data):
- `arxiv/arxiv_cache/sample_response.xml` — 3 synthetic papers
- `web/web_cache/sample_vendor.html` — vendor product page mock
- `web/web_cache/sample_rss.xml` — 3-item RSS mock
- `web/web_cache/sample_patent.json` — 3-record USPTO-shape JSON mock

Honesty preservation (UNPROVEN flag list — propagates through arxiv +
news + patent verb-keyword digest):
- LK-99 / room-T superconductivity (never reproduced)
- Magic-MOF $100/t DAC (Climeworks amine $600–1000/t baseline)
- Perovskite 25-yr operational lifetime (UNVERIFIED commercial scale)
- Ambient metallic hydrogen, infinite recycle, 100% recyclable

raw#10 C3: NO n=6 lattice-fit on ingested arxiv / vendor / patent data.
Vendor datasheet values quoted AS-IS with provenance; SPEC_FIRST verdict
is informed by research signals, not replaced by them.

SOURCES.md:
- `arxiv/SOURCES.md` — 6 cond-mat categories + keyword strategy + 3-sec
  backoff discipline + `@arxiv-informed:` cross-link convention
- `web/SOURCES.md` — 14 vendors + 7 RSS/Atom feeds + 5 patent endpoints
  with last-verified dates + robots.txt / ToS notes

## Phase G — `_absorption_bridge/` (queued, per user directive: "알파폴드 처럼 흡수")

External materials-discovery system absorption layer.

Target systems:
- **Materials Project** (Berkeley/LBNL) — API for ~150k materials w/ DFT data
- **GNoME** (DeepMind, 2023) — 2.2M predicted new stable materials
- **Matlantis** (Preferred Networks) — universal NNP, commercial API
- **OMat24** (Meta AI, 2024) — 110M structure dataset + MACE-OMat NNP
- **Universal force fields**: SchNet · MACE · ALIGNN · CHGNet · M3GNet
- **AlphaFold-3** (DeepMind) — material/protein co-fold (where applicable)

Layout:
```
_absorption_bridge/
  materials_project/
  gnome/
  matlantis/
  omat24/
  universal_ff/
    schnet_call.py
    mace_call.py
    alignn_call.py
    chgnet_call.py
    m3gnet_call.py
  selftest/
    *_smoke.py
```

Each system gets an adapter that:
- Calls external API (or downloads dataset/model)
- Caches results locally
- Emits hexa-matter-compatible structure/property records
- Honesty: every adapter must preserve external system's OWN published metrics
  (no n=6 lattice-fit on external data — raw#10 C3)

## Closure framework

Per `AXIS_CLOSURE_PLAN.md` (Phase A output), hexa-matter uses the **Category (a)/(b)/(c)** framework from hexa-bio:

- **(a) in-repo SW/spec closure** — currently 100% at 4/4 verify + 17/17 verbs (will be 29/29 after Phase D)
- **(b) formal/empirical material-property data parity** — NIST/CRC anchored
  values matched against measured datasets. **29 parity gates UNVERIFIED** as of
  2026-05-13. Phase B is the implementation layer.
- **(c) wet-lab synthesis / manufacturing scale closure** — OUT-OF-REPO by
  design. Vendors (Wacker poly-Si, Wolfspeed SiC, Stora Enso wood, …) carry
  this layer with their own published numbers. 15 (c) items enumerated in
  `CLOSURE_RESIDUAL_BACKLOG.md §C`.

## Hard constraints (NEVER violate)

These rules are baked into every phase. Any output that violates them is BAD:

1. **`LATTICE_POLICY.md` §1.2 — Real-limits-first**
   The project ceiling is set by REAL math/physics/engineering limits (Shannon,
   Kolmogorov, Bekenstein, c, ℏ, k, Stefan-Boltzmann, Carnot, ASML throughput,
   …), NOT by the n=6 lattice. Lattice tautologies (σ·φ=24) alone are NOT
   sufficient verification.

2. **`LATTICE_POLICY.md` §1.3 — n=6 is auxiliary, not load-bearing**
   The lattice is a tool, not a constraint. Use it where it fits naturally;
   never force-map it onto external domains.

3. **raw#10 C3 — no lattice-fit on external entities**
   Wacker, GCL, Hemlock, Wolfspeed, Merck KGaA, TSMC, Wolfspeed, ASML, vendors
   of any kind use THEIR OWN published invariants. NEVER apply n=6 lattice
   formulas to vendor data, NIST constants, ITER specs, etc.

4. **SPEC_FIRST verdict preserved**
   Every spec must state "SPEC_FIRST, not MEASURED here." Numbers cite
   sources (NIST/CRC/SEMI/ASTM/vendor). The repo does not own measurements.

5. **UNPROVEN / UNVERIFIED stamps preserved verbatim**
   LK-99, metallic-hydrogen, infinite-recycle, MOF DAC economics, marine-
   biodegradable claims, etc. — all explicitly UNPROVEN and must stay so.

6. **`AGENTS.md` `LIMIT_BREAKTHROUGH.md` is authoritative**
   For HARD_WALL / SOFT_WALL / BREAKABLE_WITH_TECH / UNCLEAR classifications,
   defer to that file.

## Key files and references

- `/Users/ghost/core/hexa-matter/README.md` — landing
- `/Users/ghost/core/hexa-matter/AGENTS.md` — agent operating guide
- `/Users/ghost/core/hexa-matter/LATTICE_POLICY.md` — discipline anchor
- `/Users/ghost/core/hexa-matter/LIMIT_BREAKTHROUGH.md` — real-limits ceiling
- `/Users/ghost/core/hexa-matter/AXIS.md` (Phase A) — 7-group taxonomy
- `/Users/ghost/core/hexa-matter/AXIS_CLOSURE_PLAN.md` (Phase A) — (a)/(b)/(c) roadmap
- `/Users/ghost/core/hexa-matter/CLOSURE_RESIDUAL_BACKLOG.md` (Phase A) — (b)/(c) ledger
- `/Users/ghost/core/hexa-matter/V1_2_0_HANDOFF.md` (Phase A) — full Phase B-G plan
- `/Users/ghost/core/hexa-bio/` — sister-substrate REFERENCE (don't copy, but emulate maturity)
- `/Users/ghost/core/hexa-matter/silicon/silicon.md` — gold-standard verb spec template

## Commit log (this elevation)

- `91981d4` — Initial 4/4 verify closure (16 verbs)
- `a239611` — Silicon added (17 verbs, gold template)
- `c55199b` — Phase A infrastructure (10 infra + 5 deep + 11 stubs)
- `99620b2` — Phase D (12 new verbs, 17 → 29)
- `f24d8a5` — Phase B (21-gate selftest harness; `__HEXA_MATTER_SELFTEST__ PASS  (21/21)`)
- `6e4928a` — Phase C (hexa-* axis-prefixed depth dirs: 9 groups, 36 files, 3913 lines)
- `b4ebf8f` — Phase E (`_python_bridge/` — 12 compute modules; `__HEXA_MATTER_PYTHON_BRIDGE__ PASS (12/12, 5 skipped)`)
- _Phase F/G commits forthcoming_

## If you're picking this up cold

1. Read this file (you just did).
2. Check Phase status table above. Find the in_progress phase.
3. `git -C /Users/ghost/core/hexa-matter status` — check working tree.
4. `git -C /Users/ghost/core/hexa-matter log --oneline -10` — confirm head.
5. Read `V1_2_0_HANDOFF.md` for the comprehensive plan.
6. Resume in the next blocked phase per the dependency graph above.
7. NEVER violate the 6 hard constraints.
