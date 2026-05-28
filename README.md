# catena

Capability-based monorepo for EdgeSentry platform delivery.

Agent guidance entrypoint: `AGENTS.md`

## Repository layout

- `apps/` - browser-facing products and frontends
- `pipeline/` - deterministic data/evaluation pipelines
- `agents/` - E2E orchestration (e.g. port clearance; calls `eds` in sibling `edgesentry-rs`)
- `contracts/` - canonical schemas and interface contracts
- `shared/` - fixtures, common libraries, and shared UI components
- `ci/` - reusable CI assets
- `tools/` - developer utilities and validation scripts

## Phase status

- **Phase A** (scaffold): capability folders, contracts, CI path routing — done
- **Pipeline**: `maritime_cyber` under `pipeline/` (package `pipeline`); run `uv run pytest tests/maritime_cyber`
- **Remaining pointers**: `apps/` → `documaris`; render/seal → sibling `edgesentry-rs` via `agents/port_clearance/`

See `pipeline/README.md`.
