# Contracts and Determinism Guide

This guide defines how agents should handle schema contracts and deterministic
behavior expectations.

## Contract files (Phase A baseline)

- `contracts/facts-schema/facts.schema.json`
- `contracts/manifest-schema/evaluation-manifest.schema.json`

## Required rules

1. Do not make silent contract changes.
2. If required fields or semantics change, document impact clearly.
3. Validate schema JSON integrity after every contract edit:
   - `./tools/scripts/validate-contracts.sh`

## Determinism expectations

For clearance/evaluation flows, changes must preserve deterministic behavior
unless task requirements explicitly state otherwise.

Key deterministic concerns:

- `decision_hash` stability under identical inputs
- stable snapshot and manifest references
- predictable pass/hold outcomes for fixed fixtures

## Change sequence for contract-impacting work

1. Update schema contracts.
2. Update producers (pipeline/document) to match.
3. Update consumers and docs.
4. Run validations/tests and report compatibility notes.
