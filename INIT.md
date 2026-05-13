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
| **B** | selftest harness (20+ Python/bash gates) | ⏸ READY (D unblocked) | |
| **C** | `hexa-*` axis-prefixed depth dirs (9 groups) | ⏸ READY (D unblocked) | |
| **E** | `_python_bridge/` (RDKit/ASE/pymatgen) | ⏸ READY (D unblocked) | |
| **F** | `_research_bridge/` (arxiv + web deep research) | ⏸ BLOCKED by E | |
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

## Phase B — selftest harness (queued)

Build Python/bash selftest harness with 20+ gates per `hexa-bio/selftest/` reference:

Examples:
- `silicon_purity_audit.py` (9N ceiling verification)
- `metallurgy_alloy_classification.py`
- `polymer_thermal_stability.py`
- `ceramic_thermal_shock.py`
- `recycling_yield_audit.py`
- `bom_database_consistency.py`
- `nist_anchor_audit.py`
- `lattice_arithmetic_regression.py`
- `cross_doc_audit.py`
- `canon_provenance_check.py`
- `r1_symlink_audit.sh`
- `registry_consistency_audit.py`
- `regression_audit.py`
- (group-specific gates added per Phase D verb)

Entry point: `selftest/run_all.sh` mirroring `hexa-bio/selftest/run_all.sh`.

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

## Phase E — `_python_bridge/` (queued)

Runnable scientific compute infrastructure.

Module targets:
- RDKit (organic chemistry, SMILES, fingerprints, descriptors)
- ASE (Atomic Simulation Environment — atoms, calculators, optimizers)
- pymatgen (Materials Project Python lib — structure, analysis, IO)

Layout:
```
_python_bridge/
  module/
    rdkit_smiles_audit.py
    ase_relaxation_check.py
    pymatgen_structure_io.py
    ...
```

Each module is a callable Python script with `--selftest` mode, mirroring
`hexa-bio/_python_bridge/module/` layout.

## Phase F — `_research_bridge/` (queued, per user directive)

External-literature absorption layer.

- **arxiv deep research**: cond-mat.mtrl-sci pipeline
  - daily/weekly arxiv API pull (`http://export.arxiv.org/api/query`)
  - filter by category + keyword
  - md5-stamp + cache + digest
- **web deep research**: vendor datasheet/news/patent crawl
  - vendor pages (Wacker, GCL, Hemlock, Wolfspeed, Merck KGaA, …)
  - Materials industry news feeds
  - USPTO/EPO patent search (open APIs)
  - polite scraping with cache + rate limits

Layout:
```
_research_bridge/
  arxiv/
    arxiv_pull.py
    arxiv_digest.py
    arxiv_cache/
  web/
    vendor_datasheet_pull.py
    materials_news_feed.py
    patent_search.py
  selftest/
    arxiv_smoke.py
    vendor_smoke.py
```

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
- _Phase B/C/E/F/G commits forthcoming_

## If you're picking this up cold

1. Read this file (you just did).
2. Check Phase status table above. Find the in_progress phase.
3. `git -C /Users/ghost/core/hexa-matter status` — check working tree.
4. `git -C /Users/ghost/core/hexa-matter log --oneline -10` — confirm head.
5. Read `V1_2_0_HANDOFF.md` for the comprehensive plan.
6. Resume in the next blocked phase per the dependency graph above.
7. NEVER violate the 6 hard constraints.
