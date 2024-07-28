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
    --host-cc=/usr/bin/clang \
    --host-cxx=/usr/bin/clang++ \
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

