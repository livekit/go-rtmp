FMT_DIRS:=$(shell go list -f {{.Dir}} ./...)

.PHONY: all
all: check test

.PHONY: check
check: fmt lint vet

.PHONY: fmt
fmt:
	@gofmt -l -w -s $(FMT_DIRS)
	@go tool goimports -w $(FMT_DIRS)

.PHONY: lint
lint:
	golangci-lint run

.PHONY: vet
vet:
	go vet $$(go list ./... | grep -v /vendor/)

.PHONY: test
test:
	go test -cover -coverprofile=coverage.txt -covermode=atomic -v -race -timeout 10s ./...

.PHONY: bench
bench:
	go test -bench . -benchmem -gcflags="-m -m -l" ./...

.PHONY: example
example:
	make -C example/server_demo
	make -C example/server_relay_demo
	make -C example/client_demo
