cmake_minimum_required(VERSION 2.8.2)
project(IntroToGoogleTest)

SET( CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -std=c++1z" )

# Download and unpack googletest at configure time
configure_file(Libs/GoogleTest/CMakeLists.txt.in googletest-download/CMakeLists.txt)
execute_process(COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" .
  RESULT_VARIABLE result
  WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/googletest-download )
if(result)
  message(FATAL_ERROR "CMake step for googletest failed: ${result}")
endif()
execute_process(COMMAND ${CMAKE_COMMAND} --build .
  RESULT_VARIABLE result
  WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/googletest-download )
if(result)
  message(FATAL_ERROR "Build step for googletest failed: ${result}")
endif()

# Prevent overriding the parent project's compiler/linker
# settings on Windows
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

# Add googletest directly to our build. This defines
# the gtest and gtest_main targets.
add_subdirectory(${CMAKE_BINARY_DIR}/googletest-src
                 ${CMAKE_BINARY_DIR}/googletest-build
                 EXCLUDE_FROM_ALL)

# The gtest/gtest_main targets carry header search path
# dependencies automatically when using CMake 2.8.11 or
# later. Otherwise we have to add them here ourselves.
if (CMAKE_VERSION VERSION_LESS 2.8.11)
  include_directories("${gtest_SOURCE_DIR}/include")
endif()

# Now simply link against gtest or gtest_main as needed.

include_directories(.)

add_executable(ProcessorModuleTests
  Implementation/Processor.hpp
  Implementation/Processor.cpp
  Tests/ProcessorTests.cpp)
target_link_libraries(ProcessorModuleTests gmock_main)

add_executable(LoggerModuleTests
  Implementation/FileInterface.hpp
  Implementation/File.hpp
  Implementation/File.cpp
  Implementation/LoggerToFile.hpp
  Implementation/LoggerToFile.cpp
  Tests/LoggerToFileTests.cpp
  Tests/MockFile.hpp)
target_link_libraries(LoggerModuleTests gmock_main)

add_executable(PorterModuleTests
  Implementation/FileInterface.hpp
  Implementation/File.hpp
  Implementation/File.cpp
  Implementation/LoggerToFile.hpp
  Implementation/LoggerToFile.cpp
  Implementation/Porter.hpp
  Implementation/Porter.cpp
  Tests/PorterTests.cpp
  Tests/MockFile.hpp)
target_link_libraries(PorterModuleTests gmock_main)

include(CTest)
add_test(Processor_Module_Tests ProcessorModuleTests)
add_test(Logger_Module_Tests LoggerModuleTests)
add_test(Porter_Module_Tests PorterModuleTests)

add_executable(app
  Implementation/LoggerToFile.cpp
  Implementation/LoggerToFile.hpp
  Implementation/FileInterface.hpp
  Implementation/File.hpp
  Implementation/File.cpp
  Implementation/Porter.hpp
  Implementation/Porter.cpp
  Implementation/app.cpp)