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
summary_gra <- raster::extract(x = temp, y = polygon) %>% as.() %>% na.omit()
gra_mean <- mean(summary_gra$BO2_temprange_ss)
gra_med <- median(summary_gra)
gra_mode <- mode(summary_gra)
gra_quant25 <- quantile(summary_gra)