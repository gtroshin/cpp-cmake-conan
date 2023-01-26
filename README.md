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

Run the following command to launch the bash environment with pre-installed CMake and Conan in a contaner. [More details are here.](https://docs.conan.io/en/latest/howtos/run_conan_in_docker.html#docker-conan)


```sh
docker run -it --rm --name conangcc11 conanio/gcc11-ubuntu16.04 /bin/bash
```
