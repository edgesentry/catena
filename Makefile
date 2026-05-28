# Phase C unified verification entrypoints (see issue #1).
.PHONY: test-contracts test-pipeline test-document test-apps test-all

test-contracts:
	./tools/scripts/test-contracts.sh

test-pipeline:
	./tools/scripts/test-pipeline.sh

test-document:
	./tools/scripts/test-document.sh

test-apps:
	./tools/scripts/test-apps.sh

test-all:
	./tools/scripts/test-all.sh
