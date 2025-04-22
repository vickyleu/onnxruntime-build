# ONNX Runtime Build

This project is to build custom [ONNX Runtime](https://onnxruntime.ai) libraries which are not provided in [the official releases](https://github.com/microsoft/onnxruntime/releases).

Currently supports static library builds only with the default options.

## Building Libraries

### Prerequisites

- [Requirements for building ONNX Runtime for inferencing](https://onnxruntime.ai/docs/build/inferencing.html#prerequisites) (for native build)
- [Requirements for building ONNX Runtime for Web](https://onnxruntime.ai/docs/build/inferencing.html#prerequisites) (for Wasm build)
- Bash
  - On Windows, you can use Git Bash provided by [Git for Windows](https://git-scm.com/download/win).

### Build Scripts

Build for native:

```sh
export ONNXRUNTIME_VERSION=1.14.1
export CMAKE_OPTIONS="-DCMAKE_TOOLCHAIN_FILE=/home/vickyleu/桌面/onnxruntime-build/arm-linux-gnueabihf.toolchain.cmake -Donnxruntime_USE_LITE_PROTO=ON -Donnxruntime_CROSS_COMPILING=ON"
./build-static_lib.sh
```

Build for Wasm:

```sh
./build-wasm-static_lib.sh
```
