"""
Method configuration for the SPAC model
"""
Base.@kwdef mutable struct SPACMethods{FT<:AbstractFloat}
    # soil albedo method
    "Soil albedo method"
    SOIL_ALBEDO::AbstractSoilAlbedo = SoilAlbedoHyperspectralCLIMA()
end;
