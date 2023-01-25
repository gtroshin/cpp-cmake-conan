#!/bin/bash

set -e
set -x

mkdir build && cd build

conan install .. --build=missing
cmake .. -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release
cmake --build .

./bin/md5
