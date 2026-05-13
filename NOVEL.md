# NOVEL.md — Novel material candidates (신소재)

> **Working ledger** of de-novo-designed novel material candidates from
> hexa-matter, modeled on `hexa-bio/.roadmap.novel_drugs` pattern. Tracks
> candidates that are **not in canonical material databases** (NIST WebBook
> / CRC / Materials Project / GNoME / OMat24) at design time.
>
> **SPEC_FIRST**: entries are design hypotheses, not measurements. Per
> [`LATTICE_POLICY.md`](LATTICE_POLICY.md) §1.2/§1.3, real-limits-first.
> Per raw#10 C3, no n=6 lattice-fit applied to external entities — vendor
> producers use their own metrics.
>
> Created 2026-05-13 (Wave M + Phase A-G elevation). Sister-of-pattern:
> [`hexa-bio/.roadmap.novel_drugs`](https://github.com/dancinlab/hexa-bio/blob/main/.roadmap.novel_drugs).

---

## 0. Scope boundary

**In scope**:
- De-novo-designed material *candidates* not present in MP / GNoME / OMat24
  databases at design time
- Cross-class hybrids (HEA + amorphous, MOF + 2D, perovskite + halide-SE, …)
- Targeted falsifier per candidate
- Status tracking through DESIGN → SIM → SYNTH-ROUTE → (EXTERNAL VERIFICATION)

**Out of scope** (preserved per closure framework):
- Per-verb canonical specs — these live in `<verb>/<verb>.md` (see
  [`AXIS.md`](AXIS.md) for the 29-verb taxonomy)
- Deep material chapters — see [`SILICON.md`](SILICON.md),
  [`CERAMIC-ENGINEERING.md`](CERAMIC-ENGINEERING.md),
  [`METALLURGY-DEEP.md`](METALLURGY-DEEP.md),
  [`POLYMER-CHEMISTRY.md`](POLYMER-CHEMISTRY.md),
  [`GRAPHENE-CARBON.md`](GRAPHENE-CARBON.md)
- Wet-lab synthesis + measurement — Category (c) per
  [`AXIS_CLOSURE_PLAN.md`](AXIS_CLOSURE_PLAN.md), **out-of-repo by design**
  (Wacker poly-Si / Wolfspeed SiC / Stora Enso wood / Hitachi Metals NdFeB
  carry their own measurement layer)
- Anti-claims (preserved as HARD_WALL): LK-99 room-T SC, metallic
  hydrogen at ambient, infinite-recycle, magic-MOF DAC at $100/t — see
  [`LIMIT_BREAKTHROUGH.md`](LIMIT_BREAKTHROUGH.md)

---

## 1. Naming convention

```
hxm-<class>-<target>-<NNN>
```

| Component   | Values                                                                |
|-------------|-----------------------------------------------------------------------|
| prefix      | `hxm-` (hexa-matter)                                                  |
| class-tag   | `sc` (superconductor) · `cath` (cathode) · `anode` · `se` (solid electrolyte) · `pv` (photovoltaic) · `hea` (high-entropy alloy) · `bmg` (bulk metallic glass) · `mof` · `2d` · `pero` (perovskite) · `mag` (magnetic) · `ela` (elastomer) · `adh` (adhesive) · `pol` (polymer) · `cer` (ceramic) · `cnt` (carbon nanotube) · `bio` (biodegradable polymer) · `mxene` · `meta` (metamaterial) · `top` (topological) · `aero` (aerogel) · `pcm` (phase-change material) · `liq` (liquid metal) · `cat` (catalyst) · `ferro` (ferroelectric) · `thermo` (thermoelectric) · `membrane` (gas-separation / desalination membrane) · `piezo` (piezoelectric) · `spin` (spintronic) · `quantum` (quantum-defect host) · `photovoltaic` (alias of `pv` for tandem / multi-junction stacks) |
| target-tag  | 3-6 char target identifier (composition / property goal)              |
| NNN         | 3-digit serial number per (class, target)                             |

Examples:
- `hxm-sc-cuprate-001` = hexa-matter superconductor, cuprate family, candidate #001
- `hxm-cath-licmf-001` = Li-Cu-Mn-F cathode, candidate #001
- `hxm-pv-pb-free-001` = lead-free perovskite photovoltaic
- `hxm-hea-refrac-001` = refractory HEA
- `hxm-mof-dac-001` = MOF designed for direct-air-capture
- `hxm-mag-refree-001` = rare-earth-free permanent magnet
- `hxm-bmg-zr-001` = Zr-based bulk metallic glass
- `hxm-aero-graphene-001` = graphene aerogel
- `hxm-meta-eg-001` = electromagnetic metamaterial
- `hxm-top-bisn-001` = topological insulator Bi-Sn family

---

## 2. Status pipeline

```
DESIGN  →  SIM  →  SYNTH-ROUTE  →  (EXTERNAL VERIFICATION)
   │        │           │                    │
   │        │           │                    └─ out-of-repo (Category c)
   │        │           └──────────────────── retrosynthesis sketch + step-count
   │        └───────────────────────────────── DFT / MD / FEA / MACE-OMat NNP / …
   │                                                via _python_bridge or _absorption_bridge
   └─────────────────────────────────────────── written spec in NOVEL.md
                                                + falsifier defined
```

Status tags:

| Tag                  | Meaning                                                                       |
|----------------------|-------------------------------------------------------------------------------|
| `DESIGN`             | Composition + intended phase + target property written                        |
| `SIM-DFT`            | DFT-level band structure / formation energy via pymatgen + MP comparison     |
| `SIM-MD`             | MD relaxation (ASE / LAMMPS-handle) — structural stability check            |
| `SIM-NNP`            | Universal force-field (MACE / SchNet / ALIGNN / CHGNet / M3GNet) verdict via `_absorption_bridge/universal_ff/` |
| `SYNTH-ROUTE`        | Retrosynthesis path proposed (literature precedent or de-novo path)          |
| `UNVERIFIED`         | Default state — Category (c) wet-lab verification not performed              |
| `WET-LAB-PROPOSED`   | Synthesis bench parameters drafted; awaiting external partner                |
| `EXTERNAL-VERIFIED`  | Out-of-repo measurement received — REQUIRES vendor / lab attribution         |
| `FALSIFIED`          | Sim or external measurement contradicts design hypothesis — keep on disk     |

**Honest constraint (raw#10 C3)**: status above `SIM-NNP` requires either
(a) a real `_absorption_bridge` adapter call result hash, or (b) explicit
external lab / vendor citation. A `hxm-*` entry CANNOT claim
`EXTERNAL-VERIFIED` without an attributed measurement. Per
[`LATTICE_POLICY.md`](LATTICE_POLICY.md), the n=6 lattice MUST NOT serve
as evidence for property claims — it is an organizing tool only.

---

## 3. Candidate ledger

Format: `ID | class | target | brief | status | sim handle | falsifier`

### 3.1 Superconductors

LK-99 family **NOT REPRODUCED** (HARD_WALL per
[`LIMIT_BREAKTHROUGH.md`](LIMIT_BREAKTHROUGH.md); see
[`perovskite/perovskite.md`](perovskite/perovskite.md) anti-claim row).
Cuprate-derivative candidates remain open as **research hypotheses**, NOT
claims of working RT-SC. Real-world record (low-T): YBa₂Cu₃O₇ Tc ≈ 92 K
(LN-cooled). High-pressure H₃S Tc ≈ 203 K (Drozdov et al. 2015, but 155
GPa).

| ID                    | class | target              | brief                          | status        | falsifier                             |
|-----------------------|-------|---------------------|--------------------------------|---------------|---------------------------------------|
| `hxm-sc-cuprate-001`  | sc    | Tc > 100 K @ 1 atm  | (PLACEHOLDER — design TBD)     | DESIGN        | F-SC-1: Tc < 92 K → FALSIFIED         |
| `hxm-sc-pnictide-001` | sc    | Fe-As high-Tc       | (PLACEHOLDER — design TBD)     | DESIGN        | F-SC-1: Tc < 55 K → FALSIFIED         |
| `hxm-sc-h3s-derived-001` | sc | low-pressure H-rich | (PLACEHOLDER — design TBD)     | DESIGN        | F-SC-2: P_critical > 50 GPa → FALSIFIED |

All `hxm-sc-*` candidates currently UNVERIFIED. Real RT-SC remains
academically unproven; per [`hexa-rtsc`](https://github.com/dancinlab/hexa-rtsc)
sister substrate, this is a SPEC catalog only.

### 3.2 Battery cathodes

| ID                    | class | target              | brief                          | status        | falsifier                             |
|-----------------------|-------|---------------------|--------------------------------|---------------|---------------------------------------|
| `hxm-cath-licmf-001`  | cath  | Li-Cu-Mn-F          | Li-rich Mn-based, F-substituted | DESIGN       | F-CATH-1: capacity < 250 mAh/g → FAIL |
| `hxm-cath-ni-rich-001`| cath  | LiNi₀.₉Mn₀.₀₅Co₀.₀₅ | Co-minimized NMC variant       | DESIGN        | F-CATH-2: cycle retention < 80% @ 1000 → FAIL |
| `hxm-cath-disord-001` | cath  | DRX (disordered rocksalt) | Li-Mn-Ti-O / fluorinated     | DESIGN        | F-CATH-3: cap/voltage hysteresis > 15% → FAIL |

### 3.3 Solid electrolytes

| ID                    | class | target              | brief                          | status        | falsifier                             |
|-----------------------|-------|---------------------|--------------------------------|---------------|---------------------------------------|
| `hxm-se-argyrod-001`  | se    | Li-PS-Cl argyrodite | room-T σ > 10⁻² S/cm           | DESIGN        | F-SE-1: σ < 1e-3 S/cm @ 25°C → FAIL   |
| `hxm-se-halide-001`   | se    | Li-In-Cl₆ halide-SE | wide voltage window > 4.5 V    | DESIGN        | F-SE-2: anodic decomp < 4.0 V → FAIL  |

### 3.4 Photovoltaic absorbers

| ID                    | class | target              | brief                          | status        | falsifier                             |
|-----------------------|-------|---------------------|--------------------------------|---------------|---------------------------------------|
| `hxm-pv-pb-free-001`  | pv    | Cs-Sn-I₃            | lead-free perovskite, > 20% PCE | DESIGN       | F-PV-1: PCE < 15% (lab) → FAIL        |
| `hxm-pv-tandem-001`   | pv    | Si + perovskite     | 4-terminal tandem > 33% PCE    | DESIGN        | F-PV-2: stability < 1000 h MPP → FAIL |

LK-99 PV variants and HARD_WALL claims preserved
([`PEROVSKITE.md`](PEROVSKITE.md)).

### 3.5 Magnetic materials (rare-earth-free)

| ID                    | class | target              | brief                          | status        | falsifier                             |
|-----------------------|-------|---------------------|--------------------------------|---------------|---------------------------------------|
| `hxm-mag-refree-001`  | mag   | Fe₁₆N₂ thin-film    | (BH)max > 35 MGOe              | DESIGN        | F-MAG-1: (BH)max < 25 MGOe → FAIL     |
| `hxm-mag-mnbi-001`    | mag   | MnBi LTP            | Tc > 300°C + high Hc           | DESIGN        | F-MAG-2: Hc < 0.5 T @ 200°C → FAIL    |
| `hxm-mag-tetra-001`   | mag   | tetrataenite        | meteoritic FeNi → terrestrial   | DESIGN        | F-MAG-3: ordered phase fraction < 50% → FAIL |

All entries UNVERIFIED at production. NdFeB/SmCo gold standards via
Hitachi Metals / TDK / Vacuumschmelze / Shin-Etsu / Arnold — their
published numbers govern (raw#10 C3).

### 3.6 High-Entropy Alloys (HEA)

| ID                    | class | target              | brief                          | status        | falsifier                             |
|-----------------------|-------|---------------------|--------------------------------|---------------|---------------------------------------|
| `hxm-hea-refrac-001`  | hea   | W-Mo-Ta-Nb-V        | refractory, T > 1500°C creep   | DESIGN        | F-HEA-1: creep rate > 1e-7 /s @ 1500°C → FAIL |
| `hxm-hea-cantor-001`  | hea   | CrMnFeCoNi variant  | optimized strength + ductility | DESIGN        | F-HEA-2: σy/εf trade < benchmark → FAIL |
| `hxm-hea-light-001`   | hea   | Al-Ti-V-Cr-Mn       | lightweight HEA, ρ < 5 g/cm³   | DESIGN        | F-HEA-3: ρ > 5.5 g/cm³ → FAIL         |

### 3.7 MOF for direct-air-capture (DAC)

| ID                    | class | target              | brief                          | status        | falsifier                             |
|-----------------------|-------|---------------------|--------------------------------|---------------|---------------------------------------|
| `hxm-mof-dac-001`     | mof   | amine-functionalized| CO₂ capacity > 4 mmol/g @ 400 ppm | DESIGN     | F-MOF-DAC-1: capacity < 1.5 mmol/g → FAIL |
| `hxm-mof-dac-002`     | mof   | Mg-MOF-74 derivative| cyclic stability > 10000 cycles | DESIGN       | F-MOF-DAC-2: cap loss > 20% @ 5000 cyc → FAIL |

**HARD_WALL preserved**: $100/t DAC economics UNPROVEN. Climeworks
amine-on-MOF baseline at $600-1000/t (per [`MOF.md`](MOF.md)).

### 3.8 2D heterostructures

| ID                    | class | target              | brief                          | status        | falsifier                             |
|-----------------------|-------|---------------------|--------------------------------|---------------|---------------------------------------|
| `hxm-2d-mosi2n-001`   | 2d    | MoSi₂N₄             | predicted in MP / GNoME — verify | DESIGN      | F-2D-1: mobility < 100 cm²/V·s → FAIL |
| `hxm-2d-cri3-stack-001` | 2d  | CrI₃ + hBN + WSe₂   | layered magnetic-2D heterostack | DESIGN       | F-2D-2: T_c < 50 K → FAIL             |

### 3.9 Phase-change materials (PCM)

| ID                    | class | target              | brief                          | status        | falsifier                             |
|-----------------------|-------|---------------------|--------------------------------|---------------|---------------------------------------|
| `hxm-pcm-gst-001`     | pcm   | GST + dopant        | < 1 ns set time, > 10¹² cycles | DESIGN        | F-PCM-1: set > 5 ns → FAIL            |
| `hxm-pcm-sbte-001`    | pcm   | Sb₂Te variant        | high contrast for photonic switching | DESIGN  | F-PCM-2: optical contrast < 30% → FAIL |

### 3.10 Carbon (CNT yarn / lonsdaleite / carbyne)

| ID                    | class | target              | brief                          | status        | falsifier                             |
|-----------------------|-------|---------------------|--------------------------------|---------------|---------------------------------------|
| `hxm-cnt-yarn-001`    | cnt   | continuous SWCNT yarn | > 10 GPa @ commercial-spool   | DESIGN        | F-CNT-1: production strength < 3 GPa → FAIL |

**HARD_WALL**: CNT yarn 80 GPa = lab mm-scale; commercial 1-3 GPa
preserved verbatim ([`carbon/carbon.md`](carbon/carbon.md) and
[`GRAPHENE-CARBON.md`](GRAPHENE-CARBON.md)). Lonsdaleite, carbyne,
diamond-as-semi wafer all UNVERIFIED.

### 3.11 Metamaterials (engineered EM / acoustic / mechanical)

| ID                    | class | target              | brief                          | status        | falsifier                             |
|-----------------------|-------|---------------------|--------------------------------|---------------|---------------------------------------|
| `hxm-meta-neg-001`    | meta  | negative-index EM   | n_eff < 0 at λ = 1550 nm       | DESIGN        | F-META-1: loss > 5 dB/wavelength → FAIL |
| `hxm-meta-cloak-001`  | meta  | partial cloak       | (PLACEHOLDER — visibility ratio TBD) | DESIGN  | F-META-2: cross-section reduction < 50% → FAIL |
| `hxm-meta-acoustic-001` | meta | phononic crystal   | sub-Hz dispersion engineering  | DESIGN        | F-META-3: bandgap fractional width < 10% → FAIL |

### 3.12 Topological insulators / superconductors

| ID                    | class | target              | brief                          | status        | falsifier                             |
|-----------------------|-------|---------------------|--------------------------------|---------------|---------------------------------------|
| `hxm-top-bi2se3-001`  | top   | doped Bi₂Se₃        | room-T surface conductivity    | DESIGN        | F-TOP-1: SS contribution < 30% → FAIL |
| `hxm-top-sn-001`      | top   | Sn-based TI         | predicted in MP — verify       | DESIGN        | F-TOP-2: bulk bandgap < 0.1 eV → FAIL |
| `hxm-top-majorana-001`| top   | Majorana platform   | TI + s-SC hybrid                | DESIGN        | F-TOP-3: zero-bias peak signature absent → FAIL |

**HARD_WALL**: Majorana fermion identification HOTLY DEBATED (Microsoft
Station Q retractions 2018-2024). Preserved as UNVERIFIED.

### 3.13 Bulk metallic glasses (BMG)

Hypothesis: amorphous Zr-Cu-Al-Ni glass-formers can extend supercooled
liquid region ΔTx and reach larger critical casting thickness Dc than
Vitreloy-1 (Zr₄₁.₂Ti₁₃.₈Cu₁₂.₅Ni₁₀Be₂₂.₅, Dc ~ 25 mm, Johnson 1996 Caltech).
Be-free chemistries with minor lanthanide micro-alloying are the open
search axis. Status starts at DESIGN.

| ID                    | class | target              | brief                          | status        | falsifier                             |
|-----------------------|-------|---------------------|--------------------------------|---------------|---------------------------------------|
| `hxm-bmg-zr-001`      | bmg   | Zr-Cu-Al-Ni-Y       | Be-free Vitreloy alternative; Dc > 30 mm at Y ~ 0.5 at% | DESIGN | F-BMG-1: Dc < 10 mm in arc-melt + suction-cast → FAIL |

**Risk-flags**: thermodynamic GFA (γ, Δ, Trg) not yet computed via
`_python_bridge/metallurgy_alloy_composition.py`; oxide-pickup during
arc-melt UNVERIFIED; cyclic-fatigue / shear-band cracking statistics
UNVERIFIED. SPEC_FIRST only.

### 3.14 Aerogels (ultralow-density solids)

Hypothesis: graphene-oxide / cellulose-nanofiber hybrid aerogels can
combine sub-10 mg/cm³ density with > 1 MPa compressive recovery, beating
classic silica aerogel (ρ ~ 3-150 mg/cm³ but brittle; Kistler 1931 / NASA
JPL). Open question: can the cellulose-nanofiber scaffold survive
supercritical-CO₂ drying without densification > 20%? Status DESIGN.

| ID                       | class | target              | brief                          | status   | falsifier                             |
|--------------------------|-------|---------------------|--------------------------------|----------|---------------------------------------|
| `hxm-aero-graphene-001`  | aero  | rGO + CNF hybrid    | ρ < 10 mg/cm³; recoverable > 80% strain | DESIGN | F-AERO-1: density > 30 mg/cm³ OR recovery < 50% after 10⁴ cycles → FAIL |

**Risk-flags**: SCD shrinkage UNVERIFIED; thermal-conductivity target
< 25 mW/m·K UNVERIFIED; fire-retardancy via phytate cross-linker
UNVERIFIED; not in MP/GNoME (amorphous network outside crystalline
prediction scope per [`_absorption_bridge/gnome/SOURCES.md`](_absorption_bridge/gnome/SOURCES.md)).

### 3.15 MXenes (2D transition-metal carbides/nitrides)

Hypothesis: Ti₃C₂Tₓ MXenes with mixed -O/-F/-OH surface terminations,
processed via fluorine-free LiF/HCl etching, can sustain EMI shielding
effectiveness > 80 dB at < 100 µm thickness while resisting oxidative
degradation longer than vanilla Ti₃C₂Tₓ (which dies in days at ambient
RH). Open: terminations after MAX-phase etching are
stoichiometry-controlled? Status DESIGN.

| ID                       | class | target              | brief                          | status   | falsifier                             |
|--------------------------|-------|---------------------|--------------------------------|----------|---------------------------------------|
| `hxm-mxene-ti3c2-001`    | mxene | Ti₃C₂Tₓ (-O,-F,-OH) | EMI SE > 80 dB; 6-month ambient RH oxidative stability | DESIGN | F-MXENE-1: σ loss > 50% after 30 d @ 25 °C / 60% RH → FAIL |
| `hxm-mxene-mo2c-001`     | mxene | Mo₂CTₓ              | HER catalyst, η < 100 mV @ 10 mA/cm² | DESIGN | F-MXENE-2: η > 200 mV @ 10 mA/cm² in 0.5 M H₂SO₄ → FAIL |

**Risk-flags**: HF-free synthesis route UNVERIFIED at gram scale;
terminations not deterministic post-etch; long-term oxidative pathway
(Ti₃C₂ → TiO₂ + amorphous C) HARD_WALL at high RH per Gogotsi 2023
preprint corpus surfaced by `_research_bridge/arxiv/`.

### 3.16 Biomaterials / biodegradable polymers

Hypothesis: PHA copolymer (P3HB-co-3HHx) blended with chitin nanowhiskers
can pass ASTM D7081 marine-biodegradability AND ASTM D6400 industrial
compost simultaneously while keeping film tensile strength > 25 MPa.
Open: chitin filler typically reduces tensile by 20-40%; biodegradation
rate in marine vs. compost is a known trade-off (NatureWorks / Danimer
empirical curves, not lab-replicated here). Status DESIGN.

| ID                       | class | target              | brief                          | status   | falsifier                             |
|--------------------------|-------|---------------------|--------------------------------|----------|---------------------------------------|
| `hxm-bio-pha-marine-001` | bio   | P3HB-co-3HHx + chitin nano | marine + compost dual-cert film | DESIGN | F-BIO-1: marine BOD₂₈ < 60% OR tensile < 15 MPa → FAIL |

**Risk-flags**: marine-biodegradability UNVERIFIED for most blends (only
specific PHA grades carry D7081); chitin filler dispersion may collapse
to micro-agglomerates above 5 wt%; melt-processing window narrows;
mass-balance vs. additive leaching UNVERIFIED. NatureWorks PLA / Danimer
PHA vendor authority preserved (raw#10 C3).

### 3.17 Liquid-metal alloys (room-T gallium-based)

Hypothesis: a Ga-In-Sn-Bi quaternary can depress Tm below 0 °C while
keeping surface tension < 500 mN/m and oxide-skin thickness < 5 nm under
ambient. EGaIn baseline: Ga₇₅In₂₅ Tm ≈ 15.5 °C; Galinstan (Ga₆₈In₂₂Sn₁₀)
Tm ≈ -19 °C, σ ≈ 533 mN/m (vendor: Geratherm Medical / RGMD). Open: Bi
addition risks segregation. Status DESIGN.

| ID                       | class | target              | brief                          | status   | falsifier                             |
|--------------------------|-------|---------------------|--------------------------------|----------|---------------------------------------|
| `hxm-liq-gain-001`       | liq   | Ga-In-Sn-Bi         | Tm < -25 °C; σ < 450 mN/m; recovery > 95% on stretch-test | DESIGN | F-LIQ-1: Tm > -10 °C OR Bi segregation > 5 vol% on DSC → FAIL |

**Risk-flags**: GaAl-Au amalgamation contamination of test fixtures
known issue; oxide-skin (Ga₂O₃) re-forms < 1 s in air — wettability vs.
substrate UNVERIFIED; biocompatibility UNVERIFIED for skin contact;
Galinstan vendor (Geratherm) sole-source pricing UNVERIFIED at scale.

### 3.18 Lithium-ion anodes (Si-graphite composite)

Hypothesis: nano-Si (D₅₀ ~ 100 nm) embedded in graphite matrix with
in-situ-grown elastic SEI from FEC + VC additives can hold > 600 mAh/g
reversible capacity for > 500 cycles at 1C without > 30% volume swelling
at electrode level. Vendor authority: Sila Nanotechnologies / Group14 /
Amprius (their published numbers govern at production).

| ID                       | class | target              | brief                          | status   | falsifier                             |
|--------------------------|-------|---------------------|--------------------------------|----------|---------------------------------------|
| `hxm-anode-sigr-001`     | anode | Si-graphite + FEC-SEI | capacity > 600 mAh/g @ 1C for > 500 cycles | DESIGN | F-ANODE-1: cap retention < 70% after 500 cyc @ 1C → FAIL |

**Risk-flags**: SEI re-formation rate vs. FEC consumption UNVERIFIED at
cell level; nano-Si pulverization at > 15 wt% Si still open; cost-parity
to graphite ($/kWh) HARD_WALL; full-cell vs. half-cell discrepancy
typically 20-30% in cycle life. Pairs with `hxm-cath-*` for full-cell
spec (out-of-repo per Category (c)).

### 3.19 Non-PGM ORR catalysts (Fe-N-C atomically-dispersed)

Hypothesis: an Fe-N-C catalyst with atomically-dispersed Fe-N₄ sites on
hierarchical porous carbon, derived from a Zn/Fe bimetallic ZIF precursor
pyrolyzed at 950 °C under Ar then NH₃-activated, can reach acid-PEMFC
ORR half-wave potential E₁/₂ ≥ 0.85 V vs. RHE in 0.5 M H₂SO₄ while
keeping ≤ 30 mV degradation after 30 k AST cycles (0.6–1.0 V, O₂).
Vendor / lab authority: Zelenay group (LANL), Wu group (UB), Pivovar
(NREL), Atanassov (UC Irvine), Dodelet (INRS, pioneering Fe-N-C corpus
since 2009 Science) — their published EXAFS / Mössbauer / RDE data
govern (raw#10 C3, NOT lattice-fit). Status DESIGN.

| ID                       | class | target              | brief                          | status   | falsifier                             |
|--------------------------|-------|---------------------|--------------------------------|----------|---------------------------------------|
| `hxm-cat-fenc-001`       | cat   | Fe-N₄/C (Zn-Fe-ZIF derived) | acid-PEMFC ORR E₁/₂ ≥ 0.85 V vs. RHE; ≤ 30 mV loss @ 30k AST | DESIGN | F-CAT-1: E₁/₂ < 0.80 V vs. RHE in 0.5 M H₂SO₄ rotating-disk at 1600 rpm OR EXAFS-falsifier — Fe K-edge first-shell coordination ≠ 4 N at R ≈ 2.0 Å, or Fe-Fe scatter > 5% of Fe-N intensity (indicates clustered Fe rather than atomically-dispersed Fe-N₄) → FAIL |

**Risk-flags**: Fenton-active Fe leaching under operating PEM conditions
HARD_WALL (degrades ionomer); MEA-level vs. RDE half-cell discrepancy
typically 30–50% in mass activity (Pivovar 2020 J. Electrochem. Soc.);
NH₃-activation step adds N-content but can volatilize active sites;
$/kW parity to Pt/C UNPROVEN at MEA stack scale. Anti-claim preserved:
no atomically-dispersed Fe-N-C has yet matched Pt/C 4-electron ORR
selectivity (1–2% H₂O₂ yield) at long-term stability per DOE 2025
hydrogen-fuel-cell milestone.

### 3.20 Ferroelectric thin films (HfO₂-ZrO₂)

Hypothesis: a Hf₀.₅Zr₀.₅O₂ (HZO) thin film, ALD-deposited at 280 °C
between TiN electrodes with a 10-nm film thickness and rapid thermal
anneal at 500 °C in N₂, can stabilize the metastable orthorhombic
Pca2₁ (o-phase) ferroelectric phase with remanent polarization
P_r ≥ 25 µC/cm² AND endurance ≥ 10¹¹ cycles at ±3 V before wake-up /
fatigue degrades P_r by > 30%. Vendor / lab authority: Böscke (NaMLab/
Dresden 2011, original HZO ferroelectric discovery), Mikolajick group
(NaMLab/TU Dresden), Tsinghua HfZrO ferroelectric memory group,
GlobalFoundries 22FDX FeFET, Ferroelectric Memory Company (FMC) —
their published P-E loops + retention numbers govern (raw#10 C3).
Status DESIGN.

| ID                       | class | target              | brief                          | status   | falsifier                             |
|--------------------------|-------|---------------------|--------------------------------|----------|---------------------------------------|
| `hxm-ferro-hzo-001`      | ferro | Hf₀.₅Zr₀.₅O₂ / TiN | 10-nm o-phase HZO; P_r ≥ 25 µC/cm²; endurance ≥ 10¹¹ cyc @ ±3 V | DESIGN | F-FERRO-1: P_r < 15 µC/cm² at 10 nm OR endurance < 10⁹ cycles before P_r fatigues > 30% OR 10-yr retention extrapolation falls < 60% of initial P_r at 85 °C → FAIL |

**Risk-flags**: o-phase stabilization is geometry / electrode /
thickness / cap-layer dependent — thinning < 5 nm or thickening > 30 nm
loses ferroelectricity (NaMLab 2018 review); wake-up effect (P_r grows
in first 10³–10⁵ cycles) NOT a defect but precursor distinction, can
mask early fatigue; imprint shift > 0.3 V after 10⁸ cycles common; CMOS
back-end thermal-budget compatibility (≤ 500 °C) UNVERIFIED for
high-volume embedded-FeRAM nodes. Tsinghua HZO group's published P_r ~
20–30 µC/cm² typical; this candidate's ≥ 25 µC/cm² is an aspirational
upper-quartile target, not a record claim.

### 3.21 Thermoelectrics (SnSe polycrystalline)

Hypothesis: a Na-doped polycrystalline SnSe (Sn₀.₉₈Na₀.₀₂Se) with
controlled grain orientation along the b-axis via hot-pressing of
mechanically-alloyed nanoparticles can sustain dimensionless figure-
of-merit ZT ≥ 2.0 at 800 K along the in-plane direction, while keeping
mechanical strength σ_compressive ≥ 50 MPa (single-crystal SnSe is too
brittle for module integration; Zhao 2014 Nature single-crystal ZT ~
2.6 at 923 K is UNREPRODUCED at polycrystalline scale per multiple
retraction/reanalysis cycles 2016–2021). Lab authority: Kanatzidis
group (Northwestern), Zhao/Tian-Xiang SnSe group (SUSTech / Beihang),
Snyder group (Northwestern), Pei group (Tongji), Wuttig group (Aachen)
— their published ZT(T) curves with explicit κ_lat ± error bars govern
(raw#10 C3). Status DESIGN.

| ID                       | class | target              | brief                          | status   | falsifier                             |
|--------------------------|-------|---------------------|--------------------------------|----------|---------------------------------------|
| `hxm-thermo-snse-001`    | thermo| Sn₀.₉₈Na₀.₀₂Se polycrystal | b-axis textured hot-pressed; ZT ≥ 2.0 @ 800 K | DESIGN | F-THERMO-1: in-plane ZT < 1.5 @ 800 K via 4-probe + laser-flash on independently-measured pellet (≥ 3 labs, ZT_avg) OR thermal conductivity κ_total > 0.8 W/m·K @ 800 K (indicates phonon-scattering target missed) OR mechanical σ_compressive < 30 MPa → FAIL |

**Risk-flags**: SnSe single-crystal ZT > 2.5 record HARD_WALL not
reproduced at polycrystal; ultra-low κ_lat ~ 0.2 W/m·K in single
crystals often turns into 0.5–0.7 W/m·K polycrystal (grain-boundary
phonons added); Se volatilization above 700 K in air UNVERIFIED for
long-duration modules (oxidation to SnO₂ + SeO₂ at hot-end); module-
level ZT typically 30–50% below pellet ZT due to contact resistance
(Cu/Ni metallization to SnSe interfacial layer UNVERIFIED at MTBF
scale). Vendor authority: Marlow Industries / Ferrotec / European
Thermodynamics on Bi₂Te₃ modules — SnSe modules NOT yet commercial.

### 3.22 Gas-separation membranes (MOF mixed-matrix)

Hypothesis: a ZIF-8 / 6FDA-DAM mixed-matrix membrane (MMM) with 30
wt% ZIF-8 loading, prepared by in-situ ZIF growth in polymer dope
followed by phase-inversion casting, can simultaneously achieve H₂
permeance ≥ 500 GPU AND H₂/N₂ selectivity ≥ 100 at 35 °C, 4 bar
feed pressure, while resisting plasticization at CO₂ partial pressure
up to 10 bar (CO₂/CH₄ selectivity loss < 20%). Vendor / lab authority:
KAUST advanced membranes group (Pinnau, Han, Lai), MTR Inc. (Membrane
Technology and Research) polyimide membranes, Air Products /
Helmholtz-Zentrum Geesthacht MMM corpus, Sandia ZIF-8 membrane group
— their published Robeson-plot positions govern (raw#10 C3).
Status DESIGN.

| ID                       | class | target              | brief                          | status   | falsifier                             |
|--------------------------|-------|---------------------|--------------------------------|----------|---------------------------------------|
| `hxm-membrane-zif8-001`  | membrane | ZIF-8 / 6FDA-DAM MMM | 30 wt% loading; H₂ permeance ≥ 500 GPU; H₂/N₂ sel ≥ 100 | DESIGN | F-MEMBRANE-1: H₂ permeance < 200 GPU at 35 °C 4 bar OR H₂/N₂ selectivity < 50 (below 2008 Robeson upper bound) OR ZIF-8 sieve-in-cage interface void (revealed by SEM cross-section or filler-polymer adhesion via gas-permeance pressure-decay deviation > 25%) → FAIL |

**Risk-flags**: MMM filler-polymer interface void is the #1 failure
mode — voids destroy selectivity by Knudsen short-circuit; ZIF-8
aperture 3.4 Å is gate-flexible (CO₂ ~ 3.3 Å, N₂ ~ 3.64 Å can both
pass under elevated pressure breathing); long-term plasticization at
high-pressure CO₂ HARD_WALL for glassy polyimide hosts (Koros 2017
review); scale-up from coupon to hollow-fiber module loses ~ 50% flux
typically. KAUST membrane group is reference for top-quartile MMM
fabrication; commercial vendor (MTR, Air Liquide MEDAL) hollow-fiber
polyimide selectivity baseline H₂/N₂ ~ 50–80.

### 3.23 Quantum-defect hosts (4H-SiC silicon-vacancy color center)

Hypothesis: the negatively-charged silicon vacancy V_Si⁻ in 4H-SiC,
generated by 2 MeV electron irradiation (10¹³ e⁻/cm²) of
isotopically-purified ²⁸Si ²⁹Si-depleted ¹²C ¹³C-depleted 4H-SiC,
followed by 600 °C anneal in Ar, can sustain spin-coherence time
T₂ ≥ 1 ms at 300 K under dynamical-decoupling (CPMG-N, N up to 256
pulses) while preserving optically-detected magnetic resonance
contrast ≥ 1%. Lab authority: Awschalom group (U. Chicago / Argonne
QIS center) — original V_Si⁻ qubit demonstrations in 4H-SiC at room
temperature 2015 Nat. Mater.; Wrachtrup group (Stuttgart) — NV-center
comparison; Son/Janzen group (Linköping) for SiC growth; STMicro and
Coherent (II-VI) for commercial 4H-SiC wafer authority (raw#10 C3).
Status DESIGN.

| ID                       | class | target              | brief                          | status   | falsifier                             |
|--------------------------|-------|---------------------|--------------------------------|----------|---------------------------------------|
| `hxm-quantum-sicvv-001`  | quantum | V_Si⁻ in ²⁸Si/¹²C-enriched 4H-SiC | room-T spin qubit; T₂ ≥ 1 ms @ 300 K with CPMG-N=256 | DESIGN | F-QUANTUM-1: Hahn-echo T₂ < 100 µs at 300 K OR CPMG-256 T₂ < 1 ms OR ODMR contrast < 0.3% at 300 K OR isotopic enrichment fails to suppress nuclear-spin bath below natural-abundance baseline (¹³C 1.1%, ²⁹Si 4.7%) → FAIL |

**Risk-flags**: room-T T₂ in natural-abundance 4H-SiC currently ~ 70
µs (Soltamov 2019 Nat. Commun.); reaching ms requires both isotopic
enrichment (²⁸Si, ¹²C) AND dynamical-decoupling — neither is
commercially turn-key; isotopically-enriched ²⁸SiC growth UNVERIFIED
at wafer scale (Si ²⁸Si CVD precursors available from Urenco/Eagle
Picher but ¹²C feedstock for SiC growth is research-scale only);
electron-irradiation damage at 2 MeV introduces unwanted V_C and
divacancy defects competing with V_Si⁻; integrated-photonic coupling
to V_Si⁻ ZPL at 916 nm HARD_WALL — only ~ 6% photons in zero-phonon
line vs. NV-diamond ~ 3%, comparable but still small. NV-diamond
sister candidate (not yet in ledger) would target T₂ > 1 ms at 300 K
already demonstrated (Bar-Gill 2013) — SiC is preferred here for
CMOS-compatibility (4H-SiC power-device wafers from Wolfspeed /
STMicro / Infineon / ROHM scale).

---

## 4. Sim handle convention

When `status >= SIM-*`, the entry must reference the actual sim handle.
Format: `<bridge>/<adapter>/<output-hash>`

Examples:
- `_python_bridge/module/pymatgen_structure_io.py::<md5>`
- `_absorption_bridge/materials_project/mp_api_smoke.py::mp-149` (Si reference)
- `_absorption_bridge/universal_ff/mace_call.py::<input-md5>`
- `_absorption_bridge/gnome/gnome_dataset_smoke.py::<gnome-id>`

This forces SIM claims to point at a real, reproducible artifact (or a
proper SKIP if the adapter wasn't installed at the time, per Phase E
discipline).

---

## 5. Honesty roll-up (per LATTICE_POLICY.md §1.2)

Every entry in §3 above is currently `DESIGN`-only. **No entry has
external measurement evidence.** Production-scale verification belongs to
real foundries / labs / mills (raw#10 C3):

- **Vendor authority** for production: Wacker (poly-Si) / Wolfspeed (SiC) /
  Stora Enso (CLT) / Hitachi Metals (NdFeB) / TDK / Shin-Etsu / Arnold /
  Vacuumschmelze / Climeworks (DAC) / NatureWorks (PLA) / Danimer (PHA) /
  Element Six (diamond) / Merck KGaA (LC) — see per-verb specs for
  full citations
- **Database authority** for predicted candidates: Materials Project
  (Berkeley/LBNL, CC-BY 4.0) / DeepMind GNoME (CC-BY 4.0, 2.2M predicted
  stable materials, **PREDICTED NOT SYNTHESIZED**) / Meta AI OMat24
  (CC-BY 4.0, 110M structures) / Preferred Networks Matlantis
  (commercial, UNVERIFIED at hexa-matter scale economics) — see
  [`_absorption_bridge/`](_absorption_bridge/README.md)
- **Anti-claim ledger** (HARD_WALL preserved):
  - LK-99 NOT REPRODUCED
  - metallic hydrogen at ambient UNPROVEN
  - infinite-recycle HARD_WALL (Gibbs ΔS_mix)
  - magic-MOF $100/t DAC UNPROVEN (Climeworks $600-1000/t baseline)
  - CNT yarn 80 GPa = lab mm-scale (commercial 1-3 GPa)
  - 50+ story mass-timber UNVERIFIED
  - rare-earth-free > 35 MGOe UNVERIFIED at production
  - Majorana fermion identification CONTESTED
  - Re-free 4th-gen single-crystal superalloy UNVERIFIED at parity

---

## 6. Entry workflow

To add a new candidate:

1. **Pick class-tag** from §1 table; choose a target-tag (3-6 chars).
2. **Define falsifier** — quantitative, threshold-based,
   measurement-attributable. Vague "we want better" claims rejected.
3. **Land DESIGN row** in §3 with target + brief + falsifier columns
   filled, status = `DESIGN`.
4. **Optionally run sim** via `_python_bridge` or `_absorption_bridge` —
   record sim handle, advance status to `SIM-*`.
5. **Propose retrosynthesis** — advance to `SYNTH-ROUTE` only with
   literature precedent or de-novo path written out.
6. **External verification is OUT-OF-REPO**. To advance to
   `EXTERNAL-VERIFIED`, attach an external lab citation with sample-ID
   and measurement protocol. `hxm-*` ledger NEVER self-validates.

Falsified candidates (sim or external evidence contradicts design)
**stay on disk** with `FALSIFIED` status — they are evidence, not noise.
Per [`AXIS_CLOSURE_PLAN.md`](AXIS_CLOSURE_PLAN.md) Category (a) discipline.

---

## 7. Cross-references

- Working ledger sibling: [`hexa-bio/.roadmap.novel_drugs`](https://github.com/dancinlab/hexa-bio/blob/main/.roadmap.novel_drugs)
- Per-verb specs: [`AXIS.md`](AXIS.md)
- Deep chapters: [`SILICON.md`](SILICON.md), [`CERAMIC-ENGINEERING.md`](CERAMIC-ENGINEERING.md), [`METALLURGY-DEEP.md`](METALLURGY-DEEP.md), [`POLYMER-CHEMISTRY.md`](POLYMER-CHEMISTRY.md), [`GRAPHENE-CARBON.md`](GRAPHENE-CARBON.md)
- Roadmap stubs: [`PEROVSKITE.md`](PEROVSKITE.md), [`COMPOUND-SEMI.md`](COMPOUND-SEMI.md), [`2D-MATERIALS.md`](2D-MATERIALS.md), [`MOF.md`](MOF.md), [`SUPERALLOY.md`](SUPERALLOY.md), [`MAGNETIC-MATERIALS.md`](MAGNETIC-MATERIALS.md), [`ELASTOMER.md`](ELASTOMER.md), [`ADHESIVE.md`](ADHESIVE.md), [`BIODEGRADABLE-PLASTICS.md`](BIODEGRADABLE-PLASTICS.md), [`WOOD-CELLULOSE.md`](WOOD-CELLULOSE.md), [`LIQUID-CRYSTAL.md`](LIQUID-CRYSTAL.md)
- Closure framework: [`AXIS_CLOSURE_PLAN.md`](AXIS_CLOSURE_PLAN.md), [`CLOSURE_RESIDUAL_BACKLOG.md`](CLOSURE_RESIDUAL_BACKLOG.md)
- Sim bridges: [`_python_bridge/README.md`](_python_bridge/README.md), [`_absorption_bridge/README.md`](_absorption_bridge/README.md)
- Frontier signal feed: [`_research_bridge/README.md`](_research_bridge/README.md) (arxiv cond-mat.mtrl-sci + vendor datasheet + patent crawl)
- Policy: [`LATTICE_POLICY.md`](LATTICE_POLICY.md), [`LIMIT_BREAKTHROUGH.md`](LIMIT_BREAKTHROUGH.md), [`AGENTS.md`](AGENTS.md)
- Initial extraction state: [`INIT.md`](INIT.md)
