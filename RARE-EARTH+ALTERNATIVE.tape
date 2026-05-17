#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════════════
# .tape v1.2 — grammar primer (cold-read by any LLM / agent / human)
# ══════════════════════════════════════════════════════════════════════
# Form: each entry is `@<type> <id> := "<subject>" :: <kind> [<grades>]`
#       optionally followed by body lines (2-space indent) — key=value,
#       edges (<- -> => …), or quoted prose.
#
# ENTRY TYPES (17):
#   Runtime (10): @S session  @U user  @A assistant  @T tool-call  @R result
#                 @H hook  @D decision  @K cost  @P provider  @? anomaly
#   Foundation:   @I identity-claim
#   Declarative:  @X external-citation  @F forbidden-pattern  @N note
#                 @C config  @L layout  @V spec-version
#
# EDGES (12, on body lines, 2-space indent):
#   Causal:     <- caused-by   -> triggers   == continues
#               ~> supersedes  !! aborts     |> verified-by
#   Effect:     => produces (followed by quoted natural-language)
#   Structural: <: specializes  :> generalizes  ?> soft-depends
#               !> conflicts-with  @> projects-to (e.g. @> AGENTS.md)
#
# GRADE TAGS (in [...] on entry header):
#   Delivery:   ok · err · denied · cancelled · partial · superseded
#   Governance: required · recommended · optional · draft · active · deprecated
#   Scoped:     allow:<x> · deny:<x>
#   Time/index: T<n> (turn)  N<n> (wall-sec)  d=<YYYY-MM-DD>
#
# PAYLOAD SYNTAX (body lines):
#   key = "value"           single-line string
#   key = [a, b, c]         array literal
#   key <<~EOF              heredoc (multi-line; ends with EOF on own line)
#     multi-line text
#   EOF
#   "see [@x1] §3"          inline citation by entry id
#   `cmd or path`           backtick code-span (inline only)
#
# Full spec: ~/core/tape/spec/tape.md (or github.com/dancinlab/tape)
# ══════════════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "rare-earth+alternative" :: identity-claim [d=2026-05-17 active]
  kind   = "META-DOMAIN — REE × Substitution roadmap (only when BOTH conditions hold)"
  brief  = "5-track substitution roadmap for the rare-earth supply problem. Anchored to arxiv 2025-2026 literature. Feeds hxm-mag-* candidates into NOVEL.md §3.5."
  parent = "dancinlab/hexa-matter"
  sibling-md = "RARE-EARTH+ALTERNATIVE.md (planned)"
  intersects = ["RARE-EARTH.tape (element family)", "MAGNETIC-MATERIALS.tape (verb scope)"]
  @> AGENTS.md

# ────────────────────────────────────────────────────────────────────
# Layout — the 5 substitution tracks
# ────────────────────────────────────────────────────────────────────

@L tracks := "5-track substitution roadmap" :: roadmap [active d=2026-05-17]

@L t1_recycling := "TRACK 1 — closed-loop NdFeB recycling" :: track [active d=2026-05-17]
  approach   = "hydrometallurgical leach + selective precipitation of EoL NdFeB (HDD / EV motor / wind nacelle)"
  ceiling    = "~40% demand offset for mobility magnets over the next decade ([@x_climate_change_news_2026])"
  blocker    = "commercial-scale economics still uncertain; ROW collection logistics fragmented"
  feedstock  = ["~75 kt/yr EoL HDD globally", "EV motor wave starts ~2030+ (15-year vehicle life)", "wind nacelle wave ~2035+ (20-year asset life)"]
  hxm        = "(process track — does NOT become a hxm-mag-* novel entry; lives in RECYCLING.tape · HEXA-RECYCLE.tape)"
  |> "[@x_arxiv_2506_22569]  Toward Sustainable REE Production"
  |> "[@x_arxiv_2504_10495]  REE recovery from phosphogypsum"

@L t2_ferrite_hd := "TRACK 2 — high-density anisotropic ferrite" :: track [active d=2026-05-17]
  approach     = "SrFe₁₂O₁₉ / BaFe₁₂O₁₉ M-type hexaferrite, Co/La/Mn co-doped for enhanced (BH)max"
  cost         = "iron oxide + Sr/Ba carbonate — REE-FREE, ~10× cheaper raw than NdFeB"
  performance  = "(BH)max ~5 MGOe (commercial Sr-ferrite) vs NdFeB ~50 MGOe → 10× volume / mass penalty for same flux"
  envelope     = "best fit: low-cost EV (sub-200 kW), industrial motors, micro-magnets, magnetic separation"
  hxm          = "→ NOVEL.md §3.5 hxm-mag-ferrhd-001"
  |> "[@x_acs_lca_2024]  LCA of REE-free magnets — Sr-ferrite + Mn-Al-C"

@L t3_mnalc := "TRACK 3 — Mn-Al-C τ-phase intermetallic" :: track [active d=2026-05-17]
  approach    = "Mn₅₅Al₄₄C₁ ordered L1₀ τ-phase (REE-free, Co-free)"
  performance = "(BH)max ~7-12 MGOe lab-scale; Hc ~0.3 T; Tc ~340°C"
  status      = "decades-old discovery (Koch 1960s); revived interest 2020+ via mechanochemical synthesis"
  blocker     = "τ-phase metastability — formation window narrow, demixing on T cycling"
  hxm         = "→ NOVEL.md §3.5 hxm-mag-mnalc-001"
  |> "[@x_acs_lca_2024]"
  |> "[@x_arxiv_2507_01849]  DFT high-throughput screen"

@L t4_boride := "TRACK 4 — rare-earth-free borides + nitrides" :: track [active d=2026-05-17]
  approach     = "DFT high-throughput discovery of Mn₂MoB₄ / Mn₂WB₄ / 5-element quinary borides (Georgetown 2026)"
  performance  = "magnetocrystalline anisotropy approaching NdFeB; some exceed prior REE-free high-entropy boride records"
  status       = "predicted only — synthesis + bulk magnetic measurement pending"
  novelty      = "5-element compositions sit naturally near n=6 lattice — high-entropy boride space largely unexplored"
  hxm          = "→ NOVEL.md §3.5 hxm-mag-boride-001"
  |> "[@x_arxiv_2507_01849]  Data-driven HT search for REE-free PMs"
  |> "[@x_arxiv_2501_01607]  Unveiling potential REE-free candidates"
  |> "[@x_phys_org_2026_boride]  Georgetown quinary boride announcement"

@L t5_lowdy := "TRACK 5 — light-REE substitution in NdFeB (low-Dy/Tb)" :: track [active d=2026-05-17]
  approach     = "replace expensive heavy-REE (Dy, Tb) with cheaper abundant LREE (Ce, La) at Nd₂Fe₁₄B grain boundaries"
  goal         = "preserve thermal coercivity above 150°C while cutting heavy-REE content by ≥50%"
  trade-off    = "Ce/La addition reduces saturation magnetization → must compensate via grain refinement + GB diffusion"
  status       = "Toyota / Daido + Hitachi Metals have published prototype motor magnets with 50-80% Dy reduction"
  hxm          = "→ NOVEL.md §3.5 hxm-mag-lowdy-001"
  |> "[@x_pmc_securing_2024]  Securing REE PMs for sustainable energy"
  |> "[@x_arxiv_2312_02475]  ML predictions of coercivity"

@L t6_ai := "TRACK 6 — AI / ML discovery from large magnetic-materials DBs" :: track [active d=2026-05-17]
  approach     = "graph-NN + descriptor-based screening over MAGNDATA · NEMAD · MP · GNoME for unexplored ferromagnets"
  evidence     = "NEMAD (67,573 entries, 90% classifier accuracy); 25 promising high-Tc compounds surfaced"
  status       = "computational candidates only — experimental validation rate currently ≤5%"
  caveat       = "AI predictions ≠ measurements (project governance @F f2)"
  hxm          = "→ NOVEL.md §3.5 hxm-mag-aifound-001"
  |> "[@x_arxiv_2409_15675]  NEMAD database (67k magnetic compounds)"
  |> "[@x_arxiv_2509_05909]  ML magnetic-order classification"
  |> "[@x_arxiv_2507_01913]  Structure-based ML for magnetic ordering"

# ────────────────────────────────────────────────────────────────────
# External anchors — arxiv 2024-2026 + supporting press
# ────────────────────────────────────────────────────────────────────

@X x_arxiv_2507_01849 := "Data-driven high-throughput search for REE-free PMs" :: arxiv-paper [active d=2025-07]
  url       = "https://arxiv.org/abs/2507.01849"
  finding   = "DFT screen on binary alloys → 10 promising candidates (incl. Mn₂MoB₄, Mn₂WB₄); MAE + Tc evaluated"
  role      = "primary anchor for TRACK 4 boride family"

@X x_arxiv_2501_01607 := "Unveiling potential candidates for REE-free magnets" :: arxiv-paper [active d=2025-01]
  url     = "https://arxiv.org/pdf/2501.01607"
  finding = "complementary candidate enumeration; intermetallic + transition-metal-rich phases"

@X x_arxiv_2506_22569 := "Toward Sustainable REE Production — TEA + LCA + Social" :: arxiv-paper [active d=2025-06]
  url       = "https://arxiv.org/abs/2506.22569"
  finding   = "Nd is 63-89 wt% of REE content in NdFeB; recycling must hit higher rates; hydromet material costs dominate OPEX"
  role      = "primary anchor for TRACK 1 recycling"

@X x_arxiv_2504_10495 := "REE Recovery from Phosphogypsum" :: arxiv-paper [active d=2025-04]
  url     = "https://arxiv.org/abs/2504.10495"
  finding = "bio-inspired adsorptive separation treatment train for secondary REE source from fertilizer waste"

@X x_arxiv_2504_07007 := "Data-Driven Insights into REE Mineralization (ML on hydrothermal data)" :: arxiv-paper [active d=2025-04]
  url     = "https://arxiv.org/abs/2504.07007"
  finding = "ML predicts product elements + phases from synthesis conditions; usable for industrial separation tuning"

@X x_arxiv_2509_05909 := "Learning Magnetic Order Classification from Large-Scale DBs" :: arxiv-paper [active d=2025-09]
  url     = "https://arxiv.org/abs/2509.05909"
  finding = "MAGNDATA-trained classifiers reach >92% accuracy on propagation vectors"

@X x_arxiv_2507_01913 := "Structure-based ML for magnetic ordering + moment" :: arxiv-paper [active d=2025-07]
  url     = "https://arxiv.org/abs/2507.01913"
  finding = "refined descriptor generalizes across 5741 stable binary + ternary Fe/Mn/Co compounds"

@X x_arxiv_2409_15675 := "NEMAD — Northeast Materials Database (magnetic)" :: arxiv-paper [active d=2024-09]
  url     = "https://arxiv.org/html/2409.15675v1"
  finding = "67,573 experimentally-validated entries; 90% accuracy ferro/antiferro/non-mag classification"
  role    = "primary anchor for TRACK 6 AI discovery"

@X x_arxiv_2312_02475 := "ML predictions of coercivity in high-performance PMs" :: arxiv-paper [active d=2023-12]
  url     = "https://arxiv.org/abs/2312.02475"
  finding = "coercivity ML predictor; usable for Dy/Tb substitution design"

@X x_arxiv_2605_02926 := "Geostrategic Critical Minerals + Materials Resilience" :: arxiv-paper [active d=2026-05]
  url     = "https://arxiv.org/abs/2605.02926"
  finding = "QCCM dashboard for quantum-tech criticality; methodology transfers to REE"

@X x_arxiv_2508_00556 := "Systemic Trade Risk Suppresses Comparative Advantage in REE Industries" :: arxiv-paper [active d=2025-08]
  url     = "https://arxiv.org/html/2508.00556v1"
  finding = "downstream REE-dependent industries see >50% productivity loss under trade-shock scenarios"

@X x_arxiv_2506_11645 := "Expert-Insight Modeling of Non-Kinetic Strategic Deterrence (REE)" :: arxiv-paper [active d=2025-06]
  url     = "https://arxiv.org/abs/2506.11645"
  finding = "simulation-driven framework for REE supply-disruption deterrence scenarios"

@X x_arxiv_2512_20317 := "Critical Minerals in the Indian Context" :: arxiv-paper [active d=2025-12]
  url     = "https://arxiv.org/abs/2512.20317"
  finding = "copper tailings + fly-ash + e-waste as underutilized REE feedstock"

@X x_arxiv_2405_01128 := "REE-based magnetocaloric intermetallics for H₂ liquefaction" :: arxiv-paper [active d=2024-05]
  url     = "https://arxiv.org/html/2405.01128v3"
  finding = "criticality-aware review of Gd-based magnetocaloric materials"

@X x_pmc_securing_2024 := "Securing REE Permanent Magnet Needs for Sustainable Energy" :: review [active d=2024]
  url     = "https://pmc.ncbi.nlm.nih.gov/articles/PMC11595260/"
  finding = "Dy/Tb minimization via Ce/La substitution at grain boundaries; production-scale routes"

@X x_acs_lca_2024 := "LCA of REE-Free PM Alternatives — Sintered Ferrite + Mn-Al-C" :: paper [active d=2024]
  url     = "https://pubs.acs.org/doi/10.1021/acssuschemeng.3c02984"
  finding = "ferrite + Mn-Al-C beat NdFeB on cradle-to-gate impact per kg, but require 5-10× volume for equal flux"

@X x_climate_change_news_2026 := "The energy transition has a rare earth problem — startups solving it" :: press [active d=2026-05]
  url     = "https://www.climatechangenews.com/2026/05/05/the-energy-transition-has-a-rare-earth-problem-these-startups-are-solving-it/"
  finding = "recycling + substitution roadmap; ~40% demand offset ceiling for mobility magnets via recycling"

@X x_phys_org_2026_boride := "Georgetown — new class of strong magnets uses earth-abundant elements" :: press [active d=2026-01]
  url     = "https://phys.org/news/2026-01-class-strong-magnets-earth-abundant.html"
  finding = "quinary boride compositions exceed prior REE-free high-entropy magnet records"

@X x_sciencedaily_2026_ai := "AI breakthrough could replace REE magnets in EVs" :: press [active d=2026-02]
  url     = "https://www.sciencedaily.com/releases/2026/02/260218031611.htm"
  finding = "67,000-compound AI DB; 25 promising high-Tc candidates surfaced (matches NEMAD)"

# ────────────────────────────────────────────────────────────────────
# Governance — what counts as a real alternative
# ────────────────────────────────────────────────────────────────────

@D g1_substitution_defined := "what-counts-as-alternative" :: governance [required active d=2026-05-17]
  rule <<~EOF
    A REE alternative is admitted to this file IFF at least one holds:
      (a) eliminates ≥1 REE element from the magnetic phase (TRACK 2/3/4),
      (b) reduces Dy/Tb content by ≥50% at equal envelope (TRACK 5),
      (c) replaces virgin REE with secondary feedstock at >25% mass (TRACK 1),
      (d) surfaces a candidate not previously enumerated in MP / GNoME / OMat24
          databases at design time (TRACK 6 — only when this novelty holds).
    "Marketing-grade" substitution (e.g., AlNiCo for niche industrial) without
    quantitative envelope-match is NOT in scope.
  EOF
  why = "without a quantitative gate, every iron-based magnet becomes a 'rare-earth alternative' marketing claim. Real engineering replacement requires envelope-match + heavy-REE reduction."
  |> "TRACK 1-6 §performance and §approach fields"

@D g2_real_limits_first := "anchor-to-real-magnetic-physics" :: governance [required active d=2026-05-17]
  rule    = "Performance ceilings are bounded by real magnetic physics ((BH)max upper bound ≈ 64 MGOe for NdFeB at theoretical density; Hc/Hk Brown's relation), NOT by n=6 lattice fits."
  anchors = ["Stoner-Wohlfarth single-domain limit", "Brown's coercivity inequality", "anisotropy field H_K = 2K₁/μ₀M_s"]
  ?> "[@x_lattice_policy] §1.2 real-limits catalogue"
  ?> "[[LIMIT_BREAKTHROUGH]]  (Wave M magnet entries: NdFeB / SmCo / Mn-Al-C walls)"

@D g3_arxiv_freeze := "arxiv-snapshot-2025-04-to-2026-05" :: governance [recommended active d=2026-05-17]
  rule = "@X arxiv citations in this file are frozen to the 2025-04 → 2026-05 literature wave that motivated TRACK 4-6 selection. New literature triggers a NEW @X entry (do NOT silently rewrite an existing one)."
  why  = "preserve the evidence base future maintainers can replay; arxiv preprints get revised — pinning the URL + finding line documents what we read when."

# ────────────────────────────────────────────────────────────────────
# Forbidden patterns
# ────────────────────────────────────────────────────────────────────

@F f1_lab_mm_strength_claim := "lab-mm performance ≠ production performance" :: anti-pattern [denied d=2026-05-17]
  rule = "Lab-scale single-crystal / thin-film / mm-sample magnetic performance MUST NOT be presented as production-grade. Always tag: lab-scale / pilot / production."
  examples <<~EOF
    Fe₁₆N₂ thin-film (BH)max ~135 MGOe (Coey et al.) ≠ producible bulk magnet
    Mn-Al-C τ-phase 12 MGOe (mechanochemical lab) ≠ sintered pellet 12 MGOe
    CNT yarn 80 GPa (lab-mm) ≠ structural-cable strength
  EOF
  fix = "every performance claim gets a (lab-mm | pilot | production) tag; absent tag → reject"

@F f2_ai_prediction_as_measurement := "DFT / ML predictions ≠ measurements" :: anti-pattern [denied d=2026-05-17]
  rule = "DFT MAE, ML coercivity, NEMAD high-Tc candidates are PREDICTIONS. Tag SIM-DFT / SIM-NNP / SIM-PROXY in NOVEL.md. Promotion to EXTERNAL-VERIFIED requires attributed external measurement."
  inherits-from = "[[AGENTS]] @F f2 predictions-promoted-to-measurements"
  |> "selftest/c_handoff_completeness_audit.py"

@F f3_recycling_silver_bullet := "recycling does not zero out new mining" :: anti-pattern [denied d=2026-05-17]
  rule = "Claims that recycling can supply >40% of NdFeB demand in the next decade are not supported by feedstock availability (EoL wave timing) — see TRACK 1 ceiling."
  why  = "EV motor + wind nacelle recycling waves are 10-20 years out due to asset life; HDD wave is shrinking due to SSD displacement."

@F f4_quinary_boride_overclaim := "Georgetown boride is predicted, not produced" :: anti-pattern [denied d=2026-05-17]
  rule = "Mn₂MoB₄ / quinary boride claims are DFT-predicted MAE + first-principles Tc. No bulk magnetic-measurement evidence published as of 2026-05-17. Do NOT cite as a replacement-ready magnet."
  fix  = "TRACK 4 candidates stay in NOVEL.md DESIGN status until experimental Hc + (BH)max measured"

# ────────────────────────────────────────────────────────────────────
# Novel-ledger seeds — feeds NOVEL.md §3.5
# ────────────────────────────────────────────────────────────────────

@N mp_lookup_attempt_2026_05_17 := "Materials Project lookup of Mn₂MoB₄ / Mn₂WB₄ — gated" :: investigation [active d=2026-05-17]
  attempted = "boride candidates from arxiv:2507.01849 (TRACK 4) for promotion DESIGN → SIM-DFT via MP record cross-reference"
  outcome   = "BLOCKED — `mp_api` Python package not installed AND `MP_API_KEY` env var not set in this environment"
  evidence  = "ran `python3 _absorption_bridge/materials_project/mp_api_smoke.py --selftest` → __HEXA_MATTER_MP_API_SMOKE__ PASS (offline fixture only; live API path SKIP)"
  next-step = "user installs `mp-api>=0.41.0` + sets `MP_API_KEY` → re-run with `--mp-id mp-XXX` for Mn-Mo-B / Mn-W-B compositions"
  candidate-status = "hxm-mag-boride-001 stays DESIGN (per @F f4_quinary_boride_overclaim — DFT prediction insufficient)"

@N seed_novel_md := "5 hxm-mag-* candidates to add to NOVEL.md §3.5" :: planned-edit [active d=2026-05-17]
  ids = [
    "hxm-mag-boride-001  : Mn₂MoB₄ quinary boride (TRACK 4)",
    "hxm-mag-mnalc-001   : Mn-Al-C τ-phase (TRACK 3)",
    "hxm-mag-ferrhd-001  : SrFe₁₂O₁₉ Co/La-doped high-density (TRACK 2)",
    "hxm-mag-lowdy-001   : Nd₂Fe₁₄B with Ce/La heavy-REE replacement (TRACK 5)",
    "hxm-mag-aifound-001 : NEMAD-screened high-Tc candidate (TRACK 6)"
  ]
  status = "DESIGN — quantitative falsifier defined per @D g1_substitution_defined"
  note   = "TRACK 1 (recycling) is a PROCESS track, not a de-novo material → does NOT get a hxm-mag-* entry; lives in RECYCLING.tape per NOVEL §0 scope boundary."
  -> "NOVEL.md §3.5 Magnetic materials (rare-earth-free)"

# ────────────────────────────────────────────────────────────────────
# Cross-link hooks
# ────────────────────────────────────────────────────────────────────

@H h1_xlink_rare_earth := "links-to-element-family" :: cross-link [active d=2026-05-17]
  ?> "[[RARE-EARTH]]"
  why = "element-family detail (which REE goes where) lives in RARE-EARTH.tape; this file only references it"

@H h2_xlink_magnetic := "links-to-magnetic-materials-verb" :: cross-link [active d=2026-05-17]
  ?> "[[MAGNETIC-MATERIALS]]"
  why = "MAGNETIC-MATERIALS.tape covers the verb itself (process / characterization / parity gates); this file is the alternative-track lens"

@H h3_xlink_recycling := "links-to-recycling-domain" :: cross-link [active d=2026-05-17]
  ?> "[[RECYCLING]]"
  ?> "[[HEXA-RECYCLE]]"
  why = "TRACK 1 (NdFeB hydromet recycling) is fully owned by RECYCLING.tape; this file references it without duplicating"

@H h4_xlink_critical_mineral := "links-to-broader-critical-mineral-context" :: cross-link [active d=2026-05-17]
  ?> "[[CRITICAL-MINERAL]]"
  why = "Ga / Ge / Sb / W / Co / Li export-control context lives in CRITICAL-MINERAL.tape; REE is one of many"

# ─── §Log (append @A / @D events here, chronological) ────────────────
#
#   @A commit_<hash> :: rare-earth+alternative [d=<YYYY-MM-DD> ok]
#     <- <prev-id>
#     => "<one-line description>"
#
# See ~/core/tape/spec/tape.md for full grammar.
