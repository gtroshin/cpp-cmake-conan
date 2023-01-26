find_package(gtest REQUIRED)
include(CTest)

add_executable(tests tests.cpp)
target_link_libraries(tests GTest::gtest_main)
include(GoogleTest)
gtest_discover_tests(tests)
