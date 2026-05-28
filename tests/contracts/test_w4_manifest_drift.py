"""W4 manifest body must remain hash-stable for edgesentry-rs sign-clearance."""

from __future__ import annotations

import json
from pathlib import Path

import pytest

from pipeline.maritime_cyber.eval import _canonical_hash, evaluate_port_clearance, write_evaluation_artifacts
from pipeline.maritime_cyber.graph import build_maritime_cyber_graph

W4_MANIFEST_KEYS = frozenset(
    {
        "vessel_key",
        "port_call_id",
        "rule_pack_id",
        "rule_pack_version",
        "rule_pack_sha256",
        "cve_snapshot_sha256",
        "sbom_sha256",
        "outcome",
        "rules_fired",
        "graph_node_count",
        "graph_edge_count",
        "decision_hash",
    }
)


def test_manifest_body_hashes_to_decision_hash(tmp_path: Path) -> None:
    graph = build_maritime_cyber_graph(["vessel-hold"])
    result = evaluate_port_clearance("vessel-hold", graph_result=graph)
    paths = write_evaluation_artifacts(result, tmp_path)
    manifest = json.loads(paths["manifest"].read_text(encoding="utf-8"))

    assert W4_MANIFEST_KEYS <= set(manifest)
    body = {k: v for k, v in manifest.items() if k != "decision_hash"}
    assert _canonical_hash(body) == result.decision_hash
