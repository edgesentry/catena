# Port Cyber Clearance — E2E orchestrator (W6)

**Program status:** Cap Vista W0–W6 and demo D1–D4 done; W7 submission in
`edgesentry-commercial`.

| Workstream | Status | This package |
|------------|--------|--------------|
| W6 E2E | Done | `run_clearance.py` |
| D1 lifecycle | Done | `--scenario hold-to-pass` |
| D3 mock WORM | Done | `worm_store.py`, `verify_retention.py` |
| D4 path viz | Done | `pipeline/export_vessel_graph` |
| D5 AI narrative | Done | `--ai-narrative`, `ai_narrative.py` |

One command runs the Cap Vista UC1 demo path:

1. Load `profiles/maritime_cyber/manifest.yaml`
2. Build graph (+ optional Parquet under `data/processed/maritime_cyber/`)
3. Evaluate pass/hold → `*_facts.json` + `*_evaluation_manifest.json`
4. Render certificate HTML (`eds document render-clearance`)
5. Seal audit chain (`eds audit sign-clearance`)
6. Publish artefacts to **mock WORM** (G11 — append-only, content-addressed)
7. Export **impacted vulnerability paths** (D4 — JSON + HTML)
8. Optional **operator explanation** (D5 — guardrailed; cert section 1a)
9. Print third-party verify instructions

## Prerequisites

- catena: `uv sync`
- **eds** W4/W5: `cargo build -p eds` in `../edgesentry-rs`, or set `EDS_BIN`

## Usage

```bash
cd /path/to/catena

# Full E2E (hold vessel)
uv run python -m agents.port_clearance.run_clearance vessel-hold

# Pass vessel
uv run python -m agents.port_clearance.run_clearance vessel-clean

# D1: E7 -> E9 -> E10 -> re-E7
uv run python -m agents.port_clearance.run_clearance vessel-hold \
  --scenario hold-to-pass

# Lifecycle beats:
# E7 baseline (vessel-hold -> hold)
# E9 UC2 query (CVE-2021-44228 -> vessel-hold)
# E10 SBOM patch (log4j 2.14.1 -> 2.15.0)
# re-E7 pass (new decision_hash, prior_decision_hash link)

When `eds` is available, sealed runs call `eds audit verify-clearance` after
`sign-clearance`.

# Eval only (no eds)
uv run python -m agents.port_clearance.run_clearance vessel-hold \
  --skip-render --skip-seal

# Skip WORM publish
uv run python -m agents.port_clearance.run_clearance vessel-hold --skip-worm

# Skip graph export (D4)
uv run python -m agents.port_clearance.run_clearance vessel-hold \
  --skip-graph-export

# Copy graph HTML to operations-console / commercial artefacts
uv run python -m agents.port_clearance.run_clearance vessel-hold \
  --copy-graph-to-operations-console
uv run python -m agents.port_clearance.run_clearance vessel-hold \
  --copy-graph-to-capvista-submission

# D4 standalone
uv run python -m pipeline.export_vessel_graph vessel-hold \
  --copy-to-operations-console-dist --copy-to-capvista-submission

# D5 operator explanation
uv run python -m agents.port_clearance.run_clearance vessel-hold \
  --ai-narrative

# Narrative from facts
FACTS=data/processed/maritime_cyber/clearance_runs/vessel-hold/\
vessel-hold_facts.json
uv run python -m agents.port_clearance.generate_narrative "$FACTS" --write

# JSON summary
uv run python -m agents.port_clearance.run_clearance vessel-hold --json
```

Outputs: `data/processed/maritime_cyber/clearance_runs/<vessel_key>/`.

## Immutable retention (G11 / D3)

Artefacts copy to **mock WORM** storage (append-only, read-only objects):

- `*_integrated_snapshot.json`
- `*_evaluation_manifest.json`
- `*_clearance_chain.json` (when sealed)

Publish record: `*_worm_publish.json` (keys + SHA-256 + `published_at`).

Default: `data/processed/maritime_cyber/worm_store/clearance/`  
Override: `export CLEARANCE_WORM_ROOT=/path/to/worm`

### Third-party retention verify

```bash
uv run python -m agents.port_clearance.verify_retention \
  data/processed/maritime_cyber/clearance_runs/vessel-hold/\
vessel-hold_port-call-demo-sgsin_worm_publish.json
```

Fetch WORM objects → verify SHA-256 → `assert_manifest_audit_refs` on manifest.

**Cap Vista PoC** does not require R2 upload (`CLEARANCE_WORM_URI` is future).

## Impacted path visualization (D4)

Unless `--skip-graph-export`:

- `<prefix>_impacted_paths.json` — `impacted_paths[]` from facts
- `<prefix>_impacted-path.html` — Component → CVE → Asset → Vessel

`--copy-graph-to-operations-console` →
`apps/operations-console/dist/<vessel>_impacted-path.html`

## Run outputs (prefix `vessel-hold_port-call-demo-sgsin`)

| Artefact | WS |
|----------|-----|
| `*_facts.json`, `*_evaluation_manifest.json` | W3 |
| `*_integrated_snapshot.json` | D2 |
| `*_port-cyber-clearance.html` | W5 |
| `*_clearance_chain.json` | W4 |
| `*_worm_publish.json` | D3 |
| `*_impacted_paths.json`, `*_impacted-path.html` | D4 |
| `*_operator_explanation.txt`, `*_operator_explanation_meta.json` | D5 |
| `*_run_summary.json` | W6 |

## Related

- W3: `pipeline/port_clearance_eval.py`
- W4: `edgesentry-rs/docs/port-cyber-clearance-audit.md`
- W5: `apps/operations-console/dist/*_port-cyber-clearance.html`
- Tests: `tests/maritime_cyber/README.md`
