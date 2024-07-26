#!/bin/bash -ex

echo "Fetching Swift…"
ROOT_DIR=$(realpath $(dirname $0))/../
SWIFT_BRANCH=${SWIFT_BRANCH:-"release/6.0"}

git clone https://github.com/swiftlang/swift.git --branch $SWIFT_BRANCH --single-branch
swift/utils/update-checkout --clone --scheme $SWIFT_BRANCH

