# Port Cyber migration — decommission checklist

- **Tracker:** [catena#1](https://github.com/edgesentry/catena/issues/1)
- **Authority:** edgesentry-commercial monorepo plan §10 (analysis pack)

Canonical implementation: **this repo** (`pipeline/`, `agents/port_clearance/`,
`apps/operations-console/`). Sibling **edgesentry-rs** remains required for
`eds document render-clearance` and `eds audit sign-clearance`.

---

## Migration complete gate

Before freezing legacy **indago** port-cyber paths:

- [x] Phase A–D on `main` ([#2](https://github.com/edgesentry/catena/pull/2) … [#6](https://github.com/edgesentry/catena/pull/6))
- [x] W5 UI contract in `apps/operations-console/` + `tests/apps`
- [x] CI: contracts, pipeline, apps, integration checks
- [x] Analysis docs updated (system-overview; commercial#169)
- [ ] `main` `e2e-check` green once (push-triggered job)
- [ ] Owner sign-off on migration complete gate

**Not in scope for indago archive:** whole `indago` repo (other pipelines remain).
**Not archived:** `edgesentry-rs`, `documaris` (FAL/BCA), `edgesentry-commercial`.

---

## Stage 2 — Read-only freeze (indago port-cyber)

Target paths in [indago](https://github.com/edgesentry/indago):

- `pipelines/maritime_cyber/`, `pipelines/export_vessel_graph.py`
- `pipelines/port_clearance_eval.py`, `pipelines/maritime_cyber_graph.py`
- `agents/port_clearance/`
- `tests/maritime_cyber/`, `profiles/maritime_cyber/` (port-cyber profile)
- `fixtures/` SBOM/CVE used only by port-cyber (coordinate with other profiles)

Actions:

- [ ] README banner → canonical `catena`
- [ ] Default branch protection: no new feature PRs (hotfix exception only)
- [ ] Project 16 board: new work opens against `catena` only

---

## Stage 3 — Archive (optional timing)

- [ ] Archive or mark deprecated after 1–2 weeks read-only
- [ ] Log archive date + approver on [catena#1](https://github.com/edgesentry/catena/issues/1)

---

## Verify from clean checkout

```bash
git clone https://github.com/edgesentry/catena.git && cd catena
git clone https://github.com/edgesentry/edgesentry-rs.git ../edgesentry-rs
make test-all
make test-e2e vessel-hold   # optional smoke
```

## References

- [system-overview](https://github.com/edgesentry/edgesentry-commercial/blob/main/docs/programs/20260630-capvista-products/analysis/system-overview.md)
- [monorepo plan §10](https://github.com/edgesentry/edgesentry-commercial/blob/main/docs/programs/20260630-capvista-products/analysis/monorepo-design-implementation-plan.md)
- [commercial#169](https://github.com/edgesentry/edgesentry-commercial/pull/169)
