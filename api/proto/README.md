# `/api/proto`

Api definitions written in proto language

All proto files should go to versioned subdirectories. <br>
(e.g. `/api/proto/v1` or `/api/proto/your_service/v1`).

Proto files here will be used to generate types, interfaces and helper methods to easily implement gRPC and HTTP handlers.

Note: `buf.lock` and `buf.yaml` files are defining local buf module, which makes code generation tools easier to maintain.