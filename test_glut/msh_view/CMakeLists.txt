add_executable (msh_view "main.cpp")

target_link_libraries(msh_view DelFEM)
copy_3rdparty_dlls(msh_view)
