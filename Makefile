# Verification entrypoints (catena issue #1 Phase C–D).
.PHONY: test-contracts test-pipeline test-integration test-e2e test-apps test-all

test-contracts:
	./tools/scripts/test-contracts.sh

test-pipeline:
	./tools/scripts/test-pipeline.sh

test-integration:
	./tools/scripts/test-integration.sh

test-e2e:
	./tools/scripts/test-e2e.sh

test-apps:
	./tools/scripts/test-apps.sh

test-all:
	./tools/scripts/test-all.sh
