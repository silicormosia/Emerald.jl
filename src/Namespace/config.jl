"""
General configuration for the SPAC model.
"""
Base.@kwdef mutable struct SPACConfig{FT<:AbstractFloat}
    "Constants used in the SPAC model"
    CONSTANTS::SPACConstants{FT} = SPACConstants{FT}();
    "Dimensions of the SPAC system"
    DIMENSIONS::SPACDimensions{FT} = SPACDimensions{FT}();
    "Methods used in the SPAC model"
    METHODS::SPACMethods{FT} = SPACMethods{FT}()
end;
