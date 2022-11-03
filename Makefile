.EXPORT_ALL_VARIABLES:
GOBIN = $(shell pwd)/bin
SHELL=/bin/bash

.PHONY: lint
lint:
	@go install github.com/bufbuild/buf/cmd/buf
	@./bin/buf lint --error-format=msvs
	@./bin/buf breaking --against "./.git#branch=master"


.PHONY: generate
generate: lint
	@./bin/buf generate
