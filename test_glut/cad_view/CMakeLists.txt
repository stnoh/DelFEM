add_executable (cad_view "main.cpp")

target_link_libraries(cad_view DelFEM)
copy_3rdparty_dlls(cad_view)
