module Namespace

using PkgUtility.UniversalConstants: T₀, T₂₅


include("config/constants/photosynthesis-rate-constant.jl");
include("config/constants.jl");

include("config/methods/colimitation-method.jl");
include("config/methods/colimitation-method-settings.jl");
include("config/methods/fluorescence-model.jl");
include("config/methods/fluorescence-model-settings.jl");
include("config/methods/fluorescence-spectra.jl");
include("config/methods/photosynthesis-model.jl");
include("config/methods/soil-albedo.jl");
include("config/methods/stomatal-model-beta.jl");
include("config/methods/stomatal-model.jl");
include("config/methods/temperature-dependency.jl");
include("config/methods/temperature-dependency-settings.jl");
include("config/methods.jl");

include("config.jl");

include(("../old/EmeraldLand/Namespace/Namespace.jl"));

end # module Namespace
