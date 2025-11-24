"""
General configuration for the SPAC model.
"""
Base.@kwdef mutable struct SPACConfig{FT<:AbstractFloat}
    "Methods used in the SPAC model"
    METHODS::SPACMethods{FT} = SPACMethods{FT}()
end;
