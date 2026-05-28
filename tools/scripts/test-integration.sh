#!/usr/bin/env bash
# Catena boundary tests: evaluation artefacts ↔ eds CLI (build eds only as fixture).
# Crate tests for edgesentry-rs stay in the edgesentry-rs repo CI.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
ERS="${CATENA_EDGESENTRY_RS:-${ROOT}/../edgesentry-rs}"

if [[ ! -f "${ERS}/Cargo.toml" ]]; then
  echo "error: edgesentry-rs not found at ${ERS}" >&2
  exit 1
fi

if [[ -z "${EDS_BIN:-}" ]]; then
  EDS_BIN="${ERS}/target/debug/eds"
  if [[ ! -x "${EDS_BIN}" ]]; then
    echo "building eds..."
    cargo build -p eds --manifest-path "${ERS}/Cargo.toml"
  fi
fi

if [[ ! -x "${EDS_BIN}" ]]; then
  echo "error: EDS_BIN not executable: ${EDS_BIN}" >&2
  exit 1
fi

export EDS_BIN
cd "${ROOT}"
uv sync --extra test --quiet
uv run pytest tests/maritime_cyber -m integration -q "$@"
