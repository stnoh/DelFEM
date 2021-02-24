add_executable (hyper3d "main.cpp")

target_link_libraries(hyper3d DelFEM)
copy_3rdparty_dlls(hyper3d)
