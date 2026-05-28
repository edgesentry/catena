# Agent Task Routing

Use this document to map a task to the right repository area and checks.

## Path-to-domain mapping

- `apps/**`
  - Domain: frontend application behavior and UX
  - Typical checks: app build/test jobs
- `pipeline/**`
  - Domain: deterministic evaluation, graph export, fixture generation
  - Typical checks: pipeline tests and reproducibility checks
- `agents/port_clearance/**` (render/seal via sibling `edgesentry-rs`)
  - Domain: E2E clearance orchestration
  - HTML/PDF: `eds document render-clearance`
  - Typical checks: `uv run pytest tests/maritime_cyber`
  - Rust: `cargo test` in `../edgesentry-rs` when changing crates
- `contracts/**`
  - Domain: schema and interface contracts
  - Typical checks: contract validation + downstream impact checks
- `shared/**`
  - Domain: reusable code, fixtures, common assets
  - Typical checks: dependent domain checks
- Program docs (sibling `edgesentry-commercial`, not under `catena`)
  - Domain: documentation and submission assets
  - Typical checks: edit in `../edgesentry-commercial/docs/programs/`

## Multi-domain tasks

If a task touches multiple domains:

1. Update contracts first (if needed).
2. Update producers (`pipeline`, then `edgesentry-rs` if facts/manifest or
   render contracts change) next.
3. Update consumers (apps/programs) last.
4. Run checks in dependency order.

## Escalation

Escalate when a task requires:

- Breaking contract changes
- Non-backward-compatible schema updates
- Decommission decisions affecting old repositories
