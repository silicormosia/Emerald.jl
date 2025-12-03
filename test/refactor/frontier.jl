import Emerald.EmeraldFrontier as EF
import Emerald.EmeraldLand.SPAC as SPAC
import GriddingMachine.Indexer as GMI


all_true = Dict{String, Any}(
            "MOD_SWC"     => true,
            "MOD_P_SOIL"  => true,
            "MOD_T_SOIL"  => true,
            "MOD_T_LEAF"  => true,
            "MOD_T_MMM"   => true,
            "BETA"        => true,
            "CNPP"        => true,
            "ET_SOIL"     => true,
            "ET_VEGE"     => true,
            "GPP"         => true,
            "OCS"         => true,
            "SIF683"      => true,
            "SIF740"      => true,
            "SIF757"      => true,
            "SIF771"      => true,
            "ΣSIF"        => true,
            "ΣSIF_CHL"    => true,
            "ΣSIF_LEAF"   => true,
            "MOD_ΦDΦN"    => true,
            "MOD_ΦFΦP"    => true,
            "NDVI"        => true,
            "EVI"         => true,
            "NIRvI"       => true,
            "NIRvR"       => true,
            "PAR"         => true,
            "APAR"        => true,
            "PPAR"        => true,
            "C_POOL"      => true,
            "K_PLANT"     => true,
            "K_ROOT_STEM" => true,
            "MOD_P_LEAF"  => true,
            "MOD_P_MMM"   => true,
            "P_JUNCTION"  => true,
            "SAP_VOLUME"  => true,
            "TRUNK_AREA"  => true,
            "MOD_HEAT"    => true,
);


gm_tag = "gm2";
wd_tag = "wd1";
year = 2019;

gmd = GMI.grid_dict(GMI.LandDatasetLabels(gm_tag, year), 31.5, 117.2);
gmd["MESSAGE_LEVEL"] = 1;

config = EF.spac_config(gmd);
config.FEATURES.ALLOW_LEAF_REGROWTH = false;
config.FEATURES.ALLOW_LEAF_SHEDDING = false;
config.FEATURES.ALLOW_XYLEM_GROWTH = false;
config.FEATURES.EFFECTIVE_LEAF_SPECTRA = false;
config.FEATURES.ENABLE_DROUGHT_LEGACY = false;
config.FEATURES.ENABLE_REF = true;
config.FEATURES.ENABLE_SIF = true;

spac = EF.grid_spac(config, gmd);
for s in spac.soils
    s.state.θ = s.trait.vc.Θ_SAT;
end;
spac.plant.pool.c_pool = Inf;
SPAC.initialize_spac!(config, spac);

wd = GMI.grid_weather(GMI.WeatherDriverLabels(wd_tag, year), 31.5, 117.2);
wdf = EF.prepare_wdf(spac, gmd, wd; saving_dict = all_true);

EF.simulation!(config, spac, wdf; saving = "test.nc", saving_dict = all_true, selection = 4000:4240);
