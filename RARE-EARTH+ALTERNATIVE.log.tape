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

@A deepen_2026_05_17 := "TRACK 4/6 candidate specification deepened" :: assistant [d=2026-05-17 ok]
  <- "@D correction_2026_05_17"
  => "Beeson C16 boride detail extracted: Fe/Co sublattice mixing flips easy-plane→easy-axis anisotropy, >2× coercivity vs binary/ternary; thin-film (combinatorial sputter) — bulk NOT demonstrated. hxm-mag-boride-001 falsifier F-MAG-4 retargeted to thin-film K₁ + bulk-synthesis-demo gate."
  => "NEMAD Table 4 fetched (arxiv:2409.15675 HTML): 62 FM candidates Tc>500K. Top REE-free Fe-Co intermetallics: Ga₃Fe₄Co₈Si / FeCo₂Ge / GaFe₂Co₄Si / Fe₃Co₃Si₂. hxm-mag-aifound-001 specialized to FeCo₂Ge (Heusler-like, 3-model Tc consensus 999/1051/1068 K, simple composition)."

@N mp_api_installed_2026_05_17 := "mp-api package installed" :: investigation [d=2026-05-17]
  <- "@N mp_lookup_blocked_2026_05_17"
  outcome   = "mp-api 0.45.9 + pymatgen 2024.8.9 now installed (pip3, user site-packages)"
  remaining = "MP_API_KEY env var still NOT set — user must obtain a free key at materialsproject.org/api and export it"
  next-step = "once MP_API_KEY set: query MP for FeCo₂Ge / Mn₂Sb / Beeson-composition records → promote candidates DESIGN → SIM-DFT"

# ─── append new events below this line ───
