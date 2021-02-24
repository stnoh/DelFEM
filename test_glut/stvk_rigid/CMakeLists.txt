add_executable (stvk_rigid "main.cpp")

target_link_libraries(stvk_rigid DelFEM)
copy_3rdparty_dlls(stvk_rigid)
