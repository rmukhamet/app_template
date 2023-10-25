
.PHONY: generate
generate:
  bin/grpc-generate $(foreach path, $(APP_PROTO_FILES), "$(path)")

.PHONY: build
build: generate
  bin/run-go-build $(foreach name, $(APP_CMD_NAMES), "$(name)")
