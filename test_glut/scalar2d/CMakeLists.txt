add_executable (scalar2d "main.cpp")

target_link_libraries(scalar2d DelFEM)
copy_3rdparty_dlls(scalar2d)
