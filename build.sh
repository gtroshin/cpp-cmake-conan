#!/bin/bash

set -e
set -x

mkdir build && cd build

# since we are running the modern distributive and gcc >= 5, we need to overrride compiler.libcxx in default settings
conan install .. --build=missing -s compiler.libcxx=libstdc++11
cmake .. -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release
cmake --build .

./bin/md5
