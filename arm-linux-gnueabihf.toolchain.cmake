# Copied from https://github.com/Tencent/ncnn/blob/master/toolchains/arm-linux-gnueabihf.toolchain.cmake
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR armv7)
set(CMAKE_CXX_STANDARD 17)            # 只填写整数
set(CMAKE_CXX_STANDARD_REQUIRED ON)   # 如果编译器不支持则报错
set(CMAKE_CXX_EXTENSIONS ON)         # GNU 扩展，是否使用纯标准模式

set(CMAKE_C_COMPILER "arm-linux-gnueabihf-gcc")
set(CMAKE_CXX_COMPILER "arm-linux-gnueabihf-g++")
# 下载的工具链路径sysroot 强制关闭c23特性
# https://publishing-ie-linaro-org.s3.amazonaws.com/releases/components/toolchain/binaries/4.9-2017.01/arm-linux-gnueabihf/sysroot-eglibc-linaro-2017.01-arm-linux-gnueabihf.tar.xz
set(CMAKE_SYSROOT "/home/vickyleu/build/arm-linux-gnueabihf/arm-linux-gnueabihf/sysroot")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_C_SYSTEM_INCLUDE_PATH "${CMAKE_SYSROOT}/usr/include")
set(CMAKE_CXX_SYSTEM_INCLUDE_PATH "${CMAKE_SYSROOT}/usr/include")

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -L${CMAKE_SYSROOT}/usr/lib")
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -L${CMAKE_SYSROOT}/usr/lib")

# cache flags
set(CMAKE_C_FLAGS_INIT "${CMAKE_C_FLAGS_INIT} -D_GNU_SOURCE -std=c11 -march=armv7-a -mfloat-abi=hard -mfpu=neon  -v" CACHE STRING "c flags")
set(CMAKE_CXX_FLAGS_INIT "${CMAKE_C_FLAGS_INIT} -D_GNU_SOURCE -std=c++17 -D_GLIBCXX_USE_CXX11_ABI=1  -march=armv7-a -mfloat-abi=hard -mfpu=neon  -v" CACHE STRING "cxx flags")
