add_executable (rigid "main.cpp")

target_link_libraries(rigid DelFEM)
copy_3rdparty_dlls(rigid)
