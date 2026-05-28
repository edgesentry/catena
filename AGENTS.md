# AGENTS.md

High-level operating guide for AI agents working in `catena`.

This file is intentionally brief. Use it as an entrypoint, then follow the
linked detailed documents under `docs/agents/`.

## Purpose

- Provide a fast orientation for agent tasks.
- Route agents to detailed documents by task type.
- Keep operational guidance maintainable as the monorepo grows.

## Repository map (high level)

`catena` is the **monorepo home** for port-cyber pipeline code; other domains
may still point at siblings.

| Area | Role | Source |
|------|------|--------|
| `pipeline/`, `agents/`, tests | Port cyber | **this repo** |
| `eds` CLI | Render / seal (test in `edgesentry-rs` CI) | `../edgesentry-rs` |
| `apps/operations-console/` | W5 clearance UI contract | **this repo** |
| Program docs | *(not in catena)* | `../edgesentry-commercial` |
| `contracts/` | Shared schemas | this repo |
| `shared/` | Fixtures (future) | this repo |
| `ci/` | Monorepo CI | this repo |
| `tools/` | Dev scripts (`make test-*`) | this repo |
| `shared/fixtures/` | Golden `decision_hash` pins | this repo |

## Agent index (detailed docs)

1. Task routing and workflow
   - `docs/agents/task-routing.md`
2. Code change rules and quality gates
   - `docs/agents/change-policy.md`
3. Contracts and deterministic guarantees
   - `docs/agents/contracts-and-determinism.md`

## Default workflow for agents

1. Identify task domain from changed paths.
2. Read the corresponding document in `docs/agents/`.
3. Make minimal, scoped changes.
4. Run domain-relevant checks.
5. Report changes, risks, and next actions clearly.

## Notes

- If guidance conflicts, prefer explicit task instructions over defaults.
- Keep this file concise; move detailed guidance to `docs/agents/`.
