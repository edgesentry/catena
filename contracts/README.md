# contracts

Canonical interface contracts shared across pipeline, agents, and apps.

## Baseline schemas

- `facts-schema/facts.schema.json`
- `manifest-schema/evaluation-manifest.schema.json`

- `contracts/VERSION` — semantic version; must match
  `shared/fixtures/port-cyber/golden-decision-hashes.json` (`contract_version`)
- `contracts/CHANGELOG.md` — breaking vs compatible changes
- `make test-contracts` — schema + drift + VERSION alignment
