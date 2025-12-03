using Revise
using Emerald

FT = Float64;

config = Emerald.EmeraldLand.Namespace.SPACConfig(FT);
spac = Emerald.EmeraldLand.Namespace.BulkSPAC(config);
Emerald.EmeraldLand.SPAC.initialize_spac!(config, spac);
Emerald.EmeraldLand.SPAC.spac!(config, spac, FT(1));
