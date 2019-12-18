library(spocc)
library(sdmpredictors)

#get environmental variables layers from Bio-oracle

load_layers(c("BO_sstmax","BO_sstmean"))

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
