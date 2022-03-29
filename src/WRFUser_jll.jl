# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule WRFUser_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("WRFUser")
JLLWrappers.@generate_main_file("WRFUser", UUID("77a14646-d6d5-5101-a813-13035cb2bc90"))
end  # module WRFUser_jll
