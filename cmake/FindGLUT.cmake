# [TEMPORARY CMAKE FILE FOR GLFW]

# GLUT_FOUND
# GLUT_INCLUDE_DIR
# GLUT_LIBRARIES
# GLUT_BINARIES

find_path (GLUT_INCLUDE_DIR
  NAMES
    GL/glut.h
  PATHS
    "${GLUT_ROOT}/include"
  DOC
    "The directory where GL/glut.h resides"
)

if (WIN32 AND MSVC14 OR (${MSVC_VERSION} EQUAL 1900))
  find_library (GLUT_LIBRARIES
    NAMES
      freeglut
    PATHS
      "${GLUT_ROOT}/lib"
    DOC
      "The FreeGLUT library"
  )
else()
  message(WARNING "We do not support this environment yet.")
endif()

if (WIN32 AND MSVC14 OR (${MSVC_VERSION} EQUAL 1900))
  find_file (GLUT_BINARIES
    NAMES
      freeglut.dll
    PATHS
      "${GLUT_ROOT}/bin"
    DOC
      "The FreeGLUT prebuilt binary"
  )
else()
  message(WARNING "We do not support this environment yet.")
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GLUT DEFAULT_MSG GLUT_LIBRARIES GLUT_INCLUDE_DIR)

if(GLUT_FOUND)
  set(GLUT_INCLUDE_DIR ${GLUT_INCLUDE_DIR})

  if(NOT GLUT_LIBRARIES)
    set(GLUT_LIBRARIES ${GLUT_LIBRARIES})
  endif()

  if(NOT GLUT_BINARIES)
    set(GLUT_BINARIES    ${GLUT_BINARIES})
  endif()

  if (NOT TARGET OpenGL::GLUT)
    add_library(OpenGL::GLUT UNKNOWN IMPORTED)
    set_target_properties(OpenGL::GLUT PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${GLUT_INCLUDE_DIR}")
    set_property(TARGET OpenGL::GLUT APPEND PROPERTY IMPORTED_LOCATION "${GLUT_LIBRARIES}")
  endif()
endif()

#mark_as_advanced(GLUT_INCLUDE_DIR GLUT_LIBRARIES)
