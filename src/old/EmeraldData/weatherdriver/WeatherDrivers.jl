module WeatherDrivers

using DataFrames: DataFrame
using DocStringExtensions: TYPEDEF, TYPEDFIELDS
using ProgressMeter: @showprogress

using PkgUtility.MathTools: nanmean, resample
using PkgUtility.PhysicalChemistry: saturation_vapor_pressure
using PkgUtility.PrettyDisplay: pretty_display!
using NetcdfIO: append_nc!, read_nc, save_nc!, varname_nc


# parser and utility functions
include("parser.jl");
include("snapshot.jl");


end; # module
