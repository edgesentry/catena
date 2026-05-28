"""Contract VERSION must match golden fixture manifest."""

from __future__ import annotations

import json
from pathlib import Path

_REPO = Path(__file__).resolve().parents[2]


def test_golden_pins_reference_contract_version() -> None:
    version = (_REPO / "contracts/VERSION").read_text(encoding="utf-8").strip()
    golden = json.loads(
        (_REPO / "shared/fixtures/port-cyber/golden-decision-hashes.json").read_text(
            encoding="utf-8"
        )
    )
    assert golden["contract_version"] == version
