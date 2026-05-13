# `materials_project/SOURCES.md` — Materials Project (Berkeley/LBNL)

> Phase G adapter target: `mp_api_smoke.py` (smoke; real fetch needs `mp-api` SDK + free API key)

---

## System

- **Name**: Materials Project
- **Maintainer**: Lawrence Berkeley National Laboratory / UC Berkeley
- **Web**: https://materialsproject.org
- **API docs**: https://api.materialsproject.org
- **Scale (as of 2024)**: ~154,000 inorganic crystal structures + DFT-computed properties (band gap, formation energy, elastic tensor, band structure, ...)

## Authoritative citation

- Persson, K. A. et al. "Commentary: The Materials Project: A materials genome approach to accelerating materials innovation." **APL Materials** 1, 011002 (2013). DOI: 10.1063/1.4812323

## API endpoint + auth

- Base URL: `https://api.materialsproject.org`
- Auth: free API key required (sign up at https://next-gen.materialsproject.org/api)
- Python SDK: `pip install mp-api` (preferred) — see https://github.com/materialsproject/api
- Rate limits: anonymous / lightly-throttled per key; bulk downloads through Zenodo snapshots
- Identifier scheme: `mp-XXXXX` (e.g. `mp-149` = Si, `mp-1062` = Cu, `mp-30` = AlNi)

## License

- Data: CC-BY 4.0 (Materials Project Terms of Use)
- Citation discipline: each adapter caches the `material_id` + accessed-on timestamp; downstream hexa-matter docs cite `material_id` not raw numeric values

## Honest notes

- **Not a measurement** — Materials Project DFT values are *computed*, not lab-measured. They are first-principles predictions whose error bars vary by property (band gap GGA-PBE typically underestimates by ~50%).
- **No n=6 lattice-fit** applied to MP outputs (raw#10 C3). MP carries its OWN error bars (e.g. formation energy ±0.1 eV/atom typical).
- **Adapter caching**: `cache/<md5-stamp>.json` per request; bundled fixture is `cache/sample_response.json` for selftest replay.

## Cross-link

- `_python_bridge/module/pymatgen_structure_io.py` — pymatgen `mp-XXX` ID regex validator (Phase E)
- `_absorption_bridge/materials_project/mp_api_smoke.py` — this phase's adapter
- `silicon/silicon.md` — Si-related MP records cited via `mp-149`
