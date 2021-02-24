add_executable (dkt2d "main.cpp")

target_link_libraries(dkt2d DelFEM)
copy_3rdparty_dlls(dkt2d)
