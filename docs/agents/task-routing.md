# Agent Task Routing

Use this document to map a task to the right repository area and checks.

## Path-to-domain mapping

- `apps/**`
  - Domain: frontend application behavior and UX
  - Typical checks: app build/test jobs
- `pipeline/**`
  - Domain: deterministic evaluation, graph export, fixture generation
  - Typical checks: pipeline tests and reproducibility checks
- `document/**`
  - Domain: rendering templates, audit sealing, verification flows
  - Typical checks: document tests, clippy/lint, integration smoke checks
- `contracts/**`
  - Domain: schema and interface contracts
  - Typical checks: contract validation + downstream impact checks
- `shared/**`
  - Domain: reusable code, fixtures, common assets
  - Typical checks: dependent domain checks
- `programs/**`
  - Domain: documentation and submission assets
  - Typical checks: link/consistency checks where available

## Multi-domain tasks

If a task touches multiple domains:

1. Update contracts first (if needed).
2. Update producers (pipeline/document) next.
3. Update consumers (apps/programs) last.
4. Run checks in dependency order.

## Escalation

Escalate when a task requires:

- Breaking contract changes
- Non-backward-compatible schema updates
- Decommission decisions affecting old repositories
