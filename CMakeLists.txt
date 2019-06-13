cmake_minimum_required(VERSION 2.8.12)
project(MutationProj)

add_definitions("-std=c++11")

include(build/conanbuildinfo.cmake)
conan_basic_setup()

add_executable(factorial 
    src/factorial.cpp 
    src/main.cpp
)

# define tests
add_executable(test-factorial
    src/test-factorial.cpp
    src/factorial.cpp
)

target_link_libraries(test-factorial ${CONAN_LIBS} pthread)

add_test(test-factorial test-factorial)