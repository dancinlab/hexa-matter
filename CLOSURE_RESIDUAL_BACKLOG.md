# CLOSURE_RESIDUAL_BACKLOG — hexa-matter (b)/(c) deferral ledger

> **Created**: 2026-05-13 (Phase A elevation) · **Last sync**: 2026-05-13
> **Sister**: `AXIS_CLOSURE_PLAN.md` §10 roll-up — this file is the per-row
> enumeration of items deferred from category (a) v1.x scope.
>
> The closure-grade percentages in `README.md` Status section and `hexa.toml
> [verify].verdict = "CLOSED"` count **category (a) only** — in-repo
> software/spec work. That counts to **100%** as of 2026-05-13 (silicon
> close at `a239611`).
>
> Category (b) and (c) residuals do NOT subtract from the v1.x closure-grade,
> but they MUST be enumerated honestly so the percentage is interpretable.

---

## §0 Residual category legend (verbatim from AXIS_CLOSURE_PLAN.md §0)

- **(a) in-repo software** — closeable by code/test/spec work in this repo; **counts against v1.x closure-grade**. ✅ **100% REACHED 2026-05-13.**
- **(b) measured-data parity / Phase B/F stretch** — NIST/CRC/ASM/SEMI anchored values matched against measured datasets via deterministic parity gates; v1.x cert surrogate = the `LIMIT_BREAKTHROUGH.md` Wave M audit with explicit `BREAKABLE_WITH_TECH` / `HARD_WALL` annotations. **Deferred to v1.1.x / v1.2.x by design** — does NOT subtract from v1.x.
- **(c) out-of-software-scope** — wet-lab synthesis / vendor procurement / fab capacity / regulatory pathway. **100% IMPOSSIBLE in software** — closeable only via external execution.

---

## §A — Category (a) in-repo software residuals

✅ **ALL CLOSED 2026-05-13** with the silicon addition.

The path to (a) 100%:
- 2026-05-09: 16-verb v1.0.0 imported from `canon/domains/materials/` @ `47c70cbf`
- 2026-05-12: LATTICE_POLICY.md + LIMIT_BREAKTHROUGH.md Wave M audit landed (raw#10 C3 discipline locked in)
- 2026-05-13: microplastics absorbed from hexa-medic (Phase D candidate verb dropped early into POL group)
- 2026-05-13: **silicon** authored in-repo (commit `a239611`) — 17th verb, cross-links into CER ∩ MET ∩ PRC
- 2026-05-13: `verify/run_all.hexa` aggregator reached 4/4 PASS

| Item | Status | Sentinel |
|------|--------|----------|
| 17/17 verb spec docs present | ✅ CLOSED 2026-05-13 | `verify/spec_presence.hexa` PASS |
| n=6 lattice arithmetic self-consistency (σ·φ=24, n·τ=24) | ✅ CLOSED 2026-05-12 | `verify/lattice_arithmetic.hexa` PASS (aux per LATTICE_POLICY §1.3) |
| LIMIT_BREAKTHROUGH.md real-limits anchored (NIST/CRC/Hales/Frenkel) | ✅ CLOSED 2026-05-12 | `verify/real_limits_anchor.hexa` PASS |
| Scoreboard cross-check (CLI · hexa.toml · README · AGENTS.md) | ✅ CLOSED 2026-05-13 | `verify/closure_consistency.hexa` PASS |

**Outcome**: hexa-matter v1.x (a) → **100%**. The v1.x closure-grade verdict in `hexa.toml [verify].verdict = "CLOSED"` is honest.

---

## §B — Category (b) measured-data parity gates (queued for Phase B/F)

These items are the deterministic parity gates between **the values cited in `LIMIT_BREAKTHROUGH.md` / `silicon/silicon.md` / per-verb spec docs** and **the measured datasets** in NIST SRD / CRC / ASM / SEMI / ASTM. Each item lists the source citation, the parity target, and the deferred Phase.

Phase B is the per-verb selftest implementation phase; Phase F is the live-database research bridge. Both are queued behind Phase A (this commit).

### B-CER (GROUP_CER ceramic)

| ID | Gate | Source | Status |
|----|------|--------|--------|
| B-CER-1 | NIST SRM quartz refractive-index parity vs `glass/glass.md` claim | NIST SRM 1960 quartz | Phase B target |
| B-CER-2 | Si density CRC 2.329 g/cm³ vs `silicon/silicon.md` Si-L6 | CRC Handbook 105th ed. | Phase B target |
| B-CER-3 | Si bandgap NIST/Sze 1.12 eV vs `silicon/silicon.md` Si-L7 | NIST / Sze SM Physics 3rd ed. | Phase B target |
| B-CER-4 | SiC bandgap 3.26 eV (4H-SiC) vs `silicon/silicon.md` Si-L11 | Saddow & Agarwal 2004 | Phase B target |
| B-CER-5 | Si₃N₄ flexural strength 600-1200 MPa (HIP) vs `silicon/silicon.md` Si-L12 | ASM Handbook vol. 21 | Phase B target |
| B-CER-6 | UHPC compressive σ 200-800 MPa range parity | Ductal / Cor-Tuf datasheet vs L8 LIMIT_BREAKTHROUGH | Phase F (research bridge to vendor datasheets) |
| B-CER-7 | Mohs hardness ladder NIST parity (talc 1 → diamond 10) | Mohs 1812 + NIST SRD | Phase B target |
| B-CER-8 | Thermal donor concentration in CZ Si post-anneal (Si-L8 ≈ 10¹⁶ cm⁻³) | Kaiser-Frisch 1958; Bullis SEMI | Phase F (literature aggregation) |
| B-CER-9 | [O_i] interstitial oxygen in CZ wafer (Si-L9 10-30 ppma) | ASTM F121 / F1188 | Phase F |

### B-POL (GROUP_POL polymer)

| ID | Gate | Source | Status |
|----|------|--------|--------|
| B-POL-1 | Kevlar 49 aramid σ 3.6 GPa / E 124 GPa / ρ 1.44 g/cm³ parity | ASM Handbook vol. 21; CRC | Phase B target |
| B-POL-2 | PET hydrolysis activation energy E_a parity | Marshall et al. 1988 + Toray datasheet | Phase B target |
| B-POL-3 | Microplastics K_d (PE, PP, PS partition coefficient) parity | NOAA Marine Debris Program | Phase F |
| B-POL-4 | Nylon-6,6 T_g 323 K / T_m 538 K parity | CRC Handbook | Phase B target |
| B-POL-5 | UHMWPE (Dyneema SK99) σ 3.9 GPa / E 132 GPa parity | DSM Dyneema datasheet | Phase F |
| B-POL-6 | CNT yarn σ 80 GPa (lab) parity | Tsinghua / IBS published | Phase F (lab-published data aggregation) |

### B-FIB (GROUP_FIB fiber)

| ID | Gate | Source | Status |
|----|------|--------|--------|
| B-FIB-1 | Cellulose crystallinity (Segal index from XRD) parity | TAPPI T 271 / Segal 1959 | Phase B target |
| B-FIB-2 | Paper tensile (kraft, newsprint) parity | TAPPI T 494 | Phase B target |

### B-MET (GROUP_MET metal)

| ID | Gate | Source | Status |
|----|------|--------|--------|
| B-MET-1 | Inconel 718 creep at 650 °C parity | ASM Handbook vol. 1; Special Metals datasheet | Phase B target |
| B-MET-2 | Ti-6Al-4V α-β transformation T 1268 K parity | ASM Handbook vol. 2 | Phase B target |
| B-MET-3 | AISI 1080 TTT diagram parity (austenite → bainite/martensite) | ASM Handbook vol. 4 | Phase B target |
| B-MET-4 | W melting point 3695 K parity | NIST | Phase B target (trivial, but for symmetry) |
| B-MET-5 | Os density 22.59 g/cm³ parity | NIST | Phase B target |

### B-GEM (GROUP_GEM gem)

| ID | Gate | Source | Status |
|----|------|--------|--------|
| B-GEM-1 | Corundum refractive index n_d 1.762-1.770 parity | NIST | Phase B target |
| B-GEM-2 | Ruby Cr³⁺ R-line fluorescence 694.3 nm parity | NIST / Sugano-Tanabe-Kamimura | Phase B target |

### B-PRC (GROUP_PRC process)

| ID | Gate | Source | Status |
|----|------|--------|--------|
| B-PRC-1 | Hales packing simulation parity (FCC/HCP 0.7405) | Hales 2017 formal proof | Phase B target (numerical check) |
| B-PRC-2 | Gibbs ΔS_mix recycling-energy parity | ISO 14040 LCA + Gibbs | Phase F |
| B-PRC-3 | Sol-gel TEOS hydrolysis rate parity | Hench & West 1990 | Phase F |

### B-FAS (GROUP_FAS fashion)

| ID | Gate | Source | Status |
|----|------|--------|--------|
| B-FAS-1 | Reactive dye covalent yield parity | ISO 105 | Phase B target |
| B-FAS-2 | K/S (Kubelka-Munk) for mordant-dyeing parity | AATCC test method 6 | Phase B target |

### §B — Summary

| Group | (b) gates queued | Phase target |
|-------|--------------------|--------------|
| CER   | 9 | Phase B (5) + Phase F (4) |
| POL   | 6 | Phase B (3) + Phase F (3) |
| FIB   | 2 | Phase B (2) |
| MET   | 5 | Phase B (5) |
| GEM   | 2 | Phase B (2) |
| PRC   | 3 | Phase B (1) + Phase F (2) |
| FAS   | 2 | Phase B (2) |
| **Total** | **29** | Phase B target = 20, Phase F target = 9 |

**Honest C3**: every one of the 29 gates above is `UNVERIFIED` as of 2026-05-13. The values cited in spec docs are SPEC-LEVEL (vendor-published / textbook-cited / NIST/CRC-anchored) but no `tests/*_parity.py` has been authored yet to do a deterministic numerical comparison. Phase B will close the Phase B target subset (~20 gates) by implementing per-gate parity scripts; Phase F will close the Phase F subset (~9 gates) by adding a research bridge to live databases.

---

## §C — Category (c) out-of-software-scope (wet-lab / vendor / fab handoff)

**These cannot be closed in software.** Enumerated for visibility and DEST: tracking.

### C-CER (ceramic)

| ID | Item | DEST |
|----|------|------|
| C-CER-1 | Wacker polysilicon batch lot purity audit | Wacker Polysilicon AG — vendor numbers only (no contract; raw#10 C3 discipline preserved — no lattice fit applied) |
| C-CER-2 | Wolfspeed SiC wafer fabrication audit | Wolfspeed Inc. — vendor datasheet only |
| C-CER-3 | LK-99 room-T SC reproduction | DEST: none yet (2023 LK-99 null reproduction; HARD_WALL until peer-reviewed reproduction per `LIMIT_BREAKTHROUGH.md` §4.) |
| C-CER-4 | Antiferroelectric perovskite growth | DEST: out-of-scope; Phase D candidate (PEROVSKITE.md stub) |
| C-CER-5 | Isotope-separated Si-28 production for quantum compute | DEST: International Avogadro Project / quantum-compute consortia (e.g., Diraq, SQC) |
| C-CER-6 | UHPC industrial pour scale-up | DEST: Lafarge-Holcim / Cemex (vendor numbers only) |
| C-CER-7 | High-purity quartz mining (Spruce Pine NC) | DEST: Sibelco / The Quartz Corp (vendor numbers only) |

### C-POL (polymer)

| ID | Item | DEST |
|----|------|------|
| C-POL-1 | DuPont / BASF / Toray polymer batch trace | Vendor partnerships (none active; vendor datasheet only) |
| C-POL-2 | Microplastics open-ocean field campaign | 5 Gyres / Algalita / NOAA |
| C-POL-3 | DuPont para-aramid (Kevlar) synthesis pilot | Out-of-scope — proprietary process |

### C-MET (metal)

| ID | Item | DEST |
|----|------|------|
| C-MET-1 | Single-crystal turbine blade casting pilot | PCC Aerostructures / Howmet / Doncasters (vendor numbers only) |
| C-MET-2 | Luthier studio (Stradivari method) reproduction | Out-of-scope (culture domain) |

### C-GEM (gem)

| ID | Item | DEST |
|----|------|------|
| C-GEM-1 | Lab-grown diamond CVD/HPHT bench | Element Six / Diamond Foundry (vendor numbers only) |
| C-GEM-2 | Gem treatment audit (heat, irradiation) | GIA (Gemological Institute of America) — diagnostic only |

### C-PRC (process)

| ID | Item | DEST |
|----|------|------|
| C-PRC-1 | Chemical recycling pilot | Eastman / Loop Industries (vendor numbers only) |
| C-PRC-2 | Powder-bed printing pilot | EOS / 3D Systems / Stratasys (vendor numbers only) |

### C-FAS (fashion)

| ID | Item | DEST |
|----|------|------|
| C-FAS-1 | Dye-house pilot (reactive / mordant) | Out-of-scope — industrial textile supply chain |
| C-FAS-2 | Natural-dye revival (indigo fermentation) | DEST: cross-domain — hexa-bio fermentation chapter overlap |

### §C — Handoff destination matrix

| ID | Type | Sister repo | External API / vendor | Status |
|----|------|-------------|----------------------|--------|
| C-CER-1 Wacker | vendor audit | none | Wacker AG public reporting | DEST: vendor-numbers-only (raw#10 C3 discipline) |
| C-CER-2 Wolfspeed | vendor audit | none | Wolfspeed datasheets | DEST: vendor-numbers-only |
| C-CER-3 LK-99 | lab reproduction | none | none | DEST: HARD_WALL (peer-review pending) |
| C-CER-5 Si-28 | quantum compute | possible hexa-chip overlap | Avogadro Project | DEST: research consortium |
| C-POL-2 microplastics | field campaign | possible hexa-earth overlap | NOAA / EPA | DEST: cross-domain |
| C-MET-1 turbine blade | aerospace | none | PCC / Howmet | DEST: vendor-numbers-only |
| C-FAS-2 indigo ferm | cross-domain | hexa-bio fermentation | none | DEST: cross-domain |

**Observation (2026-05-13)**: ALL 15 (c) items are at DEST: vendor-numbers-only or DEST: HARD_WALL or DEST: cross-domain. **NONE** of them have an active wet-lab partnership or formal contract. The raw#10 C3 discipline (no lattice-fit on Wacker/GCL/Wolfspeed/etc.; use the entity's own published numbers) is maintained because we never claim the vendor's data is anything beyond what the vendor published. Software's job is to keep handoff surfaces clean.

---

## §D — Roll-up

| Category | Items | Effort to 100% | v1.x closure-grade impact |
|----------|-------|----------------|---------------------------|
| (a) in-repo software | 17 verbs + 4 verify scripts | **0 days remaining — ✅ (a) 100% REACHED 2026-05-13** | YES — all (a) gaps closed |
| (b) measured-data parity | 29 gates (20 Phase B + 9 Phase F) | Phase B/F (weeks-to-months) | NO direct — Phase B target enables v1.1.x stretch |
| (c) out-of-software-scope | 15 items, all DEST: vendor-numbers / HARD_WALL / cross-domain | ∞ (external execution; software ready with raw#10 C3 discipline) | NO — handed off |
| **Total** | **48 enumerated rows** | — | — |

**Honest reading of "100% closure 가능?"**:

- **(a)** ✅ **DONE 2026-05-13** — all 17 verbs spec-present, all 4 verify scripts PASS, scoreboard self-consistent. **v1.x (a) = 100%.**
- **(b)** ~29 parity gates queued for Phase B/F. None of these subtract from v1.x. Closing them lifts v1.1.x / v1.2.x.
- **(c)** ~15 wet-lab / vendor / fab items. Software-side discipline is in place (raw#10 C3 — no lattice-fit on external entities; vendor numbers vendored honestly). Closing the (c) items requires real-world counterparty selection that is not a software task.

---

## §E — Self-update protocol

When a (b) parity gate lands or a (c) destination changes:
- **(b) gate lands** → Phase B/F: implement `tests/<group>_<gate>_parity.py`, wire into `verify/run_all.hexa`, flip the §B status from "Phase B/F target" to "✅ CLOSED `<date>`".
- **(c) DEST changes** → update the §C matrix DEST column. New vendor partnership → log the partnership document URL in the row.

raw_91 honest C3: this file is a *deferral ledger*, not a verification artifact. It does not change any closure-grade percentage; it makes the residual structure honest so the percentage is interpretable.

---

*Document authored 2026-05-13 by 박민우 <nerve011235@gmail.com> as Phase A elevation. (b)/(c) framework adapted from `hexa-bio/CLOSURE_RESIDUAL_BACKLOG.md` (cycle-30, 2026-05-12).*
