# quarkus-build-action

Action to build a native GraalVM executable of your Quarkus app.

A default Dockerfile is used but you can specify a custom Docker via the *dockerfilePath* option.

An *app-runner* binary file will be generated after the execution of this action.

### Parameters

| Argument | Description |
|--------|-------------|
| outputName | Name of the resulting executable binary file. |
| dockerfilePath | Path to Dockerfile. |

### Usage example

```
on: [push]

jobs:
  native_build:
    runs-on: ubuntu-latest
    name: Build native Quarkus app
    steps:
      - name: Checkout the code
        uses: actions/checkout@master
      - name: Build native executable and upload it as an artifact
        uses: olwimo/quarkus-build-action@1
          outputName: app-runner
          dockerfilePath: Dockerfile
```
