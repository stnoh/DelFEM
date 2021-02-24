add_executable (cad3d "main.cpp")

target_link_libraries(cad3d DelFEM)
copy_3rdparty_dlls(cad3d)
