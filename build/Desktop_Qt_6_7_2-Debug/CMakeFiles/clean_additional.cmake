# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/Tesla_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/Tesla_autogen.dir/ParseCache.txt"
  "Tesla_autogen"
  )
endif()
