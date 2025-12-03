#######################################################################################################################################################################################################
#
# Changes to this function
# General
#     2024-Aug-06: isolate the function to prepare the DataFrame for the WDF
#     2025-Jun-03: add function chunk to save Φ_D and Φ_N
#     2025-Sep-09: add functions chunk to compute the heat fluxes
#     2025-Nov-03: save the shortwave and longwave outgoing radiation if requested
#
#######################################################################################################################################################################################################
"""

    prepare_wdf(spac::BulkSPAC{FT}, df::DataFrame; saving_dict::Dict{String,Any} = SAVING_DICT) where {FT}

Prepare the DataFrame for the WDF by adding the fields to store the outputs, given
- `spac::BulkSPAC{FT}`: the SPAC model
- `df::DataFrame`: the DataFrame to store the outputs
- `saving_dict::Dict{String,Any}`: the dictionary to store the settings for saving the outputs

"""
function prepare_wdf end;

prepare_wdf(spac::BulkSPAC{FT}, gmd::Dict, wd::Dict; saving_dict::Dict{String,Any} = SAVING_DICT) where {FT} = (
    wd["CO2"    ] = resample(gmd["CO2"        ], "1H", gmd["YEAR"]);
    wd["CHL"    ] = resample(gmd["CHLOROPHYLL"], "1H", gmd["YEAR"]);
    wd["CI"     ] = resample(gmd["CLUMPING"   ], "1H", gmd["YEAR"]);
    wd["LAI"    ] = resample(gmd["LAI"        ], "1H", gmd["YEAR"]);
    wd["VCMAX25"] = resample(gmd["VCMAX25"    ], "1H", gmd["YEAR"]);

    # add the new fields to the DataFrame
    for label in new_col_names(spac, saving_dict)
        wd[label] = zeros(FT,length(wd["FDOY"])) .* FT(NaN);
    end;

    # convert the DataFrame to NamedTuple
    return NamedTuple{Tuple(Symbol.(keys(wd)))}(Tuple([wd[k] for k in keys(wd)]));
);

prepare_wdf(spac::BulkSPAC{FT}, gmd::Dict, df::DataFrame; saving_dict::Dict{String,Any} = SAVING_DICT) where {FT} = (
    # add the new fields to the DataFrame
    for label in new_col_names(spac, saving_dict)
        df[!,label] .= NaN;
    end;

    # convert the DataFrame to NamedTuple
    return NamedTuple{Tuple(Symbol.(names(df)))}(Tuple([df[:,n] for n in names(df)]));
);




new_col_names(spac::BulkSPAC{FT}, saving_dict::Dict{String,Any}) where {FT} = (
    # add the fields to store outputs
    new_wdf_cols = String[];
    if saving_dict["MOD_SWC"]
        for i in eachindex(spac.soils)
            push!(new_wdf_cols, "MOD_SWC_$i");
            push!(new_wdf_cols, "MOD_SWC_ICE_$i");
        end;
    end;
    if saving_dict["MOD_P_SOIL"]
        for i in eachindex(spac.soils)
            push!(new_wdf_cols, "MOD_P_SOIL_$i");
        end;
    end;
    if saving_dict["MOD_T_SOIL"]
        for i in eachindex(spac.soils)
            push!(new_wdf_cols, "MOD_T_SOIL_$i");
        end;
    end;
    if saving_dict["MOD_T_LEAF"]
        for i in eachindex(spac.plant.leaves)
            push!(new_wdf_cols, "MOD_T_LEAF_$i");
        end;
    end;
    if saving_dict["MOD_T_MMM"]
        push!(new_wdf_cols, "MOD_T_L_MAX");
        push!(new_wdf_cols, "MOD_T_L_MEAN");
        push!(new_wdf_cols, "MOD_T_L_MIN");
    end;
    if saving_dict["MOD_P_LEAF"]
        for i in eachindex(spac.plant.leaves)
            push!(new_wdf_cols, "MOD_P_LEAF_$i");
        end;
    end;
    if saving_dict["MOD_P_MMM"]
        push!(new_wdf_cols, "MOD_P_L_MAX");
        push!(new_wdf_cols, "MOD_P_L_MEAN");
        push!(new_wdf_cols, "MOD_P_L_MIN");
    end;
    if saving_dict["MOD_ΦDΦN"]
        push!(new_wdf_cols, "ΦD");
        push!(new_wdf_cols, "ΦN");
    end;
    if saving_dict["MOD_ΦFΦP"]
        push!(new_wdf_cols, "ΦF");
        push!(new_wdf_cols, "ΦP");
    end;
    if saving_dict["MOD_HEAT"]
        push!(new_wdf_cols, "MOD_LATENT_HEAT");
        push!(new_wdf_cols, "MOD_SENSIBLE_HEAT");
        push!(new_wdf_cols, "MOD_NET_LONGWAVE");
        push!(new_wdf_cols, "MOD_NET_SHORTWAVE");
        push!(new_wdf_cols, "MOD_LONGWAVE_OUT");
        push!(new_wdf_cols, "MOD_SHORTWAVE_OUT");
    end;
    # if the label does not contain MOD_ prefix
    for label in keys(saving_dict)
        if !occursin("MOD_", label)
            if saving_dict[label]
                push!(new_wdf_cols, label);
            end;
        end;
    end;

    return new_wdf_cols
);
