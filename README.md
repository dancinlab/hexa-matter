# ⚛️ hexa-matter — n=6 소재 substrate

> 16-verb materials toolkit organized around the **n=6 invariant lattice**:
> ceramic / polymer / fiber / gem / metal / synthesis / recycle.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-1.0.0-informational.svg)](hexa.toml)
[![Verbs: 16 spec](https://img.shields.io/badge/verbs-16_spec-blue.svg)](#verbs)

---

## Why

**hexa-matter** is the materials member of the HEXA family. Sixteen verbs
cover the working surface of industrial materials science — from inorganic
ceramics and concrete to engineered polymers, glass, gems, metallurgy,
synthesis platforms, and circular-material flows.

Every verb is a peer-citable spec doc copy-pasted out of the upstream
[`canon/domains/materials/`](https://github.com/dancinlab/canon)
tree (SHA `47c70cbf`, 2026-05-09).

**Out of scope** — call sibling CLI directly:

| concern                            | call                          |
| ---------------------------------- | ----------------------------- |
| chip-grade semiconductor materials | `hexa-chip materials`         |
| lutherie / instrument craft        | (culture domain, future repo) |
| fashion-textile / dyeing           | (industrial-textile, future)  |

---

## Verbs (16)

| group              | verbs                                                           |
| ------------------ | --------------------------------------------------------------- |
| ceramic_inorganic  | `ceramics`, `concrete`, `concrete_tech`, `glass`                |
| polymer            | `aramid`, `epoxy`, `nylon`, `pet_film`, `tire_cord`             |
| fiber_paper        | `fabric`, `paper`                                               |
| gem_mineral        | `gemology`                                                      |
| metal              | `metallurgy` (swordsmithing-anchored)                           |
| synthesis          | `synthesis` (material-synthesis platform)                       |
| recycle            | `recycle_n6`, `recycling`                                       |

---

## Quick start

```sh
hx install hexa-matter
hexa-matter status         # 16-verb table
hexa-matter ceramics       # ceramics.md spec headline
hexa-matter selftest       # verb-count check
```

## Status

Spec-first at v1.0.0 — 16/16 verbs ship as peer-citable markdown docs;
working numerical sandboxes are TBD per per-verb falsifier deadlines. CLI
dispatcher prints spec headlines.

## Provenance

Extracted from `canon/domains/materials/` @ `47c70cbf` (2026-05-09).
Each copy file carries a `@canonical:` provenance header injected by
`tools/inject_provenance.hexa`. Drift checked by `tools/check_drift.hexa`.

## License

MIT.
