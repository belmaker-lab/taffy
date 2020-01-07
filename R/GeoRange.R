library(dismo)
# `coords` = from GetCoords stage

convex_hull <- convHull(coords)
polygon <- polygons(convex_hull)

# alpha hulls?
