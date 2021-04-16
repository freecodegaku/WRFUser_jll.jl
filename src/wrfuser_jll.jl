# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule wrfuser_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("wrfuser")
JLLWrappers.@generate_main_file("wrfuser", UUID("66307a7f-b63f-5cd2-ae25-ee9b20ebbd65"))
end  # module wrfuser_jll
