# CLOSURE_STATUS — hexa-matter top-level closure certification

> **Issued**: 2026-05-13
> **Authority**: `AGENTS.md` + `AXIS_CLOSURE_PLAN.md §0` (Category (a)/(b)/(c) framework, adopted from `hexa-bio/AXIS_CLOSURE_PLAN.md` cycle-30)
> **Status verdict**: ✅ **Category (a) + Category (b) closure = 100%** as of 2026-05-13
> **Companion ledgers**: `CLOSURE_RESIDUAL_BACKLOG.md` (per-row §A/§B/§C ledger) · `INIT.md` (Phase A–I status table) · `RELEASE_NOTES_v1.2.0.md` (this elevation's release notes)

This file is the single-page certification document for the hexa-matter
substrate's closure-grade. It states the scope of the "100% closure"
claim, enumerates every gate that backs it, and is explicit about what
"100%" does **NOT** mean.

---

## 1. Scoreboard (as of 2026-05-13)

> **Note — scoreboard count is dynamic**: parallel rounds may extend the
> selftest gate count (e.g. 28 → 30) without changing the (a)+(b)=100%
> verdict. Read counts here as the value at this commit; the verdict is
> stable, the counts are evolving.

| Surface                       | Result at this commit  | Source                                        |
|-------------------------------|------------------------|-----------------------------------------------|
| `verify/run_all.hexa`         | **4/4 PASS**           | `verify/{spec_presence, lattice_arithmetic, real_limits_anchor, closure_consistency}.hexa` |
| `selftest/run_all.sh`         | **28/28 PASS**         | 8 cross-cutting + 8 group-specific + 4 verb-specific + 7 bridge/adapter + 1 parity-gates aggregator |
| Verb specs                    | **36 verbs**           | 17 v1.0.0/v1.1.0 + 12 Phase D + 4 Phase D' + 3 Phase D'' |
| Absorption-bridge adapters    | **14 adapters**        | 10 Phase G + 1 Phase G+1 (COD) + 3 Phase G+2 (OQMD, AFLOW, NOMAD) |
| Category (b) parity gates     | **29 gates / 29 CLOSED** | 10 Phase H + 10 Phase I.1 + 9 Phase I.2 under `tests/*_parity.py` + `tests/snapshots/*.json` |

A live re-run of `bash selftest/run_all.sh` returns
`__HEXA_MATTER_SELFTEST__ PASS (28/28)`; `hexa run verify/run_all.hexa`
returns `4/4 scripts passed`. Both numbers are observed at this commit
and recorded in `hexa.toml [closure]`.

---

## 2. Closure path — phase-by-phase

The path from v1.0.0 (16 verbs, retroactive release notes) to today's
(a)+(b)=100% certification:

```
A → D → D' → D'' → B → C → E → F → G → G+1 → G+2 → H → I.1 → I.2
```

Verb additions: A (silicon, 16→17) → D (+12, 17→29) → D' (+4, 29→33) →
D'' (+3, 33→**36**).

Absorption adapters: G (+10) → G+1 (+1 COD) → G+2 (+3 OQMD/AFLOW/NOMAD)
= **14 adapters**.

Parity gates (Category (b)): H (+10) → I.1 (+10) → I.2 (+9) = **29 gates**.

Roll-up: 16 v1.0.0 verbs + 1 silicon + 19 Phase D/D'/D'' = 36 verbs;
14 adapters; 29 parity gates; 28 selftest gates; 4 verify scripts.

For phase-by-phase commit-SHA mapping, see `INIT.md` §"Commit log (this
elevation)" and `RELEASE_NOTES_v1.2.0.md` §"Phase-by-phase rollup".

---

## 3. Category (a) — in-repo SW/spec closure ✅ 100%

Per `AXIS_CLOSURE_PLAN.md §0`: closeable by code/test/spec work in this
repo; **counts against the v1.x closure-grade**.

Backing artifacts:

- **36/36 verb spec docs present** — `verify/spec_presence.hexa` PASS
- **`hexa.toml [verbs]` ≡ CLI ≡ AXIS.md ≡ README badge ≡ AGENTS.md** — `verify/closure_consistency.hexa` PASS
- **n=6 lattice arithmetic self-consistency** (σ·φ = n·τ = 24) — `verify/lattice_arithmetic.hexa` PASS (auxiliary only per `LATTICE_POLICY.md §1.3`)
- **`LIMIT_BREAKTHROUGH.md` real-limits anchors** (NIST · CRC · Hales · Frenkel) — `verify/real_limits_anchor.hexa` PASS
- **28 selftest gates** — `selftest/run_all.sh` returns `__HEXA_MATTER_SELFTEST__ PASS (28/28)`
- **14 absorption adapters** under `_absorption_bridge/` — each ships `--selftest` offline-replay fixtures with SOURCES.md license + citation

See `CLOSURE_RESIDUAL_BACKLOG.md §A` for the per-row enumeration —
**all rows ✅ CLOSED 2026-05-13**.

---

## 4. Category (b) — formal/empirical material-property parity ✅ 100%

Per `AXIS_CLOSURE_PLAN.md §0`: NIST/CRC/ASM/SEMI/ASTM/TAPPI/AATCC/ISO/
vendor-datasheet-anchored values matched against the spec corpus via
deterministic stdlib parity gates.

29 enumerated gates → **29 ✅ CLOSED 2026-05-13** under `tests/*_parity.py`
+ `tests/snapshots/*.json`, swept by `selftest/parity_gates_smoke.sh`
(`__HEXA_MATTER_PARITY_GATES__ PASS (29/29 gates, 0 skipped)`).

| #  | Gate                              | Anchor                                                              |
|----|-----------------------------------|---------------------------------------------------------------------|
|  1 | `cer_b1_quartz_ri`                | NIST SRM 1960 quartz — α-quartz n_d 1.5443 @ 589.3 nm               |
|  2 | `cer_b2_si_density`               | CRC 105th ed. — Si ρ = 2.329 g/cm³                                  |
|  3 | `cer_b3_si_bandgap`               | NIST WebBook + Sze 3rd ed. — Si E_g = 1.12 eV (300 K)               |
|  4 | `cer_b4_sic_bandgap`              | Saddow & Agarwal 2004 — 4H-SiC E_g = 3.26 eV                        |
|  5 | `cer_b5_si3n4_flexural`           | ASM Handbook vol. 21 — Si₃N₄ HIP σ_f 600–1200 MPa                   |
|  6 | `cer_b6_uhpc_compressive`         | Ductal + Cor-Tuf datasheets — σ_c 150–800 MPa                       |
|  7 | `cer_b7_mohs_hardness`            | Mohs 1812 + NIST SRD — 10-stop ladder talc(1) → diamond(10)         |
|  8 | `cer_b8_si_thermal_donor`         | Kaiser & Frisch 1958 + SEMI MF1188                                  |
|  9 | `cer_b9_si_oxygen_interstitial`   | ASTM F121 / F1188 — [O_i] 10–30 ppma                                |
| 10 | `pol_b1_aramid_tensile`           | ASTM D885 + DuPont Kevlar 49 + ASM vol. 21 — σ_f ≥ 3.0 GPa          |
| 11 | `pol_b2_pet_hydrolysis_ea`        | Marshall et al. 1988 + Toray — E_a 75–100 kJ/mol                    |
| 12 | `pol_b3_microplastic_kd`          | NOAA Marine Debris + Mato 2001 + Rochman 2013                       |
| 13 | `pol_b4_nylon66_tg_tm`            | ASM vol. 2 + CRC 105th — T_g 50–65 °C, T_m 265 °C                   |
| 14 | `pol_b5_uhmwpe`                   | DSM Dyneema SK99 datasheet — σ_t 3.9 GPa                            |
| 15 | `pol_b6_cnt_yarn`                 | Tsinghua Bai 2018 — 80 GPa **UNPROVEN at commodity scale preserved**|
| 16 | `fib_b1_cellulose_segal`          | TAPPI T 271 + Segal 1959 — kraft cellulose CrI 60–80 %              |
| 17 | `fib_b2_paper_tensile`            | TAPPI T494 — bleached softwood kraft tensile index ≥ 70 N·m/g       |
| 18 | `met_b1_inconel718_creep`         | ASM vol. 1 + Special Metals — IN718 ≥ 690 MPa @ 650 °C, 100 h       |
| 19 | `met_b2_ti64_transus`             | ASM vol. 2 — Ti-6Al-4V β-transus 995 °C                             |
| 20 | `met_b3_aisi1080_ttt`             | ASM vol. 4 + Bain 1930 — TTT nose / bainite / Ms                    |
| 21 | `met_b4_w_melting`                | CRC 105th / NIST — W T_m = 3422 °C                                  |
| 22 | `met_b5_os_density`               | CRC 105th / NIST WebBook — Os ρ = 22.59 g/cm³ (densest stable)      |
| 23 | `gem_b1_corundum_ri`              | GIA / NIST gem-RI — corundum n_d 1.762–1.770                        |
| 24 | `gem_b2_ruby_rline`               | NIST + Sugano-Tanabe-Kamimura — ruby Cr³⁺ R₁ 694.3 nm @ 300 K       |
| 25 | `prc_b1_hales_packing`            | Hales 2005/2017 formal proof — FCC/HCP π/(3√2) ≈ 0.7405             |
| 26 | `prc_b2_recycling_gibbs`          | ISO 14040 + Gibbs ideal-mixing floor                                |
| 27 | `prc_b3_solgel_teos`              | Hench & West 1990 + Brinker & Scherer 1990                          |
| 28 | `fas_b1_reactive_dye_yield`       | ISO 105-X12 + ICI Procion-H + Aspland 1997 — yield ≥ 60 %           |
| 29 | `fas_b2_kubelka_munk`             | AATCC TM6 + Kubelka-Munk 1931 closed-form K/S identity              |

See `CLOSURE_RESIDUAL_BACKLOG.md §B` — drained 29 → 0.

---

## 5. Category (c) — wet-lab / vendor / fab ❌ OUT-OF-REPO BY DESIGN

Per `AXIS_CLOSURE_PLAN.md §0`: wet-lab synthesis / vendor procurement /
fab capacity / regulatory pathway. **100% impossible in software** —
closeable only via external execution. **NOT counted against the v1.x
closure-grade.**

Per `LIMIT_BREAKTHROUGH.md`, the wall classification of the residual
material claims:

| Claim                                          | Wall class                  | Note                                                                                |
|------------------------------------------------|-----------------------------|-------------------------------------------------------------------------------------|
| Theoretical tensile σ_th ≈ E/10                | **HARD_WALL** (L1)          | BREAKABLE_WITH_TECH only on closing σ_real → σ_th defect gap                        |
| Practical tensile (CNT fiber on path)          | **SOFT_WALL** (L2)          | engineering still 1–2 OOM below theoretical                                         |
| Specific strength toward CNT / graphene        | **SOFT_WALL** (L3)          | assembly-scale problem                                                              |
| Mohs hardness 10 (diamond / lonsdaleite)       | **HARD_WALL** (L4)          | ~2× diamond is theoretical ceiling                                                  |
| Refractory T_m ~ 4200 K                        | **HARD_WALL** (L5)          | bound by C-C / metal-C bond energies                                                |
| Density 22.59 g/cm³ (Os)                       | **HARD_WALL** (L6)          | heaviest stable element                                                             |
| Glass transition T_g                           | **SOFT_WALL** (L7)          | compositional; BMGs + vitrified ceramics still open                                 |
| Concrete compressive σ_c                       | **SOFT_WALL** (L8)          | UHPC / RPC engineering frontier                                                     |
| Thermal conductivity k_max                     | **SOFT_WALL near HARD** (L9)| phonon-limited; ~5000 W/m·K for covalent solids                                     |
| Stefan-Boltzmann radiative floor               | **HARD_WALL** (L10)         | cross-substrate with `hexa-physics`                                                 |
| Kepler packing 0.7405                          | **HARD_WALL** (L11)         | Hales 2017 formal proof                                                             |
| Entropy of mixing (recycling separation)       | **HARD_WALL** (L12)         | Gibbs ΔS_mix floors infinite-recycle                                                |
| LK-99 room-T SC reproduction                   | **HARD_WALL UNPROVEN**      | 2023 null reproduction; preserved verbatim                                          |
| Metallic hydrogen at ambient                   | **HARD_WALL UNPROVEN**      | preserved verbatim                                                                  |
| Magic-MOF DAC $100/t                           | **HARD_WALL UNPROVEN**      | Climeworks amine baseline $600–1000/t                                               |
| CNT yarn 80 GPa at commodity scale             | **HARD_WALL UNPROVEN**      | lab mm-scale only; commercial 1–3 GPa                                               |
| Marine-biodegradable PHA (generic)             | **UNVERIFIED**              | only specific PHA D7081-certified grades                                            |
| L5 autonomy (cross-substrate `hexa-mobility`)  | **UNVERIFIED**              | not a hexa-matter claim; preserved as cross-substrate caveat                        |
| GNoME 2.2M stable crystals                     | **PREDICTED NOT SYNTHESIZED** | DFT prediction only; flagged in `_absorption_bridge/gnome/`                       |
| Matlantis PFP at hexa-matter scale economics   | **COMMERCIAL UNVERIFIED**   | Preferred Networks proprietary; pricing not vendored                                |
| Re-free 4th-gen single-crystal superallow      | **UNVERIFIED**              | parity to Re-bearing CMSX UNVERIFIED                                                |

Enumerated wet-lab / vendor / fab residual rows: **15 items** in
`CLOSURE_RESIDUAL_BACKLOG.md §C`, ALL at DEST: vendor-numbers-only /
HARD_WALL / cross-domain. **None** have an active wet-lab partnership
or formal contract — the software side is ready, the external counterparty
selection is not a software task.

---

## 6. Honesty preservation invariants

Every (a)+(b) closure gate must respect these invariants. Violation is BAD.

| #  | Invariant                                                                                        | Authority                                       |
|----|--------------------------------------------------------------------------------------------------|-------------------------------------------------|
| 1  | **Real-limits-first** — project ceiling set by REAL math/physics/eng limits, NOT n=6 lattice     | `LATTICE_POLICY.md §1.2`                        |
| 2  | **n=6 is auxiliary** — lattice is a tool, not a constraint; never force-map onto external domains | `LATTICE_POLICY.md §1.3`                        |
| 3  | **No n=6 lattice-fit on external entities** — vendors / NIST / ITER use THEIR own invariants     | `raw#10 C3` enforced by `selftest/lattice_fit_on_external_entities_audit.py` |
| 4  | **SPEC_FIRST verdict preserved** — "SPEC_FIRST, not MEASURED here" footer in every verb spec; passing parity gate ≠ measurement | `INIT.md` rule 4                                |
| 5  | **UNPROVEN / UNVERIFIED stamps preserved verbatim** — LK-99 / metallic-H / MOF-DAC / CNT-yarn / etc. | `INIT.md` rule 5; `selftest/{carbon_cnt_strength, mof_dac_economics}_honesty_audit.py` |
| 6  | **`LIMIT_BREAKTHROUGH.md` authoritative on wall classification** — HARD_WALL / SOFT_WALL / BREAKABLE_WITH_TECH / UNCLEAR | `INIT.md` rule 6                                |

Every snapshot under `tests/snapshots/*.json` carries
`n6_lattice_fit_applied: false` so the raw#10 C3 invariant is machine-
checkable. Every Phase G adapter SOURCES.md carries license + citation +
status (CC-BY 4.0 / CC0 / MIT / BSD-3 / **COMMERCIAL UNVERIFIED**) so the
license-honesty matrix is machine-checkable. Every verb spec footer
declares "SPEC_FIRST, not MEASURED here" so the parity gates cannot
silently promote spec to measurement.

---

## 7. What 100% does NOT mean

The (a)+(b)=100% verdict is **audit-trail discipline within an enumerated
scope** — it is NOT a claim about real-world material behavior.

In particular, 100% (a)+(b) closure **does NOT** mean:

- **Every material claim in the corpus is true.** UNPROVEN/UNVERIFIED
  markers exist precisely because the underlying physical claim has not
  been independently reproduced. LK-99 stays HARD_WALL. CNT yarn 80 GPa
  stays "lab mm-scale only". Magic-MOF DAC $100/t stays UNPROVEN.
  Marine-biodegradable PHA stays UNVERIFIED at commodity scale. Closing
  the parity gate verifies the spec quotes the source faithfully; it does
  NOT verify the source's claim.
- **Wet-lab synthesis works as written.** Per `CROSS_LINK.md §6` and
  `AXIS_CLOSURE_PLAN.md §0`, every vendor / fab / mill carries its own
  measurement layer. We do not synthesize. We do not pour concrete. We
  do not pull silicon. The 100% verdict is a software-discipline verdict.
- **Vendor numbers have been audited by us.** The `raw#10 C3` discipline
  is: vendor numbers vendored AS-IS with provenance; NO lattice-fit on
  them. We name the vendor, we cite the SKU / datasheet / standard, we
  do not re-derive their measurement. The audit trail is honest about
  what we did and did not touch.
- **Predictions count as measurements.** GNoME 2.2M predicted stable
  crystals are flagged `is_synthesized: false` + `synthesis_status:
  UNPROVEN — DFT prediction only`. Materials Project / OMat24 / OQMD /
  AFLOW / NOMAD DFT entries are PBE predictions with published error
  bars; we do NOT promote them to measurements. The 100% verdict counts
  the adapter as wired, not the prediction as fact.
- **The n=6 lattice has been validated as load-bearing.** Per
  `LATTICE_POLICY.md §1.2/§1.3`, n=6 is an organizing tool. The (b)
  parity gates are anchored on NIST/CRC/ASM/SEMI/ASTM/TAPPI/AATCC/ISO/
  vendor datasheets — the n=6 invariant lattice is checked separately
  (`verify/lattice_arithmetic.hexa`) as auxiliary self-consistency only.

What 100% (a)+(b) closure **DOES** mean: the spec↔source parity is
audit-trail-clean within the enumerated 36-verb + 4-script + 28-gate +
14-adapter + 29-parity-gate scope. Every cited number in the corpus has
either a NIST/CRC/ASM/vendor source row that matches it, or an UNPROVEN
flag that says it does not. There are no silent claims.

Category (c) — the wet-lab / vendor / fab layer — remains permanently
OUT-OF-REPO by definition. Software-side discipline (raw#10 C3) is in
place; closing (c) requires real-world counterparty selection that is
not a software task.

---

*Document authored 2026-05-13 by 박민우 <nerve011235@gmail.com> as the
top-level Category (a)+(b) closure certification. Sister-of-pattern:
`hexa-bio/CLOSURE_STATUS.md` (cycle-30, 2026-05-12). Honest C3 — this
file does not change any closure-grade percentage; it certifies and
scopes the percentage already established by `verify/run_all.hexa`,
`selftest/run_all.sh`, and `CLOSURE_RESIDUAL_BACKLOG.md`.*
