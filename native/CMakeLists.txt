# native/CMakeLists.txt
cmake_minimum_required(VERSION 3.10)

project(hello)

add_library(hello SHARED hello.c)

target_include_directories(hello PRIVATE src/include)