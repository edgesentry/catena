#!/usr/bin/env bash
# operations-console UI contract tests (W5 templates, field map, dist HTML).
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "${ROOT}"
uv sync --extra test --quiet
uv run pytest tests/apps -m "not integration" -q "$@"
