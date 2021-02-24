add_executable (fluid2d "main.cpp")

target_link_libraries(fluid2d DelFEM)
copy_3rdparty_dlls(fluid2d)
