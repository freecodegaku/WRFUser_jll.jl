# Autogenerated wrapper script for WRFUser_jll for x86_64-w64-mingw32-libgfortran4
export wrfuser

using CompilerSupportLibraries_jll
JLLWrappers.@generate_wrapper_header("WRFUser")
JLLWrappers.@declare_library_product(wrfuser, "wrfuser.dll")
function __init__()
    JLLWrappers.@generate_init_header(CompilerSupportLibraries_jll)
    JLLWrappers.@init_library_product(
        wrfuser,
        "bin\\wrfuser.dll",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()