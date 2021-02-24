add_executable (cad2d_edit "main.cpp")

target_link_libraries(cad2d_edit DelFEM)
copy_3rdparty_dlls(cad2d_edit)
