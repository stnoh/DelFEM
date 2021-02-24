add_executable (solid3d "main.cpp")

target_link_libraries(solid3d DelFEM)
copy_3rdparty_dlls(solid3d)
