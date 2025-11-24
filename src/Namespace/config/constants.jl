"""
Method configuration for the SPAC model
"""
Base.@kwdef mutable struct SPACConstants{FT<:AbstractFloat}
    # photosynthesis rate constants
    "Rate constants for PSI and PSII combined (most for PSII?)"
    PS_RATE_CONSTANTS::PhotosystemsRateConstants{FT} = PhotosystemsRateConstants{FT}()
    "Rate constants for PSI"
    PSI_RATE_CONSTANTS::PhotosystemIRateConstants{FT} = PhotosystemIRateConstants{FT}()
    "Rate constants for PSII"
    PSII_RATE_CONSTANTS::PhotosystemIIRateConstants{FT} = PhotosystemIIRateConstants{FT}()
end;
