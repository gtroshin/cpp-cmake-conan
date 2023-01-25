#!/bin/bash

set -e
set -x

mkdir build && cd build

if [ ${{ matrix.os }} = ubuntu-latest ]
then
    # since we are running the modern distributive and gcc >= 5, we need to override compiler.libcxx in the default settings
    conan install .. --build=missing -s compiler.libcxx=libstdc++11
elif [ ${{ matrix.os }} = macos-latest ]
    conan install .. --build=missing -s compiler.libcxx=libstdc++
fi


cmake .. -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release
cmake --build .

./bin/md5
