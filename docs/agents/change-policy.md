# Agent Change Policy

Policy for making safe, reviewable changes in `catena`.

## Scope and size

- Keep changes narrowly scoped to the requested task.
- Avoid unrelated refactors in the same change.
- Prefer small PRs over broad mixed updates.

## Editing principles

- Preserve existing behavior unless change explicitly requires behavior updates.
- Document non-obvious decisions in code comments or PR description.
- Update related docs when behavior or structure changes.

## Validation expectations

- Run relevant checks for touched domains.
- For contract-related changes, always run contract validation:
  - `./tools/scripts/validate-contracts.sh`

## Review readiness checklist

- Change is scoped and understandable.
- Affected checks are run and results are known.
- Backward-compatibility impact is stated.
- Follow-up work is listed explicitly if deferred.
