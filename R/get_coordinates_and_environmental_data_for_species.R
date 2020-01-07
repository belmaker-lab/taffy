
library(spocc)
library(sdmpredictors)
library(raster)

#get environmental variables layers from Bio-oracle

rasters=load_layers(c("BO_sstmax","BO_sstmean"))

#check raster resolution 
res(rasters)

#aggregate for increasing resulution of grid cell
aggregate(rasters, fact=3)

#disaggregate for decreasing resulution of grid cell
disaggregate(rasters, fact=4)

#fact = aggregation or disaggregation factor expressed as number of cells in each direction


#get coordinates from GBIF by species name

get_sp_coords <- function(species_name, site){
  if (site == "gbif"){
    sp=occ(species_name, "gbif", has_coords=TRUE)
    
    occs <- (sp$gbif$data[[1]][,2:3])
    
    occs$species <- species_name
    return(occs)
  }
}

get_sp_coords("Diplodus sargus","gbif")
