#!/usr/bin/env bash
# Phase C — contract schema validation + determinism tests.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "${ROOT}"
./tools/scripts/validate-contracts.sh
uv sync --extra test --quiet
uv run pytest tests/contracts -q
