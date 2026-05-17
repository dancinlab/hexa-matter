#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════════════
# RARE-EARTH+ALTERNATIVE.log.tape — append-only event history
# ══════════════════════════════════════════════════════════════════════
# Per AGENTS.tape @D g_arch_vs_log_split.
# Architecture sibling: RARE-EARTH+ALTERNATIVE.tape
# ══════════════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@A genesis_2026_05_17 := "RARE-EARTH+ALTERNATIVE.tape created" :: assistant [d=2026-05-17 ok]
  => "6-track REE substitution roadmap seeded (recycling · ferrite-hd · Mn-Al-C · boride · low-Dy/Tb · AI-found); 14+ arxiv 2024-2026 anchors; 4 forbidden patterns; 5 hxm-mag-* candidates seeded in NOVEL.md §3.5"

@D correction_2026_05_17 := "Mn₂MoB₄ misattribution corrected" :: decision [d=2026-05-17 ok]
  <- "@A genesis_2026_05_17"
  => "initial web-search summary mis-attributed Mn₂MoB₄ / Mn₂WB₄ to arxiv:2507.01849 boride family. Direct arxiv HTML fetch confirms paper's actual 10 candidates are FeSn / CrSb / Mn₂Sb / FeB / FeNi / Fe2P / Fe3Ga / FeGe / ZnFe / Fe8N — no boride formulas appear. Beeson 2025 Adv. Mater. C16 high-entropy boride (DOI 10.1002/adma.202516135) added as separate peer-reviewed boride anchor. Mn₂Sb (predicted Tc=2270K, K=1.57 MJ/m³) added as new NOVEL candidate hxm-mag-mn2sb-001."
  |> "RARE-EARTH+ALTERNATIVE.tape @L t4_boride correction-note field + @X x_beeson_2025_adv_mater added"

@N mp_lookup_blocked_2026_05_17 := "Materials Project live lookup blocked" :: investigation [d=2026-05-17]
  attempted = "promote hxm-mag-boride-001 DESIGN → SIM-DFT via MP cross-reference"
  outcome   = "BLOCKED — mp_api package + MP_API_KEY both absent in environment"
  evidence  = "mp_api_smoke.py --selftest PASS (offline fixture only)"
  next-step = "user installs mp-api>=0.41.0 + sets MP_API_KEY → re-run with composition / mp-id query"

# ─── append new events below this line ───
