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

@I id001 := "magnetic_materials" :: identity-claim [d=2026-05-14 active]
  kind = "MAGNETIC-MATERIALS — Phase D candidate stub"
  brief = "Magnetic materials split into two operational classes:"
  parent = "dancinlab/hexa-matter"
  sibling-md = "MAGNETIC-MATERIALS.md"

# ────────────────────────────────────────────────────────────────────
# Cross-links — added 2026-05-17
# ────────────────────────────────────────────────────────────────────

@H h_xlink_rare_earth_alternative := "REE-free magnet roadmap" :: cross-link [active d=2026-05-17]
  ?> "[[RARE-EARTH+ALTERNATIVE]]"
  why = "5-track REE substitution roadmap (recycling · ferrite-hd · Mn-Al-C · boride · low-Dy/Tb · AI-found) lives in RARE-EARTH+ALTERNATIVE.tape; this file owns the verb (process · characterization · parity gates)"

@H h_xlink_rare_earth := "REE element-family reference" :: cross-link [active d=2026-05-17]
  ?> "[[RARE-EARTH]]"
  why = "Nd / Pr / Dy / Tb / Sm / Eu application + supply detail lives in RARE-EARTH.tape"

# ─── §Log (append @A / @D events here, chronological) ────────────────
# 
# Pre-existing log entries live in MAGNETIC-MATERIALS.md.
# New per-domain history entries land here as typed events:
#
#   @A commit_<hash> :: <domain> [d=<YYYY-MM-DD> ok]
#     <- <prev-id>
#     => "<one-line description>"
#
#   @D <id> := "<decision-name>" :: <domain> [<grades>]
#     <- <evidence-id>
#     |> <verifier>
#
# See ~/core/tape/spec/tape.md for full grammar.
