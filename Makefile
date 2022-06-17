.PHONY: init
# install required proto compilers
init:
	make update
	go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
	go install github.com/envoyproxy/protoc-gen-validate@latest
	go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@latest
	go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@latest

.PHONY: update
# update .lock files
update:
	cd ./api/proto; \
 	buf mod update; \
 	cd ../..; \

.PHONY: gen
# generate code from api description
gen:
	make update; \
 	buf generate

.PHONY: test
# run all project tests
test:
	go test ./...

.PHONY: run
# run the server
run:
	make build; \
	make exe

.PHONY: build
# compile server application
build:
	go build -o ./bin/server ./cmd/server/main.go

.PHONY: exe
# execute server binary
exe:
	./bin/server
