# The design of a refactored struct consists of several major components:
#     state variables are all store in a single struct as a field
#     auxiliary variables are all store in a single struct as a field
#     other sublevel structs that has their own state and auxiliary variables are stored as fields
# To avoid any confusion, it is recommended to use only state and auxiliary variables in the main struct, or use only the fields of sublevel structs



using DocStringExtensions: TYPEDEF, TYPEDFIELDS

using PkgUtility.MathTools: NewtonBisectionMethod, SolutionTolerance, find_zero
using PkgUtility.RecursiveTools: sync_struct!
using PkgUtility.UniversalConstants: CP_D_MOL, CP_L, CP_L_MOL, CP_V_MOL, GAS_R, GRAVITY, M_H₂O, P_ATM, T₀, T₂₅, ρ_H₂O





# General instructions to run SPAC (dependent on config)
include("general.jl");


# General methods (for users to choose from)
include("method/lidf.jl");
include("method/pv.jl");
include("method/soil.jl");
include("method/xylem.jl");

# Plant hydraulics (dependent on config and method)
include("xylem/energy.jl");

include("xylem/junction.jl");
include("xylem/xylem.jl");


# Soil
include("soil/bulk.jl");
include("soil/layer.jl");


# Root system (dependent on xylem)
include("root/rhizosphere.jl");

include("root/root.jl");


# Stem system (dependent on xylem)
include("stem/stem.jl");


# Leaf system (dependent on xylem)
include("leaf/biophysics.jl");
include("leaf/energy.jl");
include("leaf/extraxylem.jl");
include("leaf/leafflux.jl");

include("leaf/layerflux.jl");

include("leaf/photosynthesis.jl");

include("leaf/layer.jl");
include("leaf/leaf.jl");


# Canopy
include("canopy/clumping.jl");
include("canopy/sensor_geometry.jl");
include("canopy/structure.jl");
include("canopy/sun_geometry.jl");

include("canopy/canopy.jl");


# Environment
include("environment/air.jl");
include("environment/radiation.jl");

include("environment/meteorology.jl");


# SPAC
include("spac/cache.jl");
include("spac/info.jl");
include("spac/memory.jl");
include("spac/pool.jl");

include("spac/plant.jl");

include("spac/bulk.jl");
