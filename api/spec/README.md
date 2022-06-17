# `/api/spec`

API specifications

Note: `protoc-gen-openapiv2` will be used, which would generate automatically `[service].swagger.json` openAPI specification where `[service]` will be replaced with name of the corresponding `.proto` file in `/api/proto/[subdirectories]`<br>
So if you want to manually write a specification make sure it will not be overwritten by the compiler