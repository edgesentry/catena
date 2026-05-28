# Maritime cyber fixtures — Port Cyber Clearance PoC (W1)

**Status:** **W1 done** — three-vessel fleet + pinned CVE (Cap Vista G1–G2).

## Disclosure (portal honesty)

> PoC uses **public CVE feeds** and **representative SBOM fixtures** with a
> documented **synthetic OT inventory map** (`asset_map.yaml`). Production
> replaces fixtures with operator-signed manifests and optional OCEANS-X.

## Layout

| Path | Layer | Gate / WS |
|------|-------|-----------|
| `cve/snapshot-2026-05-26.json` | Pinned OSV subset (Log4Shell) | G1 · W1 |
| `sbom/vessel-hold.json` | Synthetic — critical CVE on ECDIS | G2 · W1 |
| `sbom/vessel-clean.json` | Synthetic — no open criticals | G2 · W1 |
| `sbom/vessel-thread.json` | Synthetic — clean + ProcessLog (UC3) | G2 · W1 |
| `asset_map.yaml` | Synthetic bridge — OT ↔ firmware ↔ SBOM | W0 · W1 |
| `port_calls/*.json` | Synthetic — OCEANS-X-shaped events | W1 |
| `process_logs/*.json` | Synthetic — yard patch / scan records | W1 |

## Synthetic bridge (`asset_map.yaml`)

Not from a live yard or class society. Models IACS UR E27-style CBS fields
(`ecu_zone`, `network_zone`, `cbs_category`, `safety_function`) and links
assets to firmware images and SBOM component references.

**Pilot path:** Replace with a customer-signed inventory manifest — pipeline
unchanged.

## Demo narrative (three vessels)

| Vessel key | Expected | Story |
|------------|----------|--------|
| `vessel-hold` | **hold** | Stale Log4j on ECDIS path (pinned CVE) |
| `vessel-clean` | **pass** | No rule triggers on current snapshot |
| `vessel-thread` | **pass** | Clean SBOM + signed yard `ProcessLog` (UC3) |

## Fleet-demo pack (W8)

Demo-enhanced tier (**12 vessels**): `fleet-demo/` — see
[fleet-demo/README.md](fleet-demo/README.md).

```bash
uv run python scripts/generate_maritime_cyber_fixtures.py --seed 42 --verify
```

Profile: `profiles/maritime_cyber/fleet-demo-manifest.yaml`

## Profile and rules

- Profile: `profiles/maritime_cyber/manifest.yaml`
- Rule pack: `rules/sg-cyber-clearance-v0.yaml`
