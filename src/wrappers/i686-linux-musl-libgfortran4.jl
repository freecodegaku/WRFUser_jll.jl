# Autogenerated wrapper script for wrfuser_jll for i686-linux-musl-libgfortran4
export WRFUser

using CompilerSupportLibraries_jll
JLLWrappers.@generate_wrapper_header("wrfuser")
JLLWrappers.@declare_library_product(WRFUser, "wrfuser.so")
function __init__()
    JLLWrappers.@generate_init_header(CompilerSupportLibraries_jll)
    JLLWrappers.@init_library_product(
        WRFUser,
        "lib/wrfuser.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
