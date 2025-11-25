"""
General configuration for the SPAC model.
"""
Base.@kwdef mutable struct SPACConfig{FT<:AbstractFloat}
    "General configuration information"
    CONFIG_INFO::SPACConfigInfo = SPACConfigInfo()
    "Constants used in the SPAC model"
    CONSTANTS::SPACConstants{FT} = SPACConstants{FT}()
    "Dimensions of the SPAC system"
    DIMENSIONS::SPACDimensions{FT} = SPACDimensions{FT}()
    "Features on/off/settings of the SPAC model"
    FEATURES::SPACFeatures = SPACFeatures()
    "Methods used in the SPAC model"
    METHODS::SPACMethods{FT} = SPACMethods{FT}()
end;
