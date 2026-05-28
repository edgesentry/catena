"""Validate evaluation outputs against canonical JSON schemas."""

from __future__ import annotations

import json
from pathlib import Path

import jsonschema
import pytest

from pipeline.maritime_cyber.eval import evaluate_port_clearance, write_evaluation_artifacts
from pipeline.maritime_cyber.graph import build_maritime_cyber_graph

_REPO_ROOT = Path(__file__).resolve().parents[2]
_FACTS_SCHEMA = _REPO_ROOT / "contracts/facts-schema/facts.schema.json"
_MANIFEST_SCHEMA = _REPO_ROOT / "contracts/manifest-schema/evaluation-manifest.schema.json"


def _load_schema(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def test_facts_and_manifest_validate_against_schemas(tmp_path: Path) -> None:
    graph = build_maritime_cyber_graph(["vessel-hold"])
    result = evaluate_port_clearance("vessel-hold", graph_result=graph)
    paths = write_evaluation_artifacts(result, tmp_path)

    facts = json.loads(paths["facts"].read_text(encoding="utf-8"))
    manifest = json.loads(paths["manifest"].read_text(encoding="utf-8"))

    jsonschema.validate(facts, _load_schema(_FACTS_SCHEMA))
    jsonschema.validate(manifest, _load_schema(_MANIFEST_SCHEMA))

    assert facts["decision_hash"] == manifest["decision_hash"]
