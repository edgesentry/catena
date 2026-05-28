"""Contract drift — evaluation decision_hash must match pinned golden values."""

from __future__ import annotations

import json
from pathlib import Path

import pytest

from pipeline.maritime_cyber.eval import evaluate_port_clearance
from pipeline.maritime_cyber.graph import build_maritime_cyber_graph

_REPO_ROOT = Path(__file__).resolve().parents[2]
_GOLDEN = _REPO_ROOT / "shared/fixtures/port-cyber/golden-decision-hashes.json"


@pytest.fixture(scope="module")
def golden_vessels() -> dict[str, dict[str, str]]:
    data = json.loads(_GOLDEN.read_text(encoding="utf-8"))
    return data["vessels"]


@pytest.mark.parametrize("vessel_key", ["vessel-hold", "vessel-clean", "vessel-thread"])
def test_decision_hash_matches_golden(vessel_key: str, golden_vessels: dict) -> None:
    expected = golden_vessels[vessel_key]
    graph = build_maritime_cyber_graph([vessel_key])
    result = evaluate_port_clearance(
        vessel_key,
        port_call_id="port-call-demo-sgsin",
        graph_result=graph,
    )
    assert result.outcome == expected["outcome"]
    assert result.decision_hash == expected["decision_hash"]
