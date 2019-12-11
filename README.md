# taffy
## Species affinity to environmental conditions (e.g. temperature)

### Code breakdown

1. **GetCoords**: Download data from [GBIF](https://www.gbif.org/) and [OBIS](https://obis.org/) | *Ori and Sarah*
   - download coordinate data by species
   - clean data [bdclean](https://bd-r.github.io/bdclean-guide/)
   - input: species list
   - output: coordinates dataframe
  
2. **FishBase data**: Load data from FishBase | *Shahar*
   - package [rfishbase](https://github.com/ropensci/rfishbase)
   - input: species names list
   - output: temperature range (preferred) + user requirements

3. **GetEnv**: Load environmental data (e.g. temperature) from [Bio-ORACLE](http://www.bio-oracle.org/code.php) and [GMED](http://gmed.auckland.ac.nz/) | *Ori and Sarah*
   - input: Define a resolution and extent.
   - Load environmental layers

4. **GrossAff** - Gross affinity from GBIF data | *Dvora*
   - input – overlay GetCoords + GetEnv
   - output: summary statistics (mean, median, mode, quantiles, SD, range, etc.)

5. **GeoRange**: Estimate geographical range | *Yoni*
   - Create a grid by resolution from GetEnv
   - input: GetCoords, Fishbase data
   - Create convex hulls
   - Create alpha hulls (set smoothness) - Make sure n is sufficient; Overlay with land data and mask with depth

6. **GeoRangeAff**: Affinity by geographical range | *Shira*
   - input – GetEnv + GeoReange
   - output – summary statistics (mean, median, mode, quantiles, SD, range, Probabilities by degrees)

7. **SDMaff** Affinity by SDM | *Itai G. and Yoni*
   - input: GetCoords + GetEnv
   - Define pseudoabsences ([mopa package](https://www.rdocumentation.org/packages/mopa/versions/1.0.1))
   - Spatial thining
   - Create SDM (most recent package)
   - Summary statistics (mean, median, mode, quantiles, SD, range, probability by degrees)

8. **Cheung affinity** | *Dvora and Daphna*
   – From [Cheung's paper](https://www.nature.com/articles/nature12156)


