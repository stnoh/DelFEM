add_executable (field_evaluate "main.cpp")

target_link_libraries(field_evaluate DelFEM)
copy_3rdparty_dlls(field_evaluate)
