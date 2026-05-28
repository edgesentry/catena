# catena

Capability-based monorepo for EdgeSentry platform delivery.

Agent guidance entrypoint: `AGENTS.md`

## Repository layout

- `apps/` - browser-facing products and frontends
- `pipeline/` - deterministic data/evaluation pipelines
- `agents/` - E2E orchestration (port clearance; `eds` in `edgesentry-rs`)
- `contracts/` - canonical schemas and interface contracts
- `shared/` - fixtures, common libraries, and shared UI components
- `ci/` - reusable CI assets
- `tools/` - developer utilities and validation scripts

## Phase status

- **Phase A–D**: scaffold through contract/integration CI — **done** ([#6](https://github.com/edgesentry/catena/pull/6))
- **W5 UI**: `apps/operations-console/` (tested in catena)
- **Next:** [decommission indago port-cyber duplicates](docs/DECOMMISSION.md) — [tracker #1](https://github.com/edgesentry/catena/issues/1)

See `pipeline/README.md`, `ci/README.md`, `docs/DECOMMISSION.md`.

## Verify locally

```bash
make test-all              # contracts + pipeline + apps + integration
make test-pipeline         # unit tests only (no eds)
make test-integration      # eds sign/verify/render integration
make test-e2e vessel-hold  # full clearance smoke
```

Requires `../edgesentry-rs` (built `eds`) for `test-integration` / `test-e2e`.
Run `cargo test` on edgesentry-rs in that repo.

**Not in catena CI:** edgesentry-rs crate tests (`cargo test` in that repo).
