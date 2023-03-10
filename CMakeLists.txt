cmake_minimum_required(VERSION 2.8.12)
project(MD5Encrypter)

if(CMAKE_VERSION VERSION_LESS 3.0.0)
    include(CheckCXXCompilerFlag)
    check_cxx_compiler_flag(-std=c++11 COMPILER_SUPPORTS_CXX11)
    check_cxx_compiler_flag(-std=c++0x COMPILER_SUPPORTS_CXX0X)
    if(COMPILER_SUPPORTS_CXX11)
      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
    elseif(COMPILER_SUPPORTS_CXX0X)
      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
    endif()
else()
    SET(CMAKE_CXX_STANDARD 11)
    SET(CMAKE_CXX_STANDARD_REQUIRED ON)
endif()

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

add_executable(md5 md5.cpp)
target_link_libraries(md5 ${CONAN_LIBS})

include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
)

set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

# Adding the tests:
option(ENABLE_TESTING "Enable the tests" ON)
if(ENABLE_TESTING)
  enable_testing()
  message("Building Tests...")
  add_subdirectory(tests)
endif()
