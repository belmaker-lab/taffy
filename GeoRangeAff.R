library(tidyverse)

# GetEnv
library(sdmpredictors)
temp <- load_layers(c("BO2_temprange_ss"), datadir = "Bio ORACLE data")

# GeoRange
library(dismo)

coords <- read_csv("coords.csv")
cov <- convHull(coords)
polygon <- polygons(cov)

class(polygon)

# convex halls (polygon) + environmental data (raster)
library(raster)
summary_gra <- raster::extract(x = temp, y = polygon) %>% as.() %>% na.omit() %>% summary()
summary_gra
