module Emerald

using Revise


# include the submodules
include("old/EmeraldIO/EmeraldIO.jl");

include("old/EmeraldMath/EmeraldMath.jl");

include("old/EmeraldLand/EmeraldLand.jl");
include("old/EmeraldOcean/EmeraldOcean.jl");

include("old/EmeraldData/EmeraldData.jl");

include("old/EmeraldEarth/EmeraldEarth.jl");
include("old/EmeraldFrontier/EmeraldFrontier.jl");


end # module Emerald
