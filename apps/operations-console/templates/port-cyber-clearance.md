# Port Cyber Clearance — template specification (W5)

Cap Vista MVP gate **G5**. Rendered HTML lives in `edgesentry-rs`:

`crates/edgesentry-document/templates/port-cyber-clearance.html`

## Input

catena `*_facts.json` from:

```bash
uv run python -m pipeline.port_clearance_eval evaluate vessel-hold --write
```

## Sections (certificate)

| # | Section | Source |
|---|---------|--------|
| 1 | Executive summary | `outcome`, vessel, port_call, path counts |
| 1a | Operator explanation | D5 `*_operator_explanation.txt` (optional) |
| 2 | Rules fired | `rules_fired[]` (id, title, severity) |
| 3 | Cited paths | `paths[]` (rule_ids, summary, nodes) |
| 4 | Audit evidence | `bom_baseline_ref`, `cve_snapshot_ref`, fingerprint |
| 4b | Impacted paths | `impacted_paths[]` |
| 5 | Decision integrity | `decision_hash` |
| 6 | Independent verification | `verify_url` (CLI; W6 → clarus) |
| — | Disclaimer | `disclaimer` |

## Render CLI

```bash
eds document render-clearance \
  --facts fixtures/clearance/vessel-hold_facts.json \
  --verify-url "https://verify.edgesentry.io/clearance/poc" \
  --out dist/vessel-hold_port-cyber-clearance.html

# Optional D5 (--ai-narrative from run_clearance):
eds document render-clearance \
  --facts clearance_runs/.../vessel-hold_facts.json \
  --operator-explanation clearance_runs/.../operator_explanation.txt \
  --verify-url "https://verify.edgesentry.io/clearance/poc" \
  --out dist/vessel-hold_port-cyber-clearance.html
```

Sample HTML: `dist/*.html` via `scripts/render-clearance-samples.sh`.

## PDF

Open HTML in a browser → Print → Save as PDF.

## Related

- W3 facts: [catena eval](https://github.com/edgesentry/catena) `pipeline/maritime_cyber/eval.py`
- W4 audit: [edgesentry-rs](https://github.com/edgesentry/edgesentry-rs)
- W4 command: `eds audit sign-clearance`
- Field map: `field_maps/port_cyber_clearance_field_map.json`
