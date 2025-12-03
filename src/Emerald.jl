module Emerald

using Revise


# requires DataCenter to read the input data
include("Namespace/Namespace.jl");



include("old/EmeraldLand/EmeraldLand.jl");

include("old/EmeraldData/EmeraldData.jl");

include("old/EmeraldFrontier/EmeraldFrontier.jl");


end # module Emerald
