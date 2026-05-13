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

## Provenance

Extracted from `canon/domains/materials/` @ `47c70cbf` (2026-05-09).
Each copy file carries a `@canonical:` provenance header injected by
`tools/inject_provenance.hexa`. Drift checked by `tools/check_drift.hexa`.

## License

MIT.
