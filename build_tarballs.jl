# Note that this script can accept some limited command-line arguments, run
# `julia build_tarballs.jl --help` to see a usage message.
using BinaryBuilder, Pkg

name = "WRFUser"
version = v"0.0.1"

# Collection of sources required to complete build
sources = [
    GitSource("https://github.com/NCAR/wrf-python.git", "086328fa7bc37121e6c4d10add99f560ea80e394"),
]

# Bash recipe for building across all platforms
script = raw"""
cd $WORKSPACE/srcdir
mkdir -p "${libdir}"

FC="gfortran"
FLAGS="-O3 -shared -fPIC"
wrfpath="wrf-python"

install_license ${wrfpath}/LICENSE 
${FC} ${FLAGS} ${wrfpath}/fortran/wrf_constants.f90 -o ./wrf_constants.o
${FC} ${FLAGS} ${wrfpath}/fortran/{rip_cape,wrf_{cloud_fracf,fctt,user_dbz}}.f90 -L${libdir} -o ${libdir}/wrfuser.${dlext}
exit
"""
             #"fortran/wrf_relhl.f90",
             #"fortran/calc_uh.f90",
             #"fortran/wrf_user_latlon_routines.f90",
             #"fortran/wrf_pvo.f90",
             #"fortran/eqthecalc.f90",
             #"fortran/wrf_rip_phys_routines.f90",
             #"fortran/wrf_pw.f90",
             #"fortran/wrf_vinterp.f90"]
# These are the platforms we will build for by default, unless further
# platforms are passed in on the command line
platforms = supported_platforms()
platforms = [
    Platform("x86_64", "linux"; libc = "glibc"),
    Platform("x86_64", "macos"),
    Platform("aarch64", "linux"; libc="glibc"),
    Platform("x86_64", "windows"),
    Platform("i686", "windows"),
]
platforms = expand_gfortran_versions(platforms)

# The products that we will ensure are always built
products = [
    LibraryProduct("wrfuser", :wrfuser)
]

# Dependencies that must be installed before this package can be built
dependencies = Dependency[
	Dependency(PackageSpec(name="CompilerSupportLibraries_jll", uuid="e66e0078-7015-5450-92f7-15fbd957f2ae"))
]

# Build the tarballs, and possibly a `build.jl` as well.
build_tarballs(ARGS, name, version, sources, script, platforms, products, dependencies; julia_compat="1.6", preferred_gcc_version = v"5.2.0")
