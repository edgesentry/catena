# ci

Catena CI runs **catena-owned tests only**. Sibling repos run their own CI.

| Repo | Where tests run |
|------|-----------------|
| `catena` | This workflow (`contracts`, `pipeline`, `integration`, `e2e`) |
| `edgesentry-rs` | `edgesentry-rs` CI (`cargo test` on crates / `eds`) |
| `documaris` | FAL/BCA app only (not port-cyber W5) |

## Local ↔ CI mapping

| Local | Script | CI job |
|-------|--------|--------|
| `make test-contracts` | `test-contracts.sh` | `contracts-check` |
| `make test-pipeline` | `test-pipeline.sh` | `pipeline-check` |
| `make test-integration` | `test-integration.sh` | `integration-check` |
| `make test-e2e` | `test-e2e.sh` | `e2e-check` (main push) |
| `make test-apps` | `test-apps.sh` | `apps-check` |

**integration-check** builds `eds` only to exercise **catena** boundary tests
(`pytest -m integration`). It does not run the full `edgesentry-rs` test suite.

## What catena tests (migrated from indago / orchestration)

- `pipeline/` — graph, eval, export (incl. operations-console dist copy)
- `apps/operations-console/` — W5 templates, field map, dist HTML
- `tests/apps/` — UI contract tests
- `agents/port_clearance/` — E2E runner, WORM, narratives
- `tests/maritime_cyber/` — unit + integration with `eds`
- `tests/contracts/` — schemas, golden `decision_hash`
