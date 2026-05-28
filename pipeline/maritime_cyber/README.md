# `pipeline/maritime_cyber` — graph + evaluation

| Module | WS | Role |
|--------|-----|------|
| `graph.py` | W2 | SBOM + CVE + `asset_map` → NetworkX + Parquet |
| `eval.py` | W3 | Rule pack → pass/hold, `facts.json`, `decision_hash` |
| `audit_refs.py` | D2 | `bom_baseline_ref`, `cve_snapshot_ref`, snapshot FP |
| `rules.py` | W0 | Load `sg-cyber-clearance-v0.yaml` |

**CLIs:**

```bash
uv run python -m pipeline.maritime_cyber_graph vessel-hold vessel-clean
uv run python -m pipeline.port_clearance_eval vessel-hold \
  --port-call-id port-call-demo-sgsin
uv run python -m pipeline.port_clearance_eval affected-vessels CVE-2021-44228
```

**D4 export:** `pipeline/export_vessel_graph.py` (sibling module).
