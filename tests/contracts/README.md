# Contract and determinism tests

| Module | Role |
|--------|------|
| `test_golden_decision_hash.py` | PoC vessel `decision_hash` drift guard |
| `test_schema_contract.py` | facts + manifest jsonschema validation |
| `test_contract_version.py` | VERSION ↔ golden `contract_version` |
| `test_w4_manifest_drift.py` | W4 manifest body ↔ `decision_hash` |

Run: `make test-contracts`
