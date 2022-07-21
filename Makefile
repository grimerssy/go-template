.PHONY: init
# install required binaries
init:
	make update
	go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
	go install github.com/envoyproxy/protoc-gen-validate@latest
	go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@latest
	go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@latest
	go install -mod=mod github.com/onsi/ginkgo/v2/ginkgo

.PHONY: update
# update .lock files
update:
	cd ./api/proto; \
 	buf mod update; \
 	cd ../..

.PHONY: api
# generate code from api definitions
api:
	make update; \
	buf generate

.PHONY: gen
# recursively invoke go:generate tool
gen:
	go generate ./...

.PHONY: test
# run all project tests
test:
	ginkgo -r --cover

.PHONY: build
# compile server application
build:
	go build -o ./bin/server ./cmd/server/main.go

.PHONY: run.dev
# run the server in development environment
run.dev:
	make build; \
	./bin/server -dev

.PHONY: run.stage
# run the server in staging environment
run.stage:
	make build; \
	./bin/server -stage

.PHONY: run.prod
# run the server in production environment
run.prod:
	make build; \
	./bin/server -prod
