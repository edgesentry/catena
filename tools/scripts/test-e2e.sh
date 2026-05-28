#!/usr/bin/env bash
# Phase D — full clearance path: eval + render + seal (single vessel smoke).
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
ERS="${CATENA_EDGESENTRY_RS:-${ROOT}/../edgesentry-rs}"
VESSEL="${1:-vessel-hold}"

if [[ ! -f "${ERS}/Cargo.toml" ]]; then
  echo "error: edgesentry-rs not found at ${ERS}" >&2
  exit 1
fi

EDS_BIN="${EDS_BIN:-${ERS}/target/debug/eds}"
if [[ ! -x "${EDS_BIN}" ]]; then
  cargo build -p eds --manifest-path "${ERS}/Cargo.toml"
fi

export EDS_BIN
cd "${ROOT}"
uv sync --extra test --quiet
uv run python -m agents.port_clearance.run_clearance "${VESSEL}" --skip-worm
