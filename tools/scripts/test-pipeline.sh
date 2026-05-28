#!/usr/bin/env bash
# Phase C — maritime_cyber pipeline unit and integration tests (catena-only).
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "${ROOT}"
uv sync --extra test --quiet
uv run pytest tests/maritime_cyber -q "$@"
