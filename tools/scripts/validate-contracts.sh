#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
CONTRACTS_DIR="${ROOT_DIR}/contracts"

if [[ ! -f "${CONTRACTS_DIR}/VERSION" ]]; then
  echo "missing ${CONTRACTS_DIR}/VERSION" >&2
  exit 1
fi

required_files=(
  "${CONTRACTS_DIR}/facts-schema/facts.schema.json"
  "${CONTRACTS_DIR}/manifest-schema/evaluation-manifest.schema.json"
)

for file in "${required_files[@]}"; do
  if [[ ! -f "${file}" ]]; then
    echo "missing required contract file: ${file}" >&2
    exit 1
  fi
done

python3 - <<'PY'
import json
from pathlib import Path

root = Path("contracts")
schemas = sorted(root.rglob("*.schema.json"))
if not schemas:
    raise SystemExit("no schema files found under contracts/")

for path in schemas:
    with path.open(encoding="utf-8") as f:
        json.load(f)
    print(f"validated json: {path}")

version = (root / "VERSION").read_text(encoding="utf-8").strip()
golden = json.loads(
    (root.parent / "shared/fixtures/port-cyber/golden-decision-hashes.json").read_text(
        encoding="utf-8"
    )
)
if golden.get("contract_version") != version:
    raise SystemExit(
        f"golden contract_version {golden.get('contract_version')!r} != VERSION {version!r}"
    )
print(f"contract VERSION {version} matches golden pins")
PY

echo "contracts validation passed"
