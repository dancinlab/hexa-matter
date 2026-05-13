# DECOMPOSITION_PLAN — hexa-matter material taxonomy decomposition

> **Created**: 2026-05-13 (Phase A elevation) · **Status**: PROPOSAL — Phase D execution queued
> **Sibling**: `AXIS.md` (7-group taxonomy) · `AXIS_CLOSURE_PLAN.md` (per-group closure)
>
> This document lays out how the 7 material groups decompose into the
> current 17 verbs and the queued 12+ Phase D verbs. **No git moves
> executed beyond v1.x scope** — Phase B (selftest), C (depth dirs),
> D (new verbs) are sequenced after Phase A.

---

## §0 Decomposition strategy — why this and not alternatives

Materials science has at least 4 well-established taxonomies. We evaluated each before committing to the 7-group form:

| Taxonomy | Origin | Verb count if applied | Why we did or didn't adopt |
|----------|--------|------------------------|----------------------------|
| **Ashby material selection chart** | Ashby 1992; *Materials Selection in Mechanical Design* 5th ed. (2017) | ~6 super-classes (metals, polymers, ceramics, composites, natural, hybrid) | Adopted in spirit — our 7 groups overlap heavily with Ashby's 6, plus our split of CER vs GEM and FIB vs FAS. |
| **MatWeb taxonomy** | matweb.com industrial database | ~50 base classes (alloy steel, brass, glass-ceramic, etc.) | Too granular for v1.x scope. Phase F (research bridge) will likely consume MatWeb directly. |
| **CALPHAD thermodynamic** | Kaufman & Bernstein 1970; FactSage / Thermo-Calc | ~thousands of phase diagrams | Phase G (AlphaFold-class absorption) candidate; far beyond v1.x. |
| **ASM Handbook 23-volume** | ASM International | 23 volumes by application | Our verb names sometimes mirror ASM (`metallurgy.md` ≈ ASM vol. 1, `ceramics.md` ≈ vol. 21) but we cluster more aggressively. |

**What we picked**: a 7-group lattice that is *Ashby-like at the top level* (bond class + processing route) but with two engineering-driven splits:

1. **CER vs GEM split**: same chemistry (ionic + covalent), different application — CER is processed/sintered/grown, GEM is characterized non-destructively. Both touch corundum / silicate / diamond.
2. **FIB vs FAS split**: same fiber chemistry, different value-add axis — FIB is the dry-mechanical assembly (fabric, paper), FAS is the wet-process + dye-uptake side (industrial textile, dyeing).

Plus one bookkeeping group:

3. **PRC** (process) as orthogonal to the chemistry-based groups — synthesis, recycling, printing are processes that touch any chemistry; they earn their own group rather than being scattered.

---

## §1 Material hierarchy — element → product

The verb decomposition follows the standard materials-science hierarchy:

```
element                    silicon (Si), carbon (C), aluminum (Al), copper (Cu), iron (Fe)
   ↓
compound                   SiO₂, SiC, Si₃N₄, Al₂O₃, Fe₂O₃, CaSO₄
   ↓
mixture                    cement (CaO + SiO₂ + Al₂O₃ + Fe₂O₃ + SO₃ ...),
                           glass (SiO₂ + Na₂O + CaO), bronze (Cu + Sn)
   ↓
composite                  Kevlar/epoxy (aramid + epoxy), UHPC (cement + fiber + silica fume),
                           CFRP (carbon fiber + epoxy), TBC (ZrO₂ + Y₂O₃ on Ni superalloy)
   ↓
product                    tire-cord (aramid in nylon-rubber matrix), turbine blade
                           (Ni superalloy + TBC + cooling channels), PET film,
                           5G ceramic capacitor, Czochralski-pulled mono-Si wafer
```

Each of the 17 verbs sits somewhere on this ladder:

| Verb | Hierarchy level | One-line essence |
|------|------------------|------------------|
| silicon | element + compound | elemental Si (poly/mono) + SiO₂/SiC/SiN compounds + Si-O polymer (silicone) |
| ceramics | compound + mixture | sintered oxide/nitride/carbide ceramics |
| glass | mixture | vitreous SiO₂ + alkali/alkaline-earth modifier |
| concrete | mixture | cement (mixture) + aggregate + water |
| concrete_tech | composite | UHPC + fiber-reinforced + reactive powder |
| aramid | compound + product | PPTA polymer + Kevlar fiber product |
| nylon | compound + product | polyamide (nylon-6,6 / nylon-6) + fiber/resin product |
| pet_film | compound + product | PET polymer film |
| epoxy | compound | DGEBA + cross-linker resin system |
| tire_cord | composite + product | aramid/nylon in tire rubber matrix |
| microplastics | mixture | environmental fate of mixed polymer fragments |
| fabric | composite | woven/knitted/non-woven fiber assembly |
| paper | composite | cellulose pulp + filler + sizing |
| gemology | compound | mineral characterization (corundum, beryl, diamond, garnet) |
| metallurgy | element + compound + mixture | alloys, phase diagrams, heat treatment |
| lutherie | composite + product | alloy + wood + craft product (instrument) |
| synthesis | process | forward route — element → compound → mixture |
| recycle_n6 | process | reverse + n=6 lattice accounting |
| recycling | process | reverse route — product → compound → element |
| fashion-textile | composite + product | textile supply chain |
| textile-dyeing | process | wet-process dye uptake on fiber substrate |

---

## §2 The 17 verbs decompose into 7 groups (current state)

Per `AXIS.md §0`:

```
GROUP_CER (5): ceramics, concrete, concrete_tech, glass, silicon
GROUP_POL (5): aramid, epoxy, nylon, pet_film, microplastics  (tire_cord = downstream)
GROUP_FIB (2): fabric, paper
GROUP_MET (2): metallurgy, lutherie
GROUP_GEM (1): gemology
GROUP_PRC (3): synthesis, recycle_n6, recycling  (printing = future verb, currently inside synthesis)
GROUP_FAS (2): fashion-textile, textile-dyeing
```

**Why this exact mapping** (not some other clustering):
- **CER is densest** because silicate chemistry is the connective tissue from construction (concrete) through optics (glass) to semiconductors (silicon).
- **POL is second-densest** because the linkage-class diversity (amide, ester, epoxide, urea) is largest in the synthetic-polymer family.
- **MET is small (2)** because v1.x covers steel/alloy fundamentals via `metallurgy.md` (anchored on SWORDSMITHING.md upstream) — Phase D will expand to superalloy, refractory metal, light alloy as separate verbs.
- **GEM is single (1)** because the gemology spec covers all gem species in one chapter — Phase D may not need to expand.

---

## §3 Phase D — 12+ new verbs queued

These are the candidate new verbs for Phase D (NOT in this Phase A commit; documented here for visibility):

### §3.1 GROUP_CER expansion (Phase D)

| Verb | Why | Phase D priority |
|------|-----|------------------|
| compound-semi | GaN, SiC (device side), GaAs, InP, AlN — wide-bandgap cluster | HIGH (1 of 3) |
| perovskite | ABO₃ structure family (BaTiO₃, PbZrO₃, LK-99 candidate, MAPbI₃ solar) | HIGH (2 of 3) — overlaps LIMIT_BREAKTHROUGH HARD_WALL row |
| 2d-materials | graphene, h-BN, MoS₂, WSe₂, phosphorene | HIGH (3 of 3) |

### §3.2 GROUP_POL expansion (Phase D)

| Verb | Why | Phase D priority |
|------|-----|------------------|
| elastomer | natural rubber, SBR, EPDM, silicone, fluorosilicone — distinct from rigid POL | MEDIUM |
| adhesive | adhesion mechanisms, cyanoacrylate, polyurethane structural | MEDIUM |
| biodegradable-plastics | PLA, PHA, PBS, PHB, PCL | LOW (overlaps hexa-bio fermentation) |

### §3.3 GROUP_FIB expansion (Phase D)

| Verb | Why | Phase D priority |
|------|-----|------------------|
| wood-cellulose | wood + lignocellulose + nanocellulose (CNC, CNF) | MEDIUM |

### §3.4 GROUP_MET expansion (Phase D)

| Verb | Why | Phase D priority |
|------|-----|------------------|
| superalloy | Ni-based Inconel 718, Hastelloy, single-crystal turbine blade — distinct from `metallurgy.md` general scope | HIGH |

### §3.5 GROUP_GEM expansion (Phase D)

(no new verbs queued; gemology covers the gem family)

### §3.6 GROUP_PRC expansion (Phase D)

| Verb | Why | Phase D priority |
|------|-----|------------------|
| printing | additive manufacturing (FDM, SLS, SLA, DLP, MJF, binder-jet) — currently inside `synthesis` | HIGH |

### §3.7 New cross-cutting verbs (Phase D)

| Verb | Group | Why |
|------|-------|------|
| magnetic-materials | CER / MET hybrid | hard/soft magnets (NdFeB, SmCo, ferrite, electrical steel) |
| MOF | CER / POL hybrid | metal-organic frameworks (HKUST-1, ZIF-8, MOF-74) |
| liquid-crystal | POL | LCD / OLED display side; nematic, smectic, cholesteric |

**Phase D verb count**: 12 new verbs queued. After Phase D execution, hexa-matter would be at **17 + 12 = 29 verbs**, with 7 groups likely expanded to 8-9 (adding e.g. `GROUP_2D` for 2d-materials + graphene + h-BN as a fundamentally distinct dimensional class).

---

## §4 Why n=6 lattice is auxiliary, not load-bearing (raw#10 C3)

Per `LATTICE_POLICY.md §1.2 + §1.3`:

- The n=6 invariants (σ=12, τ=4, φ=2, J₂=24) are **arithmetic facts**, true for any integer n=6.
- They show up in `verify/lattice_arithmetic.hexa` as an arithmetic sanity gate (σ·φ = n·τ = 24 must hold).
- They do **NOT** determine the verb count (17 ≠ 12, 17 ≠ 24).
- They do **NOT** determine the group count (7 ≠ 6, 7 ≠ 12).
- They do **NOT** appear in any material-property claim in `LIMIT_BREAKTHROUGH.md` or in the per-verb spec docs.

**The real taxonomy follows physics + engineering**:
- Bond character (ionic, covalent, metallic, van der Waals, H-bond)
- Processing route (sinter, polymerize, cast, weave, dye)
- End-product class (component, composite, structure, consumable)

This discipline matches hexa-bio's stance (5-axis count locked by `.roadmap.axis_expansion_decision_2026_05_08`; not derived from n=6) and hexa-energy's (verb count driven by physics + engineering, lattice is aux).

### §4.1 What "lattice-tautology" means here

A *lattice-tautology* is a claim like "hexa-matter has 12 ceramic verbs because σ(6) = 12". That would be a tautology (true by construction of the lattice) masquerading as engineering insight. We do **not** do this. The 5 ceramic verbs (CER group) are 5 because that is what the engineering taxonomy demands (concrete, ceramics, concrete_tech, glass, silicon are 5 distinct verbs by bond class + processing route, *regardless* of what σ(6) equals).

---

## §5 Comparison — hexa-bio's decomposition style

hexa-bio took a **5-axis locked count** approach: QUANTUM / WEAVE / NANOBOT / RIBOZYME / VIROCAPSID. The count is locked by `.roadmap.axis_expansion_decision_2026_05_08`; each axis carries an *exact* σ(6)=12 STRUCTURAL claim (with Bayesian audit n=30 / n=60 corpus log_BF decisive).

hexa-matter takes a **7-group expandable count** approach: groups are loose clusters, verb count is engineering-driven (now 17, queued to ~29 after Phase D), no Bayesian σ-match audit.

The reason for the difference: **hexa-bio axes are theory commitments**; the σ(6)=12 STRUCTURAL claim is *load-bearing* (a counter-example would falsify the axis). **hexa-matter groups are engineering clusters**; no counter-example exists because material parameters (T_m, σ, ρ) are measured, not derived from n=6.

This is the right call. Trying to force hexa-bio-style σ(6)=12 claims onto material verbs (e.g., "ceramic has σ(6)=12 vertices on its cluster") would be a lattice-fit — exactly the anti-pattern `LATTICE_POLICY` was authored to prevent.

---

## §6 Phase ordering — A → B → C → D → E → F → G

| Phase | Scope | Status |
|-------|-------|--------|
| **A** | Infrastructure docs (this commit): AXIS · AXIS_CLOSURE_PLAN · CLOSURE_RESIDUAL_BACKLOG · DECOMPOSITION_PLAN · LESSONS · RELEASE_NOTES_v1.0.0 · RELEASE_NOTES_v1.1.0 · V1_2_0_HANDOFF · USER_ACTION_REQUIRED · IMPORTED_FROM_CANON | ✅ **IN PROGRESS 2026-05-13** |
| **B** | Selftest gates: per-group spec-presence + per-verb cross-link sanity (raw#10 C3 — vendor numbers carry no lattice fit); B-CER-1..B-FAS-2 parity gates landing | Queued |
| **C** | Per-group depth dirs (silicon/, microplastics/ already exist; phase C adds superalloy/, 2d-materials/, etc.) | Queued |
| **D** | New verbs (12+): compound-semi, perovskite, 2d-materials, elastomer, adhesive, biodegradable-plastics, wood-cellulose, superalloy, printing, magnetic-materials, MOF, liquid-crystal | Queued |
| **E** | Python bridge `_python_bridge/module/` — Hales-anchored packing calc, Frenkel-anchored σ_th calc, mirror to hexa-bio pattern | Queued |
| **F** | Research bridge to live databases: MatWeb, NIST SRD, ASTM, SEMI, CRC | Queued |
| **G** | AlphaFold-class absorption: CALPHAD-class thermodynamic assessment, MatBench / Materials Project integration | Queued (long horizon) |

Phase A is **infrastructure only** — no code, no new verbs, no bridges. The next phase (B) will land per-verb selftest gates with the B-CER-1..B-FAS-2 parity infrastructure noted in `CLOSURE_RESIDUAL_BACKLOG.md §B`.

---

## §7 Risk / caveats

1. **Group boundaries are squishy in places** — `lutherie` straddles MET and culture-craft; `tire_cord` straddles POL and FIB; `microplastics` straddles POL and environmental-fate. We chose a single home for each verb but the boundary is not crisp. Phase D may move some verbs.

2. **Lattice-fit temptation** — when adding Phase D verbs (target 12 new = 17 + 12 = 29), there will be temptation to round to 24 or 36 for n=6 aesthetics. We will resist. Engineering count wins.

3. **External entity discipline** — when Phase F (research bridge) lands, vendor data (Wacker, Wolfspeed, DuPont, BASF) will flow in. The raw#10 C3 discipline — no lattice-fit on these — must be preserved. The `silicon/silicon.md` chapter sets the precedent: vendor tonnage tables in §3 vendor with explicit "this spec does not project these onto n=6 nor claim n=6 is implicated."

4. **The 6 vs 7 visibility issue** — we have **7 groups** but project name says **n=6**. This is intentional and is now explicit in `AXIS.md §9` and this doc. The lattice is auxiliary; engineering wins.

---

## §8 Honest C3

- This file is a *taxonomy proposal*, not a verification artifact.
- The 7-group split is one defensible decomposition; alternative groupings (e.g., 4-group Ashby super-class) would also work. We picked 7 for engineering granularity.
- The Phase D verb count (12) is a *target*, not a commitment. The actual count delivered will depend on user prioritization (see `USER_ACTION_REQUIRED.md`).
- No n=6 lattice anchoring of any verb count, group count, or material parameter (per LATTICE_POLICY §1.2).

---

*Document authored 2026-05-13 by 박민우 <nerve011235@gmail.com> as Phase A elevation. Taxonomic framework adapted from `hexa-bio/DECOMPOSITION_PLAN.md` (cycle-30++++++) with materials-science substitutions (Ashby/ASM/MatWeb instead of hexa-medic/hexa-bio biology splits).*
