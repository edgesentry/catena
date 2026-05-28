# catena

Capability-based monorepo for EdgeSentry platform delivery.

## Repository layout

- `apps/` - browser-facing products and frontends
- `pipeline/` - deterministic data/evaluation pipelines
- `document/` - rendering, sealing, and verification logic
- `contracts/` - canonical schemas and interface contracts
- `shared/` - fixtures, common libraries, and shared UI components
- `programs/` - program/submission documentation bundles
- `ci/` - reusable CI assets
- `tools/` - developer utilities and validation scripts

## Phase A status

This repository currently contains the Phase A scaffold from migration tracker
issue `#1`:

- top-level capability folders
- root governance files (`CODEOWNERS`, `.editorconfig`)
- baseline contracts and validation script
- CI skeleton with changed-path routing