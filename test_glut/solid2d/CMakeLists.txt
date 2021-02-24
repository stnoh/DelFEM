add_executable (solid2d "main.cpp")

target_link_libraries(solid2d DelFEM)
copy_3rdparty_dlls(solid2d)
