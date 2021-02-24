add_executable (helmholtz2d "main.cpp")

target_link_libraries(helmholtz2d DelFEM)
copy_3rdparty_dlls(helmholtz2d)
