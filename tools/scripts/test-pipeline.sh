#!/usr/bin/env bash
# Phase C — maritime_cyber unit tests (excludes eds integration; see test-integration.sh).
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "${ROOT}"
uv sync --extra test --quiet
uv run pytest tests/maritime_cyber -m "not integration" -q "$@"
