module Namespace

using LazyArtifacts
using PkgUtility.UniversalConstants: T₀, T₂₅
using PkgUtility.UniversalConstants: TraceGasAir, TraceGasCH₄, TraceGasCO₂, TraceGasH₂O, TraceGasN₂, TraceGasO₂, TraceLiquidH₂O
using PkgUtility.MathTools: interpolate_data

using ..EmeraldIO.Text: read_csv
using ..EmeraldIO.Jld2: read_jld2, save_jld2!


# Please do not use V1/V2/V3 files here as they do not contain the Phi_PSI and Phi_PSII variables
const LAND_ARTIFACT    = artifact"land_model_spectrum_V8" * "/land_model_spectrum_V8.jld2";
const OLD_PHI_2017     = "oldphi_2017";
const OLD_PHI_2021     = "oldphi_2021";
const NEW_PHI_2017     = "newphi_2017";
const NEW_PHI_2021     = "newphi_2021";
const OLD_PHI_2017_1NM = "oldphi_2017_1nm";
const OLD_PHI_2021_1NM = "oldphi_2021_1nm";
const NEW_PHI_2017_1NM = "newphi_2017_1nm";
const NEW_PHI_2021_1NM = "newphi_2021_1nm";
const SOIL_TEXTURE     = read_csv("$(@__DIR__)/../../data/SOIL-TEXTURE.csv");


include("config/config-info.jl");
include("config/constants/photosynthesis-rate-constant.jl");
include("config/constants/reference-spectra.jl");
include("config/constants.jl");
include("config/dimensions.jl");
include("config/features.jl");
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
