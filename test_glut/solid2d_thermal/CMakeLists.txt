add_executable (solid2d_thermal "main.cpp")

target_link_libraries(solid2d_thermal DelFEM)
copy_3rdparty_dlls(solid2d_thermal)
