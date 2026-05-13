# ⚛️ hexa-matter — n=6 소재 substrate

> 29-verb materials toolkit (17 v1.0.0 + 12 Phase D 2026-05-13) organized
> around the **n=6 invariant lattice**: ceramic / polymer / fiber / gem /
> metal / synthesis / recycle (silicon joins ceramic_inorganic — material
> layer only).

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.20102811.svg)](https://doi.org/10.5281/zenodo.20102811)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-1.0.0-informational.svg)](hexa.toml)
[![Verbs: 29 spec](https://img.shields.io/badge/verbs-29_spec-blue.svg)](#verbs)
[![Verify: 4/4 PASS](https://img.shields.io/badge/verify-4%2F4_PASS-brightgreen.svg)](verify/run_all.hexa)
[![Selftest: 22/22 PASS](https://img.shields.io/badge/selftest-22%2F22_PASS-brightgreen.svg)](selftest/run_all.sh)
[![Python bridge: 12 modules](https://img.shields.io/badge/python--bridge-12_modules-blue.svg)](_python_bridge/README.md)
[![Research bridge: 8 modules](https://img.shields.io/badge/research--bridge-8_modules-blue.svg)](_research_bridge/README.md)

---

## Why

**hexa-matter** is the materials member of the HEXA family.
Twenty-nine verbs cover the working surface of industrial materials
science — from inorganic ceramics and concrete to engineered polymers,
glass, silicon (material layer), wide-bandgap compound semiconductors,
perovskite + 2D materials + MOFs + carbon allotropes, gems, metallurgy
(general + superalloy + magnetic), elastomers + adhesives + liquid
crystals + biodegradable plastics, wood/cellulose, synthesis platforms,
and circular-material flows.

Sixteen of the seventeen v1.0.0 verbs are peer-citable spec docs
copy-pasted from the upstream
[`canon/domains/materials/`](https://github.com/dancinlab/canon) tree
(SHA `47c70cbf`, 2026-05-09). The seventeenth verb — **silicon** — was
authored in-repo on 2026-05-13 under the real-limits-first policy.
**Phase D (2026-05-13) adds 12 in-repo specs** (no upstream canon
source): elastomer, compound-semi, perovskite, 2d-materials, adhesive,
magnetic-materials, mof, liquid-crystal, superalloy, biodegradable-
plastics, wood-cellulose, carbon. Each follows the silicon.md
real-limits-first template.

**Out of scope** — call sibling CLI directly:

| concern                                                       | call                          |
| ------------------------------------------------------------- | ----------------------------- |
| chip-grade semiconductor *device + fab process* (lithography, | `hexa-chip materials`         |
| EUV resist, transistor architecture, fab capacity)            |                               |
| lutherie / instrument craft                                   | (culture domain, future repo) |
| fashion-textile / dyeing                                      | (industrial-textile, future)  |

The `silicon/` verb in *this* repo covers the **material** aspect of Si
(polysilicon, mono-Si wafers, SiO₂, SiC ceramic, silicone polymer,
vendor tonnage); device + fab process stay in `hexa-chip`.

---

## Install

```bash
# 1. Install hexa-lang (gives you `hexa` + `hx` package manager)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/dancinlab/hexa-lang/main/install.sh)"

# 2. Install hexa-matter
hx install hexa-matter
```

## Run

```bash
# v1.0.0 verbs (17)
hexa-matter ceramics         # ceramics spec doc
hexa-matter concrete         # concrete spec doc
hexa-matter concrete_tech    # concrete-technology spec doc
hexa-matter glass            # hexa-glass spec doc
hexa-matter silicon          # silicon spec doc (material layer — poly-Si / mono-Si / SiO₂ / SiC)
hexa-matter aramid           # aramid spec doc
hexa-matter epoxy            # epoxy spec doc
hexa-matter nylon            # nylon spec doc
hexa-matter pet_film         # pet-film spec doc
hexa-matter tire_cord        # tire-cord spec doc
hexa-matter fabric           # hexa-fabric spec doc
hexa-matter paper            # paper spec doc
hexa-matter gemology         # gemology spec doc
hexa-matter metallurgy       # swordsmithing-anchored metallurgy spec doc
hexa-matter synthesis        # material-synthesis spec doc
hexa-matter recycle_n6       # hexa-recycle spec doc
hexa-matter recycling        # recycling spec doc

# Phase D verbs (12, added 2026-05-13)
hexa-matter compound-semi           # GaN / SiC / GaAs / InP wafer + epi (material layer)
hexa-matter perovskite              # ABX₃ oxide + halide (LK-99 UNPROVEN preserved)
hexa-matter 2d-materials            # MoS₂ / hBN / phosphorene / MXene (non-carbon 2D)
hexa-matter mof                     # metal-organic frameworks (DAC economics UNPROVEN)
hexa-matter carbon                  # diamond / CNT / fullerene / fiber / activated C
hexa-matter elastomer               # NR / SBR / EPDM / silicone / FKM
hexa-matter adhesive                # PSA / structural / cyanoacrylate / anaerobic
hexa-matter liquid-crystal          # nematic + smectic + LCP (Vectran/Kevlar dope)
hexa-matter biodegradable-plastics  # PLA / PHA / PBS (marine-biodegradable UNVERIFIED)
hexa-matter wood-cellulose          # CLT / glulam / CNF / CNC / regenerated cellulose
hexa-matter superalloy              # Inconel / CMSX / Co-base / TBC cross-link
hexa-matter magnetic-materials      # NdFeB / SmCo / Si-Fe / Metglas / Finemet

# utility
hexa-matter status           # 29-verb table + cross-link + caveats
hexa-matter selftest         # 29-verb spec doc presence check
hexa-matter version          # print version
hexa-matter help             # full --help (subcommands + env vars + cross-link)
```

## Status

Spec-first at v1.0.0 (+ Phase D 2026-05-13) — 29/29 verbs ship as
peer-citable markdown docs; working numerical sandboxes are TBD per
per-verb falsifier deadlines. CLI dispatcher prints spec headlines.

## Verify

Sister-substrate `verify/run_all.hexa` aggregator pattern, scaled to
spec-first scope. From the repo root:

```bash
hexa run verify/run_all.hexa     # exit 0 = all 4 scripts PASS
```

| script                            | what it checks                                                                   |
| --------------------------------- | -------------------------------------------------------------------------------- |
| `verify/spec_presence.hexa`       | all 29 verb spec docs present at declared paths                                  |
| `verify/lattice_arithmetic.hexa`  | n=6 self-consistency (σ·φ = n·τ = 24) — *aux only* per `LATTICE_POLICY.md` §1.3  |
| `verify/real_limits_anchor.hexa`  | `LIMIT_BREAKTHROUGH.md` anchors (NIST WebBook · CRC Handbook · Hales · Frenkel)  |
| `verify/closure_consistency.hexa` | scoreboard cross-check (CLI · `hexa.toml` · README · `AGENTS.md`)                |

Per `LATTICE_POLICY.md` §1.3, lattice-arithmetic identities are
permitted only as auxiliary self-consistency checks; the substrate's
real verification anchors live in `LIMIT_BREAKTHROUGH.md` (NIST/CRC
HARD walls). Material-science claims that remain unproven (LK-99
room-T SC, metallic hydrogen at ambient) are preserved as caveats.

## Selftest

Beyond `verify/` (which checks structural closure — file presence,
lattice arithmetic, real-limits anchors, scoreboard cross-check), the
`selftest/` harness runs 22 fine-grained content-aware gates. From the
repo root:

```bash
bash selftest/run_all.sh                # exit 0 = all 22 gates PASS
```

| Category | Count | Gates |
|---|---|---|
| Cross-cutting | 8 | `r1_symlink_audit` · `registry_consistency_audit` · `regression_audit` · `n6_axis_computational_verification` · `cross_doc_audit` · `canon_provenance_check` · `nist_anchor_audit` · `lattice_fit_on_external_entities_audit` (raw#10 C3) |
| Group-specific | 8 | `cer_thermal_shock_audit` · `pol_thermal_stability_audit` · `fib_tensile_audit` · `met_alloy_classification` · `gem_authenticity_check` · `prc_yield_audit` · `fas_dyeing_chemistry_audit` · `silicon_purity_audit` |
| Verb-specific | 4 | `compound_semi_bandgap_audit` · `magnetic_materials_curie_audit` · `carbon_cnt_strength_honesty_audit` (CNT 80 GPa caveat) · `mof_dac_economics_honesty_audit` ($100/t UNPROVEN) |
| Bridge aggregators | 2 | `pyproject_smoke` — Phase E `_python_bridge/` (12 modules; SKIPs optional-dep modules cleanly) · `research_bridge_smoke` — Phase F `_research_bridge/` (arxiv + web + sources_audit; offline-replay only) |

Honesty constraints enforced by the selftest harness:
- `lattice_fit_on_external_entities_audit` — fails if any post-policy spec
  applies n=6 lattice formulas to vendor / NIST / ITER / ASTM data (raw#10 C3)
- `carbon_cnt_strength_honesty_audit` — CNT 80 GPa must be flagged
  "lab mm-scale, commercial 1–3 GPa"
- `mof_dac_economics_honesty_audit` — magic-MOF $100/t must stay UNPROVEN
  with Climeworks $600–1000/t baseline cited

## Python bridge (Phase E)

`_python_bridge/` ships 12 runnable scientific-compute modules (Phase E,
2026-05-13) backing material specs. Each module has a `--selftest` mode
that runs offline / deterministically; modules with optional deps
(RDKit / ASE / pymatgen) SKIP cleanly when the dep is missing.

```
_python_bridge/
├── pyproject.toml                          # optional-dep declaration
├── README.md                               # bridge overview
└── module/
    ├── rdkit_smiles_audit.py               # SMILES canonicalization (RDKit)
    ├── rdkit_descriptor_calc.py            # MolWt / LogP / TPSA / HBA / HBD (RDKit)
    ├── ase_atoms_construct.py              # Si / Fe / Cu crystal builders (ASE)
    ├── ase_relaxation_check.py             # EMT relaxation smoke (ASE)
    ├── pymatgen_structure_io.py            # CIF round-trip + MP-ID regex (pymatgen)
    ├── pymatgen_phasediagram_smoke.py      # binary phase diagram smoke (pymatgen)
    ├── silicon_purity_compute.py           # 9N → ppba arithmetic (stdlib)
    ├── polymer_mw_distribution.py          # M_n / M_w / M_z / PDI (stdlib)
    ├── metallurgy_alloy_composition.py     # wt-% ↔ at-% conversion (stdlib)
    ├── carbon_form_factor_classifier.py    # CNT / diamond / fiber / etc. (stdlib + optional RDKit)
    ├── cross_doc_consistency_compute.py    # README ↔ AXIS.md ↔ hexa.toml count check (stdlib)
    └── nist_anchor_resolver.py             # NIST/CRC/ASM citation pattern parse (stdlib, offline)
```

Install optional deps:

```bash
pip install -e "_python_bridge[all]"        # RDKit + ASE + pymatgen
pip install -e "_python_bridge[chem]"       # RDKit only
pip install -e "_python_bridge[atomic]"     # ASE only
pip install -e "_python_bridge[materials]"  # pymatgen only
```

Run the bridge aggregator (also wired into `selftest/run_all.sh`):

```bash
bash selftest/pyproject_smoke.sh    # exit 0 = all 12 modules PASS or SKIP-clean
```

raw#10 C3: no module applies n=6 lattice formulas to vendor / NIST / external
data. Selftests are offline + deterministic; live external-DB fetch is
in Phase F (`_research_bridge/`, landed 2026-05-13).

## Research bridge (Phase F)

`_research_bridge/` ships 8 runnable absorption modules (Phase F,
2026-05-13) for **arxiv deep research** + **web deep research** (vendor
datasheets, materials industry RSS/Atom news, USPTO/EPO patent search).
Each module has a `--selftest` mode that runs **offline-replay only**
(no live network calls in selftest — air-gap / CI safe); live mode is
gated behind explicit `--live`.

```
_research_bridge/
├── pyproject.toml                          # optional-dep declaration (requests / feedparser / bs4)
├── README.md                               # bridge overview
├── arxiv/
│   ├── arxiv_pull.py                       # arxiv API pull (cond-mat.mtrl-sci primary, 3-sec backoff)
│   ├── arxiv_digest.py                     # verb-keyword tagging + UNPROVEN flag preservation
│   ├── arxiv_cache/sample_response.xml     # offline-replay fixture (3 synthetic papers)
│   └── SOURCES.md                          # arxiv categories + keyword strategy
├── web/
│   ├── vendor_datasheet_pull.py            # vendor HTML/PDF datasheet parse (Wacker/Wolfspeed/...)
│   ├── materials_news_feed.py              # RSS/Atom news feed poll + verb tagging
│   ├── patent_search.py                    # USPTO PatFT / EPO Espacenet public-API parse
│   ├── web_cache/                          # offline-replay fixtures (vendor HTML, RSS, patent JSON)
│   └── SOURCES.md                          # vendor URLs + RSS feeds + patent endpoints
└── selftest/
    ├── arxiv_smoke.py                      # arxiv subsystem aggregator
    ├── web_smoke.py                        # web subsystem aggregator
    └── sources_audit.py                    # SOURCES.md validity + speculative-trip-list audit
```

Run the bridge aggregator (also wired into `selftest/run_all.sh` as gate 22):

```bash
bash selftest/research_bridge_smoke.sh    # exit 0 = all 3 aggregators PASS (offline only)
```

raw#10 C3 + honest C3 enforcement:
- Vendor / arxiv / patent data is ingested AS-IS with vendor's own metrics;
  NO n=6 lattice-fit applied at ingest.
- Speculative claims (LK-99 RTSC, magic-MOF $100/t, perovskite 25-yr lifetime)
  trip the `UNPROVEN_FLAGS` list and surface with the flag attached.
- No live network call ever fires in `--selftest` — fixtures only.

## Provenance

Extracted from `canon/domains/materials/` @ `47c70cbf` (2026-05-09).
Each copy file carries a `@canonical:` provenance header injected by
`tools/inject_provenance.hexa`. Drift checked by `tools/check_drift.hexa`.

## License

MIT.
