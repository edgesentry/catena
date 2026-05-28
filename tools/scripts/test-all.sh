#!/usr/bin/env bash
# Phase C — run all catena verification entrypoints.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "${ROOT}"
scripts=(
  test-contracts.sh
  test-pipeline.sh
  test-document.sh
  test-integration.sh
  test-apps.sh
)
for s in "${scripts[@]}"; do
  echo "==> ./tools/scripts/${s}"
  "./tools/scripts/${s}"
done
echo "all catena checks passed"
