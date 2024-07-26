#!/bin/bash -ex

echo "Fetching Swift…"
ROOT_DIR=$(realpath $(dirname $0))/../
BRANCH="release/6.0"

SWIFT_SRC="swift"
mkdir -p $SWIFT_SRC

pushd $SWIFT_SRC
    git clone https://github.com/swiftlang/swift.git --branch $BRANCH --single-branch
    swift/utils/update-checkout --clone --scheme $BRANCH
popd

