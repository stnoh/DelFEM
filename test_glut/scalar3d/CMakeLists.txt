add_executable (scalar3d "main.cpp")

target_link_libraries(scalar3d DelFEM)
copy_3rdparty_dlls(scalar3d)
