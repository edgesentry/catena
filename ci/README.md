# ci

GitHub Actions in `.github/workflows/ci.yml` call the same scripts as `make`.

| Local | Script | CI job |
|-------|--------|--------|
| `make test-contracts` | `test-contracts.sh` | `contracts-check` |
| `make test-pipeline` | `test-pipeline.sh` | `pipeline-check` (unit only) |
| `make test-document` | `test-document.sh` | `document-check` |
| `make test-integration` | `test-integration.sh` | `integration-check` |
| `make test-e2e` | `test-e2e.sh` | `e2e-check` (main push only) |
| `make test-apps` | `test-apps.sh` | `apps-check` |

**integration-check** builds `eds` from `edgesentry/edgesentry-rs` and runs all
`pytest -m integration` tests (no skips).
