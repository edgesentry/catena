# ci

Phase C verification entrypoints. GitHub Actions in `.github/workflows/ci.yml`
call the same scripts as local `make` targets.

| Local | Script | CI job |
|-------|--------|--------|
| `make test-contracts` | `tools/scripts/test-contracts.sh` | `contracts-check` |
| `make test-pipeline` | `tools/scripts/test-pipeline.sh` | `pipeline-check` |
| `make test-document` | `tools/scripts/test-document.sh` | `document-check` |
| `make test-apps` | `tools/scripts/test-apps.sh` | `apps-check` |
| `make test-all` | `tools/scripts/test-all.sh` | (local aggregate) |

**document-check** checks out `edgesentry/edgesentry-rs` and runs clearance
`cargo test` (no legacy indago tree required in CI).
