# operations-console — Port Cyber clearance (W5)

Canonical W5 assets for Cap Vista Port Cyber live here and are tested in
**catena CI** (`tests/apps/`, `make test-apps`).

| Asset | Path |
|-------|------|
| Template spec | `templates/port-cyber-clearance.md` |
| Field map | `field_maps/port_cyber_clearance_field_map.json` |
| Facts fixtures | `fixtures/clearance/*_facts.json` |
| Sample HTML | `dist/*_port-cyber-clearance.html` |
| Regenerate dist | `scripts/render-clearance-samples.sh` |

## Related catena paths

| Capability | Path | Tests |
|------------|------|-------|
| Evaluation + facts | `pipeline/` | `tests/maritime_cyber/`, contracts |
| E2E orchestration | `agents/port_clearance/` | integration + e2e |
| Impacted-path export | `pipeline/export_vessel_graph.py` | maritime_cyber |
| Copy graph HTML here | `--copy-graph-to-operations-console` | export tests |

**Render engine:** `eds document render-clearance` in **edgesentry-rs**
(`templates/port-cyber-clearance.html`). Catena tests the UI contract
(field map, fixtures, bundled dist) and the catena ↔ eds boundary in
`integration-check`.
