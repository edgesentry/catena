#!/usr/bin/env bash
# Phase C — edgesentry-rs clearance render/audit tests (sibling checkout).
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
ERS="${CATENA_EDGESENTRY_RS:-${ROOT}/../edgesentry-rs}"

if [[ ! -f "${ERS}/Cargo.toml" ]]; then
  echo "skip: edgesentry-rs not found at ${ERS}" >&2
  exit 0
fi

cd "${ERS}"
# Runs render + sign/verify tests; indago cross-repo test no-ops when sibling missing.
cargo test -p eds clearance -- --nocapture
