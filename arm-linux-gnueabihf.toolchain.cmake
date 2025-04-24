# Copied from https://github.com/Tencent/ncnn/blob/master/toolchains/arm-linux-gnueabihf.toolchain.cmake
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR armv7)
set(CMAKE_CXX_STANDARD 17)            # 只填写整数
set(CMAKE_CXX_STANDARD_REQUIRED ON)   # 如果编译器不支持则报错
set(CMAKE_CXX_EXTENSIONS ON)         # GNU 扩展，是否使用纯标准模式



# 设置GCC 9交叉编译器
set(CMAKE_C_COMPILER "arm-linux-gnueabihf-gcc-9")
set(CMAKE_CXX_COMPILER "arm-linux-gnueabihf-g++-9")

# 设置sysroot路径
# 下载的工具链路径sysroot 强制关闭c23特性
# https://publishing-ie-linaro-org.s3.amazonaws.com/releases/components/toolchain/binaries/4.9-2017.01/arm-linux-gnueabihf/sysroot-eglibc-linaro-2017.01-arm-linux-gnueabihf.tar.xz
set(CMAKE_SYSROOT "/home/vickyleu/build/arm-linux-gnueabihf/arm-linux-gnueabihf/sysroot")

# 设置Iconv内置标志
set(Iconv_IS_BUILT_IN ON)

# 指定查找程序、库和包的路径前缀
set(CMAKE_FIND_ROOT_PATH ${CMAKE_SYSROOT})
# 调整查找策略
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(CMAKE_C_SYSTEM_INCLUDE_PATH "${CMAKE_SYSROOT}/usr/include")
set(CMAKE_CXX_SYSTEM_INCLUDE_PATH "${CMAKE_SYSROOT}/usr/include")

# 确保链接使用sysroot中的库
set(CMAKE_EXE_LINKER_FLAGS " -Wl,--sysroot=${CMAKE_SYSROOT} -L${CMAKE_SYSROOT}/usr/lib")
set(CMAKE_SHARED_LINKER_FLAGS " -Wl,--sysroot=${CMAKE_SYSROOT} -L${CMAKE_SYSROOT}/usr/lib")

# cache flags
# 明确添加需要的头文件路径
set(CMAKE_C_FLAGS_INIT "-nostdinc  -isystem ${CMAKE_SYSROOT}/usr/include \
 -D_GNU_SOURCE -std=c11 -march=armv7-a -mfloat-abi=hard -mfpu=neon " CACHE STRING "c flags")
set(CMAKE_CXX_FLAGS_INIT "-nostdinc -nostdinc++  -isystem ${CMAKE_SYSROOT}/usr/include \
 -isystem ${CMAKE_SYSROOT}/usr/include/c++/4.9.4 \
 -isystem ${CMAKE_SYSROOT}/usr/include/c++/4.9.4/arm-linux-gnueabihf \
-D_GNU_SOURCE -std=c++17 -D_GLIBCXX_USE_CXX11_ABI=1  -march=armv7-a -mfloat-abi=hard -mfpu=neon " CACHE STRING "cxx flags")
