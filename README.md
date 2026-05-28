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

- **Phase A–C**: scaffold, pipeline migration, unified CI — done
- **Phase D**: contract VERSION + golden pins, integration/e2e CI with `eds`
- **Pointers**: `apps/` → `documaris`; program docs → `edgesentry-commercial`

See `pipeline/README.md` and `ci/README.md`.

## Verify locally

```bash
make test-all              # contracts + unit pipeline + document + integration
make test-pipeline         # unit tests only (no eds)
make test-integration      # eds sign/verify/render integration
make test-e2e vessel-hold  # full clearance smoke
```

Requires sibling `../edgesentry-rs` for document/integration/e2e targets.
