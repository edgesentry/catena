# pipeline

Port Cyber Clearance PoC — Python package `pipeline`.

## Layout

| Path | Role |
|------|------|
| `pipeline/maritime_cyber/` | Graph, evaluation, fleet demo, audit refs |
| `pipeline/port_clearance_eval.py` | Profile entrypoint (W3) |
| `pipeline/export_vessel_graph.py` | D4 impacted-path HTML export |
| `pipeline/maritime_cyber_graph.py` | Graph CLI |
| `agents/port_clearance/` | W6 E2E runner, WORM store, narratives |
| `tests/maritime_cyber/` | Unit + integration tests |
| `fixtures/` | SBOM, CVE snapshot, asset map, fleet-demo |
| `profiles/maritime_cyber/` | Pipeline profile manifests |
| `rules/sg-cyber-clearance-v0.yaml` | Rule pack |
| `scripts/generate_maritime_cyber_fixtures.py` | Regenerate demo fixtures |

`_REPO_ROOT` in `pipeline/maritime_cyber/*` is **`catena/`** (no nested
`pipeline/pipelines/` tree).

## Run tests

```bash
cd /path/to/catena
uv sync --extra test
uv run pytest tests/maritime_cyber -q
```

## Sibling repos

- `../edgesentry-rs` — `eds` render-clearance, sign-clearance
- `../documaris/dist` — HTML bundles from `export_vessel_graph.py`
- `../edgesentry-commercial/.../submission/artefacts` — CapVista artefacts
