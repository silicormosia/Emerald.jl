import Emerald.Land as LAND
import Emerald.SPAC as SPAC
import GriddingMachine.Indexer as GMI


gm_tag = "gm2";
wd_tag = "wd1";
year = 2019;

gmd = GMI.grid_dict(GMI.LandDatasetLabels(gm_tag, year), 31.5, 117.2);
gmd["MESSAGE_LEVEL"] = 1;
wd = GMI.grid_weather(GMI.WeatherDriverLabels(wd_tag, year), 31.5, 117.2);

config = LAND.site_config(gmd);
spac = LAND.site_spac(config, gmd);
driver = LAND.site_driver_tuple(gmd, wd);
results = LAND.site_result_tuple(spac, wd, LAND.parameters_to_save());
LAND.simulation!(config, spac, driver, results; saving = "test.nc", saving_dict = LAND.parameters_to_save(), selection = 4000:4240);
