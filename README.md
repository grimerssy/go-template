# Project setup made easy

### Prerequisites

* Go binary installed ([link](https://go.dev/dl/))
* Buf binary installed ([link](https://docs.buf.build/installation))

### Nice to have

* Buf extension in your IDE of choice<br>
  This will include real-time `.proto` file linting and provide additional intellisense

### Project setup

* Click `Use this template` button and create your repository
* Clone your repository to desired directory on the local machine<br>
  (using `git clone` or git tools in your IDE)
* Run `make init` command in your project root<br>
  This will install required protoc binaries to your `$GOPATH/bin` directory
* Change `awesomeProject` in `go.mod` file to the name of your go module<br>
  Recommended prefixing it with `github.com/{your_username}/` and naming it the same as your repository<br>
  Example: `module github.com/grimerssy/go-template`
* Go to `buf.gen.yaml` file and change `awesomeProject` to your module name in the `go_package_prefix.default` field

### Get coding

* Write your first `.proto` file in `/api/proto/{proto_package}` directory<br>
  It may look like `/api/proto/v1/helloworld.proto`<br>
  or `/api/proto/helloworld/v1/helloworld.proto`
* Run `make gen` command<br>
  This will generate API specification (`api/spec/helloworld.swagger.json` file)<br>
  And `.pb.go` files in `/internal/api/helloworld/v1` or `/internal/api/v1` directory<br>
  corresponding to your `.proto` package name
* Write your handlers, use cases and repositories, set up gRPC and/or HTTP servers<br>
  Note: for more help, you can find a `README.md` file in each directory of this repository 

### Tools

* To test or run your project run `make test` or `make run` commands respectfully
* Buf makes it easier to import third party `.proto` packages without manually copying them to your `/third_party` directory<br>
  To manage your dependencies go to `/api/proto/buf.yaml` file and run `make update` command<br>
  If you have buf extension installed, updated dependencies will be available in the intellisense
* To learn more about buf tool, visit [introduction to buf](https://docs.buf.build/introduction)