#!/bin/bash -ex

echo "Building Toolchain…"

swift/utils/build-script \
    --release \
    --assertions \
    --android \
    --android-ndk ${ANDROID_NDK_HOME} \
    --android-arch aarch64 \
    --android-api-level 29 \
    --stdlib-deployment-targets=android-aarch64 \
    --no-swift-stdlib-assertions \
    --swift-enable-ast-verifier=0 \
    --swift-darwin-supported-archs "$(uname -m)" \
    --skip-ios \
    --skip-tvos \
    --skip-watchos \
    --skip-build-benchmarks \
    --skip-test-osx \
    --skip-test-swift \
    --install-destdir=build/swift-install \
    --install-prefix=/usr \
    --cross-compile-append-host-target-to-destdir=False \
    --host-cc=/usr/bin/clang \
    --host-cxx=/usr/bin/clang++ \
    --native-clang-tools-path=/usr/bin \
    --install-swift \
    --llbuild \
    --install-llbuild \
    --swiftpm \
    --install-swiftpm \
    --foundation \
    --install-foundation \
    --extra-cmake-options="\
        -DCMAKE_C_COMPILER=/usr/bin/clang \
        -DSWIFT_STDLIB_HAS_ASL=FALSE \
    "

# Notes:
#
# -DCMAKE_C_COMPILER=/usr/bin/clang
# needed or else: bootstrap: note: Building swift-system
# CMake Error at CMakeLists.txt:11 (project):
#   The CMAKE_C_COMPILER:
# 
#     /Users/runner/work/swift-android-macos-toolchain/swift-android-macos-toolchain/build/swift-install/usr/bin/clang
# 
#   is not a full path to an existing compiler tool.
# 
#   Tell CMake where to find the compiler by setting either the environment
#   variable "CC" or the CMake cache entry CMAKE_C_COMPILER to the full path to
#   the compiler, or to the compiler name if it is in the PATH.



