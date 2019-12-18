library(tidyverse)

coords <- read_csv("coords.csv")

library(sdmpredictors)
all_bio_layers <- list_layers(datasets = "Bio-ORACLE", marine = TRUE) %>%
  dplyr::select(layer_code, name) # to view layers names and code
temp_layers <- all_bio_layers %>% filter(stringr::str_detect(.$name, "temperature"))

temp <- load_layers(c("BO2_temprange_ss"), datadir = "Bio ORACLE data")
mean_temp <- raster::extract(temp[[1]], coords, buffer = 15000, fun = mean, df = TRUE)

plot(mean_temp)
