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
| **D'** | 4 Phase D follow-on verbs (29→33): glass-ceramic, geopolymer, aerogel-foam, ionic-liquid | ✅ DONE | `f4531fa` |
| **D''** | 3 Phase D'' verbs (33→36): refractory, photoresist, electrode-material | ✅ DONE | _(this commit)_ |
| **B** | selftest harness (21 Python/bash gates) | ✅ DONE | `f24d8a5` |
| **C** | `hexa-*` axis-prefixed depth dirs (9 groups, 36 files, 3913 lines) | ✅ DONE | `6e4928a` |
| **E** | `_python_bridge/` (RDKit/ASE/pymatgen) | ✅ DONE | `b4ebf8f` |
| **F** | `_research_bridge/` (arxiv + web deep research) | ✅ DONE | `185ce33` |
| **G** | `_absorption_bridge/` (MaterialsProject, GNoME, Matlantis, OMat24, SchNet/MACE/ALIGNN/CHGNet/M3GNet) | ✅ DONE | `e712068` |
| **G+1** | `_absorption_bridge/cod/` (Crystallography Open Database — 11th adapter, EXPERIMENTAL measurements, CC0 raw data) | ✅ DONE | _(prev commit)_ |
| **H** | Category (b) parity-gate landing — 10 `tests/<gate>_parity.py` + 10 `tests/snapshots/<gate>.json` + `selftest/parity_gates_smoke.sh` (gate #25); ledger drain 29 → 19 in CLOSURE_RESIDUAL_BACKLOG §B; selftest 24/24 → 25/25 | ✅ DONE | _(this commit)_ |

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

## Phase D follow-on — DONE (this commit)

4 additional verb subdirectories added with `<verb>/<verb>.md` specs
(silicon.md template), 29 → **33 verbs**.

4 verbs (with line counts):
| # | Verb | Lines |
|---|---|---|
| 30 | glass-ceramic (LAS Zerodur, Macor, Pyroceram, Li-disilicate dental, transparent armor) | 304 |
| 31 | geopolymer (alkali-activated FA/MK/GGBFS; low-CO₂ cement alternative) | 340 |
| 32 | aerogel-foam (silica, carbon, polymer, graphene aerogel) | 355 |
| 33 | ionic-liquid (imidazolium / pyridinium / ammonium / phosphonium; DES distinction preserved) | 376 |

Verify scoreboard: **4/4 PASS · 33/33 verbs** ✅

Honest UNPROVEN/UNVERIFIED markers preserved per verb (one-liner each):
- **glass-ceramic** — transparent-armor large-pane production UNVERIFIED; self-healing GC UNPROVEN
- **geopolymer** — CO₂-reduction claim bracket 10–80 % UNVERIFIED (system-boundary-sensitive LCA); multi-decade durability UNVERIFIED (oldest commercial < 10 yr)
- **aerogel-foam** — cost-per-kg UNPROVEN at commodity-foam parity ($20–100/kg insulation vs $2–5/kg PU); graphene aerogel 0.16 kg/m³ density record UNVERIFIED at production
- **ionic-liquid** — "green solvent" claim UNVERIFIED at full LCA (toxicity EC50 ~ 5 mg/L; biodegradability poor); commodity cost < $50/kg UNPROVEN; DES distinction preserved (H-bond complex ≠ pure salt)

Allocation: CER +3 (glass-ceramic, geopolymer, aerogel-foam — all
silicate/silica-network/aluminosilicate chemistry); POL +1 (ionic-liquid
as organic/soft-matter extension though formally not a polymer; spec §1
preserves DES distinction).

## Phase D'' — DONE (this commit)

3 additional verb subdirectories added with `<verb>/<verb>.md` specs
(silicon.md template), 33 → **36 verbs**.

3 verbs (with line counts):
| # | Verb | Lines |
|---|---|---|
| 34 | refractory (firebrick · Al₂O₃ · MgO · ZrO₂ · mag-C · SiC · carbon; T_service ≥ 1000 °C; AZS fused-cast glass-tank block; RHI Magnesita / Vesuvius / Imerys / Saint-Gobain / Morgan / Krosaki / Shinagawa anchors) | 391 |
| 35 | photoresist (g/i-line DNQ-novolac · KrF CAR · ArF CAR · EUV CAR + MOR · dry-film PCB; JSR / TOK / Shin-Etsu / Sumitomo / Fujifilm / Dow / Inpria anchors; material-layer only — lithography process → hexa-chip per CROSS_LINK §3.2) | 414 |
| 36 | electrode-material (LFP · NMC811 · LCO · graphite · Si anode · Li-metal · Pt-ORR · IrO₂-OER · MnO₂; Umicore / POSCO Future M / CATL / BYD / LG Energy / Samsung SDI / Sumitomo Metal Mining / Tanaka Holdings anchors; material-layer only — cell engineering → hexa-energy per CROSS_LINK §3.3) | 485 |

Verify scoreboard: **4/4 PASS · 36/36 verbs** ✅

Honest UNPROVEN/UNVERIFIED markers preserved per verb (one-liner each):
- **refractory** — RCF Group 2B IARC (real); self-healing refractory UNPROVEN; spent-refractory structural-grade recycling UNVERIFIED; AZS glass-tank 20-yr-life UNVERIFIED at vendor warranty
- **photoresist** — EUV resist photon-shot-noise vs LER trade-off NOT FULLY RESOLVED (IRDS 2023); MOR full-commodity yield UNVERIFIED; high-NA EUV resist at production UNVERIFIED; resist owns material only, lithography process belongs to hexa-chip
- **electrode-material** — Si-anode 500-cycle 1C 70% retention UNVERIFIED at full commodity scale; Li-metal anode dendrite suppression UNVERIFIED for ≥ 500 deep cycles; Pt-loading reduction roadmap UNVERIFIED at production durability; CATL Blade 12,000-cycle LFP multi-vendor reproduction OPEN; cell engineering belongs to hexa-energy

Allocation: CER +2 (refractory — high-T service envelope discipline
distinct from `ceramics/`; electrode-material — battery cathode/anode
oxide + electrocatalyst); POL +1 (photoresist — photopolymer chemistry).

Cross-link discipline (CROSS_LINK.md):
- `photoresist/photoresist.md` contains explicit line declaring device
  + lithography process belongs to hexa-chip per CROSS_LINK §3.2 —
  this verb owns the MATERIAL only (lines 8, 246, 397, 412+)
- `electrode-material/electrode-material.md` contains explicit line
  declaring cell engineering belongs to hexa-energy per CROSS_LINK §3.3
  — this verb owns the ACTIVE MATERIAL only (lines 8, 350, 470, 484+)

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

## Phase G — `_absorption_bridge/` ✅ DONE (2026-05-13)

External materials-discovery system absorption layer per user directive
("알파폴드 처럼 흡수할 시스템도 흡수"). **11 adapters** ship under
`_absorption_bridge/` (10 from Phase G + 1 from Phase G+1, 2026-05-13): 6
database/API systems plus 5 universal force-field models. Each accepts
`--selftest`, runs OFFLINE (fixtures replayed from bundled `<system>/cache/`;
NO live API calls in selftest), and SKIPs cleanly when its optional dep is
missing.

**Phase G+1 (2026-05-13)** added the Crystallography Open Database (COD)
adapter — the first EXPERIMENTAL-measurement source in the bridge (distinct
from MP / GNoME / OMat24 / NNP outputs, which are computed predictions).
Files:
- `_absorption_bridge/cod/cod_search_smoke.py` — stdlib-only adapter
- `_absorption_bridge/cod/SOURCES.md` — Gražulis 2009/2012 + CC0 raw data
- `_absorption_bridge/cod/cache/sample_record.json` — COD entry 9008565 (Si) fixture
- `_absorption_bridge/cod_adapter.md` — short adapter doc
- `_absorption_bridge/selftest/cod_smoke.py` — wrapper
- `selftest/cod_adapter_smoke.sh` — dedicated top-level gate 24
- Selftest scoreboard: 23/23 → **24/24** PASS (gate 24 = `cod_adapter_smoke`).

| Subsystem | Module | Status | Optional dep |
|---|---|---|---|
| **materials_project** | `materials_project/mp_api_smoke.py` | FUNCTIONAL (offline replay) | mp-api |
| **gnome**             | `gnome/gnome_dataset_smoke.py`     | FUNCTIONAL (offline replay) | none (Zenodo download is runtime) |
| **matlantis**         | `matlantis/matlantis_call_smoke.py` | FUNCTIONAL (offline replay) | none — COMMERCIAL SDK out-of-scope |
| **omat24**            | `omat24/omat24_dataset_smoke.py`   | FUNCTIONAL (offline replay) | huggingface_hub |
| **universal_ff**      | `universal_ff/schnet_call.py`      | PARTIAL (SKIPs without schnetpack)   | schnetpack |
| **universal_ff**      | `universal_ff/mace_call.py`        | PARTIAL (SKIPs without mace-torch)   | mace-torch |
| **universal_ff**      | `universal_ff/alignn_call.py`      | PARTIAL (SKIPs without alignn)       | alignn |
| **universal_ff**      | `universal_ff/chgnet_call.py`      | PARTIAL (SKIPs without chgnet)       | chgnet |
| **universal_ff**      | `universal_ff/m3gnet_call.py`      | PARTIAL (SKIPs without matgl)        | matgl |
| **selftest**          | `selftest/materials_project_smoke.py` · `gnome_smoke.py` · `matlantis_smoke.py` · `omat24_smoke.py` · `universal_ff_smoke.py` · `sources_audit.py` | aggregators (6 total) | none |

Top-level Phase G gate: `selftest/absorption_bridge_smoke.sh` (gate 23 in
`selftest/run_all.sh`). Result: `__HEXA_MATTER_ABSORPTION_BRIDGE__ PASS
(6/6 modules, 0 skipped)` on stock Python.

Full selftest scoreboard after Phase G:
`__HEXA_MATTER_SELFTEST__ PASS (23/23)`.

Full selftest scoreboard after Phase G+1 (COD):
`__HEXA_MATTER_SELFTEST__ PASS (24/24)`.

License honesty matrix (per `_absorption_bridge/README.md`):

| System | License | Cost |
|---|---|---|
| Materials Project | CC-BY 4.0 (free API key required) | $0 |
| GNoME | CC-BY 4.0 (Zenodo DOI 10.5281/zenodo.10371563) — **PREDICTED, NOT SYNTHESIZED** | $0 |
| Matlantis | Commercial (Preferred Networks) — **UNVERIFIED at hexa-matter scale** | $$$ |
| OMat24 | CC-BY 4.0 (HuggingFace `fairchem/OMAT24`) | $0 |
| COD (Phase G+1) | CC0 / public-domain raw data (Gražulis 2009/2012) | $0 |
| SchNet / MACE / ALIGNN | MIT | $0 |
| CHGNet / M3GNet | BSD-3-Clause | $0 |

Bundled offline-replay fixtures (illustrative; tagged
`__fixture_tag__: SAMPLE FIXTURE — not real data, for selftest replay only`):
- `materials_project/cache/sample_response.json` — Si record (mp-149 schema)
- `gnome/cache/sample_record.json` — GNoME prediction record schema
- `matlantis/cache/sample_response.json` — Matlantis PFP structure→energy schema
- `omat24/cache/sample_record.json` — OMat24 DFT record schema
- `universal_ff/cache/sample_structure.json` — Si diamond-cubic 2-atom input

Honesty preservation (per `INIT.md` hard rules):
- **Rule 3 (raw#10 C3)**: NO n=6 lattice-fit on Materials Project / GNoME /
  Matlantis / OMat24 / universal-FF outputs. Each external system carries
  its OWN published error bars (DFT-PBE typical; NNP force MAE 20–60 meV/Å).
- **Rule 4 (SPEC_FIRST)**: external records INFORM hexa-matter specs; do
  not REPLACE the SPEC_FIRST verdict.
- **Rule 5 (UNPROVEN preservation)**: GNoME records carry an `is_synthesized:
  false` field + `synthesis_status: UNPROVEN — DFT prediction only`
  marker; `gnome_dataset_smoke.py` enforces these are present.
- **NO LIVE API CALLS in selftest**: every selftest reads from bundled
  fixtures. Live adapter use is a runtime concern, not CI.

SOURCES.md per subsystem (all 5 present + non-empty + carrying license +
citation/DOI/journal markers — enforced by `selftest/sources_audit.py`):
- `materials_project/SOURCES.md` — Persson et al. 2013 APL Mater. + MP API
  key signup + CC-BY 4.0
- `gnome/SOURCES.md` — Merchant et al. 2023 Nature + Zenodo DOI +
  CC-BY 4.0 + UNPROVEN discipline
- `matlantis/SOURCES.md` — Takamoto et al. 2022 Nat. Comm. + commercial
  pricing UNVERIFIED note
- `omat24/SOURCES.md` — Barroso-Luque et al. 2024 arXiv:2410.12771 +
  HuggingFace links + CC-BY 4.0
- `universal_ff/SOURCES.md` — 5-FF aggregate citation table (Schütt 2017 /
  Batatia 2022 / Choudhary 2021 / Deng 2023 / Chen 2022)

## Phase H — Category (b) parity gates ✅ DONE (2026-05-13)

10 stdlib-only parity gates landed under `tests/*_parity.py`, each
backed by a vendored source-of-truth snapshot under
`tests/snapshots/<gate_id>.json`. Each gate is ≤ 80 LOC, reads its
snapshot, locates the spec doc's value via deterministic regex, and
asserts spec↔source parity within a published tolerance. Aggregator:
`selftest/parity_gates_smoke.sh` (gate #25). Selftest scoreboard
24/24 → **25/25 PASS**.

| # | Gate | Anchor (source) | Spec doc | Tolerance |
|---|---|---|---|---|
| 1 | `cer_b2_si_density` | CRC 105th ed. (2024) p.4-87 — Si rho = 2.329 g/cm³ | `silicon/silicon.md` Si-L6 | abs 0.002 g/cm³ |
| 2 | `cer_b3_si_bandgap` | NIST WebBook + Sze 3rd ed. — Si E_g = 1.12 eV (300 K) | `silicon/silicon.md` Si-L7 | abs 0.02 eV |
| 3 | `cer_b4_sic_bandgap` | Saddow & Agarwal 2004 — 4H-SiC E_g = 3.26 eV (6H-SiC 3.02 eV) | `silicon/silicon.md` Si-L11 | abs 0.05 eV |
| 4 | `cer_b5_si3n4_flexural` | ASM Handbook vol. 21 (2001) — Si₃N₄ HIP σ_f 600-1200 MPa | `silicon/silicon.md` Si-L12 | range containment |
| 5 | `pol_b1_aramid_tensile` | ASTM D885 + DuPont Kevlar 49 datasheet + ASM vol. 21 — σ_f ≥ 3.0 GPa | `aramid/aramid.md` F-AR-Q1 | min threshold 3.0 GPa |
| 6 | `pol_b4_nylon66_tg_tm` | ASM Engineered Materials vol. 2 + CRC 105th — PA66 T_g 50-65 °C, T_m 265 °C | `POLYMER-CHEMISTRY.md` §3.2 | T_g ± 5 °C, T_m ± 3 °C |
| 7 | `fib_b2_paper_tensile` | TAPPI T494 (2021) — bleached softwood kraft tensile index ≥ 70 N·m/g | `paper/paper.md` F-PA-Q1 | min threshold 70 N·m/g |
| 8 | `met_b4_w_melting` | CRC 105th / NIST — W T_m = 3422 °C (3695 K) | `LIMIT_BREAKTHROUGH.md` refractory row | abs 1 °C |
| 9 | `met_b5_os_density` | CRC 105th / NIST WebBook — Os ρ = 22.59 g/cm³ (densest stable element) | `LIMIT_BREAKTHROUGH.md` L6 row | abs 0.02 g/cm³ |
| 10 | `gem_b1_corundum_ri` | GIA / NIST gem-RI — corundum n_d 1.762-1.770 | `gemology/gemology.md` F-GEM-Q1 | ± 0.002 |

Aggregator output (stock Python):
`__HEXA_MATTER_PARITY_GATES__ PASS (10/10 gates, 0 skipped)`.

Selftest scoreboard after Phase H:
`__HEXA_MATTER_SELFTEST__ PASS (25/25)`.

Honesty preservation (per `INIT.md` hard rules):
- **Rule 3 (raw#10 C3)**: every snapshot carries
  `n6_lattice_fit_applied: false`; NIST / CRC / ASM / TAPPI / GIA values
  flow through verbatim with provenance. NO n=6 lattice-fit applied on
  any external entity.
- **Rule 4 (SPEC_FIRST)**: gates check spec↔source parity; a passing
  gate does NOT turn the spec into a measurement. "SPEC_FIRST, not
  MEASURED here" footer stays verbatim across all 33 verb specs.
- **Rule 5 (UNPROVEN preservation)**: LK-99, magic-MOF DAC $100/t, CNT
  yarn 80 GPa lab-mm, marine-biodegradable PHA, perovskite 25-yr
  lifetime — all keep their flags. Phase H targets honestly-anchored
  values only; it does NOT close any UNPROVEN claim.
- **NO LIVE API CALLS in selftest**: every gate reads bundled snapshots
  under `tests/snapshots/`. Live retrieval (if ever needed) would be a
  Phase F research-bridge concern, not Phase H.

Ledger movement (`CLOSURE_RESIDUAL_BACKLOG.md §B`):
**29 → 19 remaining** (10 ✅ CLOSED by Phase H; 10 Phase B residual + 9
Phase F residual still UNVERIFIED).

Files added this phase:
- `tests/cer_b2_si_density_parity.py` · `tests/cer_b3_si_bandgap_parity.py`
- `tests/cer_b4_sic_bandgap_parity.py` · `tests/cer_b5_si3n4_flexural_parity.py`
- `tests/pol_b1_aramid_tensile_parity.py` · `tests/pol_b4_nylon66_tg_tm_parity.py`
- `tests/fib_b2_paper_tensile_parity.py`
- `tests/met_b4_w_melting_parity.py` · `tests/met_b5_os_density_parity.py`
- `tests/gem_b1_corundum_ri_parity.py`
- `tests/snapshots/<gate_id>.json` (10 vendored snapshots)
- `selftest/parity_gates_smoke.sh` (aggregator gate #25)

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
- `185ce33` — Phase F (`_research_bridge/` — 8 absorption modules; arxiv + vendor + news + patent; `__HEXA_MATTER_RESEARCH_BRIDGE__ PASS (3/3, 0 skipped)`; selftest scoreboard `__HEXA_MATTER_SELFTEST__ PASS (22/22)`)
- `e712068` — Phase G (`_absorption_bridge/` — 10 adapters: Materials Project / GNoME / Matlantis / OMat24 + SchNet / MACE / ALIGNN / CHGNet / M3GNet; `__HEXA_MATTER_ABSORPTION_BRIDGE__ PASS (6/6, 0 skipped)`; selftest scoreboard `__HEXA_MATTER_SELFTEST__ PASS (23/23)`)
- _(this commit)_ — Phase H (10 Category (b) parity gates under `tests/*_parity.py` + 10 vendored snapshots under `tests/snapshots/*.json` + `selftest/parity_gates_smoke.sh` aggregator gate #25; `__HEXA_MATTER_PARITY_GATES__ PASS (10/10 gates, 0 skipped)`; selftest scoreboard `__HEXA_MATTER_SELFTEST__ PASS (25/25)`; ledger CLOSURE_RESIDUAL_BACKLOG §B drained 29 → 19)

## If you're picking this up cold

1. Read this file (you just did).
2. Check Phase status table above. Find the in_progress phase.
3. `git -C /Users/ghost/core/hexa-matter status` — check working tree.
4. `git -C /Users/ghost/core/hexa-matter log --oneline -10` — confirm head.
5. Read `V1_2_0_HANDOFF.md` for the comprehensive plan.
6. Resume in the next blocked phase per the dependency graph above.
7. NEVER violate the 6 hard constraints.
