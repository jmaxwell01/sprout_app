# This file controls Flutter-level build steps. It should not be edited.
cmake_minimum_required(VERSION 3.14)

set(EPHEMERAL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/ephemeral")

# Configuration provided via flutter build.
if(NOT DEFINED ENV{FLUTTER_ROOT} AND NOT DEFINED CACHE{FLUTTER_ROOT})
  set(FLUTTER_ROOT "$ENV{FLUTTER_ROOT}" CACHE PATH "Path to the Flutter SDK")
endif()

set(FLUTTER_TARGET_PLATFORM "windows-x64")

set(WRAPPER_ROOT "${EPHEMERAL_DIR}/cpp_client_wrapper")

add_library(flutter_wrapper_app STATIC
  "${WRAPPER_ROOT}/flutter_engine.cc"
  "${WRAPPER_ROOT}/flutter_view_controller.cc"
)

apply_standard_settings(flutter_wrapper_app)
target_link_libraries(flutter_wrapper_app PUBLIC flutter)
target_include_directories(flutter_wrapper_app PUBLIC
  "${EPHEMERAL_DIR}"
)
add_dependencies(flutter_wrapper_app flutter_assemble)

add_custom_target(flutter_assemble DEPENDS
  "${EPHEMERAL_DIR}/flutter_windows.dll"
)
