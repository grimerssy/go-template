.PHONY: init
# install required proto compilers
init:
	go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
	go install github.com/envoyproxy/protoc-gen-validate
	go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway
	go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@latest

.PHONY: gen
# generate code from api description
gen:
	buf generate

.PHONY: test
# run all project tests
test:
	go test ./...

.PHONY: build
# compile project
build:
	go build -o ./bin/server ./cmd/server/main.go

.PHONY: run
# run project
run:
	./bin/server
