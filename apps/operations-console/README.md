# operations-console

**W5 clearance HTML templates live in `documaris` — not vendored here.**

Canonical repo: `../../documaris`

| Asset | documaris path |
|-------|----------------|
| Template spec | `templates/port-cyber-clearance.md` |
| Field map | `field_maps/port_cyber_clearance_field_map.json` |
| Sample HTML | `dist/*_port-cyber-clearance.html` |

## What moved to catena (tested in catena CI)

| Capability | catena path | Tests |
|------------|-------------|-------|
| Evaluation + facts | `pipeline/` | `tests/maritime_cyber/`, contracts |
| E2E orchestration | `agents/port_clearance/` | `tests/maritime_cyber/` |
| Impacted-path export | `pipeline/export_vessel_graph.py` | `test_export_vessel_graph` |
| Copy bundle to documaris `dist/` | `--copy-graph-to-documaris` | same |

Render: `eds document render-clearance` (**edgesentry-rs**). Seal:
`eds audit sign-clearance`. Test those in **edgesentry-rs**, not catena.
