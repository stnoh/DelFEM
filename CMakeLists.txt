##############################################################################
# CMake-based build system for DelFEM.
# The original code was developed by Dr. Nobuyuki Umetani.
# 
# This CMake script is implemented by Seung-Tak Noh (seungtak.noh@gmail.com)
##############################################################################
cmake_minimum_required (VERSION 3.1)
project ("DelFEM")

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# to suppress warning on {package}_ROOT in cmake
if (POLICY CMP0074)
  cmake_policy(SET CMP0074 NEW)
endif()

## additional definition to suppress warning
add_definitions( "/D_CRT_SECURE_NO_WARNINGS /D_XKEYCHECK_H" )


########################################
# Handling 3rd party libraries
########################################
find_package(OpenGL REQUIRED)

set(GLUT_ROOT ${CMAKE_SOURCE_DIR}/3rdParty/FreeGLUT)
find_package(GLUT REQUIRED)


###############################################################################
# Main library (DelFEM)
###############################################################################
set(DELFEM_HEADER_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)
set(DELFEM_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)

file(GLOB headers "${DELFEM_HEADER_DIR}/delfem/*.h")
file(GLOB_RECURSE headers_cad    "${DELFEM_HEADER_DIR}/delfem/cad/*.h")
file(GLOB_RECURSE headers_femeqn "${DELFEM_HEADER_DIR}/delfem/femeqn/*.h")
file(GLOB_RECURSE headers_femls  "${DELFEM_HEADER_DIR}/delfem/femls/*.h")
file(GLOB_RECURSE headers_ls     "${DELFEM_HEADER_DIR}/delfem/ls/*.h")
file(GLOB_RECURSE headers_matvec "${DELFEM_HEADER_DIR}/delfem/matvec/*.h")
file(GLOB_RECURSE headers_msh    "${DELFEM_HEADER_DIR}/delfem/msh/*.h")
file(GLOB_RECURSE headers_rigid  "${DELFEM_HEADER_DIR}/delfem/rigid/*.h")

file(GLOB sources "${DELFEM_SOURCE_DIR}/*.cpp")
file(GLOB_RECURSE sources_cad      "${DELFEM_SOURCE_DIR}/cad/*.cpp")
file(GLOB_RECURSE sources_com      "${DELFEM_SOURCE_DIR}/com/*.cpp")
file(GLOB_RECURSE sources_femeqn   "${DELFEM_SOURCE_DIR}/femeqn/*.cpp")
file(GLOB_RECURSE sources_femfield "${DELFEM_SOURCE_DIR}/femfield/*.cpp")
file(GLOB_RECURSE sources_femls    "${DELFEM_SOURCE_DIR}/femls/*.cpp")
file(GLOB_RECURSE sources_ls       "${DELFEM_SOURCE_DIR}/ls/*.cpp")
file(GLOB_RECURSE sources_matvec   "${DELFEM_SOURCE_DIR}/matvec/*.cpp")
file(GLOB_RECURSE sources_msh      "${DELFEM_SOURCE_DIR}/msh/*.cpp")
file(GLOB_RECURSE sources_rigid    "${DELFEM_SOURCE_DIR}/rigid/*.cpp")

## exception case
list(REMOVE_ITEM headers_cad "${DELFEM_HEADER_DIR}/delfem/cad/contact_target_cad3d.h")
list(REMOVE_ITEM sources_cad "${DELFEM_SOURCE_DIR}/cad/contact_target_cad3d.cpp")


########################################
## DelFEM build
########################################
add_library(DelFEM STATIC
  ${headers}        ${headers_cad}
  ${headers_femeqn} ${headers_femls}
  ${headers_ls}     ${headers_matvec}   ${headers_msh}   ${headers_rigid}
  ${sources}        ${sources_cad}      ${sources_com}
  ${sources_femeqn} ${sources_femfield} ${sources_femls}
  ${sources_ls}     ${sources_matvec}   ${sources_msh}   ${sources_rigid}
)

# make "filters" for VisualStudio
source_group("Header Files\\cad"    FILES ${headers_cad})
source_group("Header Files\\femeqn" FILES ${headers_femeqn})
source_group("Header Files\\femls"  FILES ${headers_femls})
source_group("Header Files\\ls"     FILES ${headers_ls})
source_group("Header Files\\matvec" FILES ${headers_matvec})
source_group("Header Files\\msh"    FILES ${headers_msh})
source_group("Header Files\\rigid"  FILES ${headers_rigid})

source_group("Source Files\\cad"      FILES ${sources_cad})
source_group("Source Files\\com"      FILES ${sources_com})
source_group("Source Files\\femeqn"   FILES ${sources_femeqn})
source_group("Source Files\\femfield" FILES ${sources_femfield})
source_group("Source Files\\femls"    FILES ${sources_femls})
source_group("Source Files\\ls"       FILES ${sources_ls})
source_group("Source Files\\matvec"   FILES ${sources_matvec})
source_group("Source Files\\msh"      FILES ${sources_msh})
source_group("Source Files\\rigid"    FILES ${sources_rigid})

## add header-only library
target_include_directories(DelFEM PUBLIC
  ${DELFEM_HEADER_DIR}
)

########################################
## 3rd party libraries (mandatory)
########################################
## link *.lib
target_link_libraries(DelFEM
  OpenGL::GLU OpenGL::GLUT
)

## copy *.dll macro as post build process
macro(copy_3rdparty_dlls APP)
  add_custom_command(TARGET ${APP} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different ${GLUT_ROOT}/bin/freeglut.dll	${CMAKE_CURRENT_BINARY_DIR}	## FreeGLUT
  )
endmacro()


##############################################################################
# Executables
##############################################################################
add_subdirectory(test_glut_lowlev/solid2d)
