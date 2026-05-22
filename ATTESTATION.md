# D116 docs-only attestation (2026-05-22)

All substrate code migrated to `hexa-lang/stdlib/matter/` (PR dancinlab/hexa-lang#301).

This repo now holds matter-domain narrative only (markdown · physics derivation · material-family taxonomy · citation index · governance `.tape`).

Code home: `~/core/hexa-lang/stdlib/matter/` (D116 · `project.tape` @D d3 — algorithm/implementation code lives in the canonical stdlib home; topical/per-domain repos hold docs · manifests · examples only).

## What was removed

The migrated substrate (verified **byte-identical** against `hexa-lang` `stdlib/matter/` before deletion — 261/261 git blob SHAs matched · per-dir `diff -rq` identical):

- bridges — `_hexa_bridge/` (hexa compute modules + selftest audits) · `_python_bridge/` (ase/pymatgen/rdkit module bridges) · `_absorption_bridge/` (materials-DB + universal-FF adapters + smoke) · `_research_bridge/` (arxiv + web + vendor-datasheet bridges)
- harness + data — `selftest/` (audits + smoke `.sh`) · `tests/` (B-series parity tests + snapshots)
- verification — `verify/` (closure / lattice-arithmetic / real-limits-anchor / spec-presence)
- entry points — `cli/` (`hexa-matter.hexa`) · `origins/` (carbon-capture-calc + material-dse `main.hexa`)
- root substrate — `install.hexa`

Total: 261 git-tracked files · ~17.4K code LOC (`.hexa`/`.py`) + co-located fixtures/snapshots/source-docs (~23.6K total).

## What stays (D116-compliant narrative)

- material-family landing pages + closure docs — `ceramics/` · `adhesive/` · `aerogel-foam/` · `aramid/` · `biodegradable-plastics/` · `carbon/` · `compound-semi/` · `concrete/` · `concrete_tech/` · `elastomer/` · `electrode-material/` · `epoxy/` · `fabric/` · `fashion-textile/` · `gemology/` · `geopolymer/` · `glass/` · `glass-ceramic/` · `ionic-liquid/` · `liquid-crystal/` · `lutherie/` · `magnetic-materials/` · `metallurgy/` · `microplastics/` · `mof/` · `nylon/` · `paper/` · `perovskite/` · `pet_film/` · `photoresist/` · `printing/` · `recycle_n6/` · `recycling/` · `refractory/` · `silicon/` · `superalloy/` · `synthesis/` · `textile-dyeing/` · `tire_cord/` · `wood-cellulose/` · `2d-materials/`
- canon-extract narrative dirs — `hexa-ceramic/` · `hexa-fashion/` · `hexa-fiber/` · `hexa-gem/` · `hexa-metal/` · `hexa-polymer/` · `hexa-recycle/` · `hexa-silicon/` · `hexa-synthesis/`
- supporting narrative — `docs/` · `papers/` · `breakthroughs/`
- top-level narrative md (`MATERIAL-SYNTHESIS.md` · `NOVEL.md` · §8.2 material-family matrix · `CERAMICS.md` · `METALLURGY-DEEP.md` · `RARE-EARTH+ALTERNATIVE.md` · etc.) + governance `.tape` (`AGENTS.tape` · `AXIS.tape` · `CLOSURE_*.tape` · per-family `.tape`)
- manifests + metadata — `hexa.toml` · `CITATION.cff` · `LICENSE` · `README.md`
