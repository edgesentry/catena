# AGENTS.md

High-level operating guide for AI agents working in `catena`.

This file is intentionally brief. Use it as an entrypoint, then follow the
linked detailed documents under `docs/agents/`.

## Purpose

- Provide a fast orientation for agent tasks.
- Route agents to detailed documents by task type.
- Keep operational guidance maintainable as the monorepo grows.

## Repository map (high level)

`catena` is the **monorepo home** for port-cyber pipeline code; other domains may still point at siblings.

| Path | Role | Canonical source |
|------|------|------------------|
| `pipeline/`, `agents/port_clearance/`, `tests/maritime_cyber/` | Port cyber pipeline (package `pipeline`) | **this repo** |
| Clearance render / audit seal | `eds` CLI | `../edgesentry-rs` (`edgesentry-document`, `edgesentry-audit`) — invoked from `agents/port_clearance/`, not a `document/` tree in catena |
| `apps/operations-console/` | Pointer to W5 templates | `../documaris` |
| Program / submission docs | *(not in catena)* | `../edgesentry-commercial/docs/programs/` |
| `contracts/` | Shared schemas in catena | this repo |
| `shared/` | Cross-cutting fixtures (future) | this repo |
| `ci/` | Monorepo CI | this repo |
| `tools/` | Validation and dev scripts | this repo |

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
