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

- **Phase A** (scaffold): capability folders, contracts, CI — done
- **Pipeline**: `maritime_cyber` under `pipeline/`; run maritime_cyber pytest
- **Pointers**: `apps/` → `documaris`; render/seal → `edgesentry-rs` via
  `agents/port_clearance/`

See `pipeline/README.md`.
