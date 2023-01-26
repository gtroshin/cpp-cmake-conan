# Basic C++ project using CMake & Conan
![CMake 3.25.2](https://img.shields.io/badge/CMake-3.25.2-blue.svg)
[![Build and Test](https://github.com/gtroshin/cpp-cmake-conan/actions/workflows/build-test.yml/badge.svg)](https://github.com/gtroshin/cpp-cmake-conan/actions/workflows/build-test.yml)

## Requirements

The following tools are in the foundation to be able to develop this project. 

Please follow the linked official guides with a installation instructions depending on your platform.

This project has been tested on Linux and macOS.

* [CMake 3.25.2](https://cmake.org/cmake/help/v3.25/index.html)
* [Conan](https://conan.io/downloads.html)

## Development

This project can be built and run locally on Linux and macOS and you can decide to use a Docker environment.

Run the following command to launch the bash environment with pre-installed CMake and Conan in a container. [More details are here.](https://docs.conan.io/en/latest/howtos/run_conan_in_docker.html#docker-conan)


```sh
# start up a docker container
docker run -it --rm --name conangcc11 conanio/gcc11-ubuntu16.04 /bin/bash
```

Run the following commands to build and execute test the project (macOS/Debug).

```sh
# create a build folder
mkdir build && cd build
# install the dependencies using conan
conan install -s build_type=Debug .. --build=missing
# build
cmake .. -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Debug
cmake --build .
# test
ctest -C Debug
```

## CI/CD

The Continues Integration uses GitHub Actions workflow that includes `build` and `test` jobs run in an OS matrix to cover the latest available Linux and macOS distributives. As well as the `release` job that is only triggered when the new release is published and attaches binaries to the relevant release. Additionally, the workflow can be triggered via `workflow_dispatch` event, manually.

## Release process

The release can be created via the GitHub UI where an engineer can create a tag at the same time. Or as an alternative, an engineer can create and push the tag manually, which should trigger the same workflow with a `release` job. Please see the steps for a manual tag creation via git.

```sh
# create a tag locally (v1.0.0)
git tag <tagname>
# push a tag to remote
git push origin <tag>
```

## Usefull links

[GoogleTest Testing framework that is used to tun tests in this project](https://google.github.io/googletest/)
