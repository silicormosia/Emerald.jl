using Revise
using Emerald

FT = Float64;

config = Emerald.Namespace.SPACConfig(FT);
spac = Emerald.Namespace.BulkSPAC(config);
Emerald.SPAC.initialize_spac!(config, spac);
Emerald.SPAC.spac!(config, spac, FT(1));
