# contracts

Canonical interface contracts shared across pipeline, agents, and apps.

## Baseline schemas

- `facts-schema/facts.schema.json`
- `manifest-schema/evaluation-manifest.schema.json`

- `make test-contracts` — schema JSON integrity + `tests/contracts/` (golden
  `decision_hash`, jsonschema validation of eval outputs)
- `tools/scripts/validate-contracts.sh` — schema parse check only
