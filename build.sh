#!/bin/bash

set -e
set -x

mkdir build && cd build

# since we are running the modern distributive and gcc >= 5, we need to change compiler.libcxx in default profile
conan profile update settings.compiler.libcxx=libstdc++11 default

conan install .. --build=missing
cmake .. -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release
cmake --build .

./bin/md5
