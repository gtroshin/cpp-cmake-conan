#!/bin/bash

set -e
set -x

mkdir build && cd build

if [ "$RUNNER_OS" == "Linux" ]; then
    # Since we are running the modern Linux distributive and gcc >= 5, we need to override compiler.libcxx in the default settings
    conan install .. --build=missing -s compiler.libcxx=libstdc++11
elif [ "$RUNNER_OS" == "macOS" ]; then
    conan install .. --build=missing -s compiler.libcxx=libstdc++
else
    echo "$RUNNER_OS is not supported by build script"
    exit 1
fi

cmake .. -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release
cmake --build .

./bin/md5
