#!/bin/bash -vex

echo "Building Toolchain…"

swift/utils/build-script \
    --release \
    --assertions \
    --no-swift-stdlib-assertions \
    --swift-enable-ast-verifier=0 \
    --swift-darwin-supported-archs "$(uname -m)" \
    --skip-ios \
    --skip-tvos \
    --skip-watchos \
    --skip-build-benchmarks \
    --skip-test-osx \
    --android \
    --android-ndk ${ANDROID_HOME:-$HOME/Library/Android/sdk}/ndk/26.3.11579264 \
    --android-arch aarch64 \
    --android-api-level 29 \
    --stdlib-deployment-targets=android-aarch64 \
    --install-destdir=build/swift-install \
    --install-prefix=/usr \
    --host-cc=/usr/bin/clang \
    --host-cxx=/usr/bin/clang++ \
    --install-swift \
    --skip-test-swift \
    --llbuild \
    --install-llbuild \
    --swiftpm \
    --install-swiftpm \
    --foundation \
    --install-foundation

