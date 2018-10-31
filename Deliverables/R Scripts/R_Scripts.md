R Scripts
================
Data Knights
October 31, 2018

-   [R Syntax with Description](#r-syntax-with-description)
-   [Contributorship Statement](#contributorship-statement)
-   [Proofreader](#proofreader)

------------------------------------------------------------------------

R Syntax with Description
-------------------------

1.  The Dataset used for these Scripts was generated during the Data Cleaning process from the original Dataset belonging to Coyote Creek Field Station. Some of the cleaning steps done include:
    -   The name of the cleaned Dataset used is cleanData.csv
    -   The Date Field was split into months, years during Data Cleaning for performing data analysis
    -   The Data from years 1999 and 2002 was deleted due to incomplete data.
    -   Weight outliers have been set to N/A
    -   Created a new column called "wingToWeightRatio" to perform some analyses

2.  Read the data file. The file cleanData.csv is read and stored in a Dataframe called BandingData

    ``` r
    BandingData <- read.csv("cleanData.csv", header = TRUE, stringsAsFactors = FALSE)
    ```

3.  Creating Subset Dataframes for each of the 5 Species

    ``` r
    # subset for Common Yellowthroat
    coye <- subset(BandingData, SpeciesCode=="COYE")

    # subset for Song Sparrow
    sosp <- subset(BandingData, SpeciesCode=="SOSP")

    # subset for Bewick's Wren 
    bewr <- subset(BandingData, SpeciesCode=="BEWR")

    # subset for Bushtit 
    bush <- subset(BandingData, SpeciesCode=="BUSH")

    # subset for Chestnut-backed Chickadee 
    cbch <- subset(BandingData, SpeciesCode=="CBCH")
    ```

4.  Summary Statistics for Weight of each species

    ``` r
    # summary statistics for weight for Common Yellowthroat
    summary(coye$cleanWeight)
    ```

        ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
        ##   4.500   8.800   9.300   9.328   9.700  19.000

    ``` r
    # summary statistics for weight for Song Sparrow
    summary(sosp$cleanWeight)
    ```

        ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
        ##   11.10   16.80   17.70   17.71   18.60   28.80       3

    ``` r
    # summary statistics for weight for Bewick's Wren
    summary(bewr$cleanWeight)
    ```

        ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
        ##   6.000   9.200   9.500   9.543   9.900  16.800

    ``` r
    # summary statistics for weight for Bushtit
    summary(bush$cleanWeight)
    ```

        ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
        ##   3.300   5.200   5.400   5.434   5.600  55.000

    ``` r
    # summary statistics for weight for Chestnut-backed Chickadee
    summary(cbch$cleanWeight)
    ```

        ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
        ##   5.600   9.000   9.400   9.404   9.800  19.200

5.  Summary statistics for Wing to Weight Ratio for each species

    ``` r
    # summary statistics for Wing to Weight Ratio for each Common Yellowthroat
    summary(coye$wingToWeightRatio)
    ```

        ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
        ##   2.910   5.484   5.745   5.720   5.978  15.636

    ``` r
    # summary statistics for Wing to Weight Ratio for each Song Sparrow
    summary(sosp$wingToWeightRatio)
    ```

        ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
        ##   2.118   3.149   3.280   3.286   3.427   4.955       3

    ``` r
    # summary statistics for Wing to Weight Ratio for each Bewick's Wren
    summary(bewr$wingToWeightRatio)
    ```

        ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
        ##   3.101   5.102   5.269   5.268   5.444   8.167

    ``` r
    # summary statistics for Wing to Weight Ratio for each Bushtit
    summary(bush$wingToWeightRatio)
    ```

        ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
        ##  0.8704  8.3636  8.6538  8.6089  8.8889 14.8485

    ``` r
    # summary statistics for Wing to Weight Ratio for each Chestnut-backed Chickadee
    summary(cbch$wingToWeightRatio)
    ```

        ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
        ##   2.969   6.100   6.302   6.303   6.517  10.179

6.  Count of each species of Bird sighted in different Habitats over the span of 20 years

    ``` r
    library(plyr)
    ```

    ``` r
    # Song Sparrow
    count(sosp,c('Habitat'))
    ```

        ##             Habitat freq
        ## 1 1987 Revegetation 1924
        ## 2  1993 Revegtation 2762
        ## 3   Mature Riparian 2126
        ## 4  Overflow Channel 4185

    ``` r
    # Common Yellowthroat
    count(coye,c('Habitat'))
    ```

        ##             Habitat freq
        ## 1 1987 Revegetation  766
        ## 2  1993 Revegtation  998
        ## 3   Mature Riparian  327
        ## 4  Overflow Channel 3275

    ``` r
    # Bewick's Wren
    count(bewr,c('Habitat'))
    ```

        ##             Habitat freq
        ## 1 1987 Revegetation  381
        ## 2  1993 Revegtation  717
        ## 3   Mature Riparian  380
        ## 4  Overflow Channel  325

    ``` r
    # Bushtit
    count(bush,c('Habitat'))
    ```

        ##             Habitat freq
        ## 1 1987 Revegetation  604
        ## 2  1993 Revegtation  961
        ## 3   Mature Riparian  382
        ## 4  Overflow Channel 1785

    ``` r
    # Chestnut-backed Chickadee
    count(cbch,c('Habitat'))
    ```

        ##             Habitat freq
        ## 1 1987 Revegetation  450
        ## 2  1993 Revegtation  226
        ## 3   Mature Riparian  592
        ## 4  Overflow Channel  238

7.  Count of each species of Bird sighted in different Trapsites over the span of 20 years

    ``` r
    # Number of Birds sighted in different Trapsites
    count(sosp,c('TrapSite')) # Song Sparrow
    count(coye,c('TrapSite')) # Common Yellowthroat
    count(bewr,c('TrapSite')) # Bewick's Wren
    count(bush,c('TrapSite')) # Bushtit
    count(cbch,c('TrapSite')) # Chestnut-backed Chickadee

    # Output not displayed because its too lengthy
    ```

8.  Number of Male and Female birds spotted every year

    ``` r
    # Number of Male and Female birds spotted every year
    count(sosp,c('year','sexRatio')) # Song Sparrow
    count(coye,c('year','sexRatio')) # Common Yellowthroat
    count(bewr,c('year','sexRatio')) # Bewick's Wren
    count(bush,c('year','sexRatio')) # Bushtit
    count(cbch,c('year','sexRatio')) # Chestnut-backed Chickadee

    # Output not displayed because its too lengthy
    ```

9.  Number of birds sighted per month in each year

    ``` r
    count_sosp = count(sosp, c('month','year')) # Song Sparrow
    count_coye = count(coye, c('month','year')) # Common Yellowthroat
    count_bewr = count(bewr, c('month','year')) # Bewick's Wren
    count_bush = count(bush, c('month','year')) # Bushtit
    count_cbch = count(cbch, c('month','year')) # Chestnut-backed Chickadee

    # Output not displayed because its too lengthy
    ```

10. Number of birds sighted in each year

    ``` r
    count_coye_year = count(coye, c('year')) # Common Yellowthroat
    count_sosp_year = count(sosp, c('year')) # Song Sparrow
    count_bewr_year = count(bewr, c('year')) # Bewick's Wren
    count_bush_year = count(bush, c('year')) # Bushtit
    count_cbch_year = count(cbch, c('year')) # Chestnut-backed Chickadee

    # Displaying just the output for Common Yellowthroat
    count_coye_year
    ```

        ##    year freq
        ## 1     0  334
        ## 2     1  244
        ## 3     3  313
        ## 4     4  260
        ## 5     5  296
        ## 6     6  161
        ## 7     7  162
        ## 8     8  249
        ## 9     9  318
        ## 10   10  425
        ## 11   11  254
        ## 12   12  309
        ## 13   13  383
        ## 14   14  357
        ## 15   15  339
        ## 16   16  292
        ## 17   96  226
        ## 18   97  202
        ## 19   98  242

11. Mean of weights by month for each year for Common Yellowthroat (Means for remaining species can be found in R script)

    ``` r
    #mean of weights by month for each year for Common Yellowthroat
    coye_mean = data.frame()

    for ( yr in unique(coye$year) )
    {
      for ( mn in unique(coye$month) )
      {
        tmp = subset(coye, year==yr & month==mn)
        mean = mean(tmp$cleanWeight, na.rm=TRUE)
        coye_mean = rbind(coye_mean, data.frame(yr,mn, mean))
      }
    }

    coye_mean <- coye_mean[with(coye_mean, order(mn,yr)), ]
    ```

12. Mean of wing to weight ratio by month for each year for Common Yellowthroat (Means for remaining species can be found in R script)

    ``` r
    #mean of wing to weight by month for each year for Common Yellowthroat
    coye_wtow_mean = data.frame()

    for ( yr in unique(coye$year) )
    {
      for ( mn in unique(coye$month) )
      {
        tmp5 = subset(coye, year==yr & month==mn)
        mean_c_wtow = mean(tmp5$wingToWeightRatio)
        coye_wtow_mean = rbind(coye_wtow_mean, data.frame(yr,mn, mean_c_wtow))
      }
    }

    coye_wtow_mean <- coye_wtow_mean[with(coye_wtow_mean, order(mn,yr)), ]
    ```

13. Summary statistics for weight per month (months of all years combined)

    ``` r
    detach(package:plyr)
    library(dplyr)

    #summary statistics for weight based on months for Common Yellowthroat
    coye%>%
      group_by(month)%>% 
      summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))
    ```

        ## # A tibble: 12 x 6
        ##    month  Mean   Max   Min Median   Std
        ##    <int> <dbl> <dbl> <dbl>  <dbl> <dbl>
        ##  1     1  9.07  10.7   7.6   9.05 0.628
        ##  2     2  8.91  10.5   7.5   8.9  0.522
        ##  3     3  9.33  13.7   7.9   9.2  0.762
        ##  4     4  9.70  12.5   7.2   9.6  0.768
        ##  5     5  9.53  19     4.5   9.5  0.810
        ##  6     6  9.29  18.9   7.4   9.3  0.688
        ##  7     7  9.31  15.6   7.6   9.3  0.698
        ##  8     8  9.08  12.8   7.6   9    0.618
        ##  9     9  9.29  15.4   5.5   9.1  0.975
        ## 10    10  9.23  13.6   7.6   9    1.03 
        ## 11    11  8.9   12.3   7.3   8.9  0.670
        ## 12    12  9.02  11.5   7.9   9    0.717

    ``` r
    #summary statistics for weight based on months for Song Sparrow
    sosp%>%
      group_by(month)%>% 
      summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))

    #summary statistics for weight based on months for Bewick's Wren
    bewr%>%
      group_by(month)%>% 
      summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))

    #summary statistics for weight based on months for Bushtit
    bush%>%
      group_by(month)%>% 
      summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))

    #summary statistics for weight based on months for Chestnut-backed Chickadee
    cbch%>%
      group_by(month)%>% 
      summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))
    ```

14. Summary statistics for weight per year

    ``` r
    detach(package:plyr)
    library(dplyr)
    #summary statistics for weight based on years for Common Yellowthroat
    coye%>%
      group_by(year)%>% 
      summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))
    ```

        ## # A tibble: 19 x 6
        ##     year  Mean   Max   Min Median   Std
        ##    <int> <dbl> <dbl> <dbl>  <dbl> <dbl>
        ##  1     0  9.33  12.7   7.7   9.3  0.771
        ##  2     1  9.42  15.2   7.7   9.25 0.949
        ##  3     3  9.29  12.1   7.9   9.2  0.715
        ##  4     4  9.36  19     7.4   9.3  1.02 
        ##  5     5  9.39  16.2   8     9.3  0.824
        ##  6     6  9.28  11.7   7.5   9.3  0.643
        ##  7     7  9.36  15.1   7.6   9.3  0.831
        ##  8     8  9.20  12.5   7.4   9.2  0.658
        ##  9     9  9.34  13     7.7   9.3  0.761
        ## 10    10  9.37  15.6   7.7   9.4  0.771
        ## 11    11  9.30  12.9   7.6   9.2  0.683
        ## 12    12  9.31  13     7.2   9.3  0.706
        ## 13    13  9.20  12.9   7.3   9.2  0.693
        ## 14    14  9.24  11.8   7.5   9.2  0.679
        ## 15    15  9.29  12.2   7.7   9.3  0.667
        ## 16    16  9.17  11.3   7.6   9.2  0.589
        ## 17    96  9.38  11.6   4.5   9.3  0.834
        ## 18    97  9.61  13.6   5.5   9.35 1.01 
        ## 19    98  9.57  18.9   7.6   9.4  1.24

    ``` r
    #summary statistics for weight based on years for Song Sparrow
    sosp%>%
      group_by(year)%>% 
      summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))

    #summary statistics for weight based on years for Bewick's Wren
    bewr%>%
      group_by(year)%>% 
      summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))

    #summary statistics for weight based on years for Bushtitbush
    bush%>%
      group_by(year)%>% 
      summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))

    #summary statistics for weight based on years for Chestnut-backed Chickadee
    cbch%>%
      group_by(year)%>% 
      summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))
    ```

15. Summary statistics for Wing to Weight Ratio per month (months of all years combined)

    ``` r
    detach(package:plyr)
    library(dplyr)
    #summary statistics based on months for Common Yellowthroat for wingtoweight ratio
    coye%>%
      group_by(month)%>% 
      summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))
    ```

        ## # A tibble: 12 x 6
        ##    month  Mean   Max   Min Median   Std
        ##    <int> <dbl> <dbl> <dbl>  <dbl> <dbl>
        ##  1     1  5.96  6.97  4.95   5.91 0.385
        ##  2     2  6.03  6.93  5.24   5.98 0.301
        ##  3     3  5.84  6.74  3.87   5.87 0.397
        ##  4     4  5.54  6.93  4.13   5.59 0.412
        ##  5     5  5.59 12.4   2.95   5.64 0.469
        ##  6     6  5.67  7.07  2.91   5.68 0.346
        ##  7     7  5.65  9.18  3.53   5.64 0.402
        ##  8     8  5.85  7.24  4.26   5.88 0.367
        ##  9     9  5.80 15.6   3.36   5.86 0.631
        ## 10    10  5.82  7.38  4.19   5.93 0.534
        ## 11    11  6.00  7.26  4.63   5.97 0.389
        ## 12    12  5.88  6.79  4.78   5.93 0.379

    ``` r
    #summary statistics based on months for Song Sparrow for wingtoweight ratio
    sosp%>%
      group_by(month)%>% 
      summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))

    #summary statistics based on months for Bewick's Wren for wingtoweight ratio
    bewr%>%
      group_by(month)%>% 
      summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))

    #summary statistics based on months for Bushtit for wingtoweight ratio
    bush%>%
      group_by(month)%>% 
      summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))

    #summary statistics based on months for Chestnut-backed Chickadee for wingtoweight ratio
    cbch%>%
      group_by(month)%>% 
      summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))
    ```

16. Summary statistics for Wing to weight ratio per year

    ``` r
    detach(package:plyr)
    library(dplyr)

    #summary statistics based on years for Common Yellowthroat for wingtoweight ratio
    coye%>%
      group_by(year)%>% 
      summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))
    ```

        ## # A tibble: 19 x 6
        ##     year  Mean   Max   Min Median   Std
        ##    <int> <dbl> <dbl> <dbl>  <dbl> <dbl>
        ##  1     0  5.72  6.71  4.33   5.74 0.402
        ##  2     1  5.68  6.75  3.36   5.75 0.469
        ##  3     3  5.73  7.12  4.48   5.73 0.418
        ##  4     4  5.72  6.76  2.95   5.74 0.484
        ##  5     5  5.67  6.62  3.40   5.73 0.410
        ##  6     6  5.73  7.38  4.48   5.75 0.408
        ##  7     7  5.71  7.05  3.77   5.74 0.434
        ##  8     8  5.76  6.76  4.64   5.76 0.367
        ##  9     9  5.70  6.71  4      5.70 0.403
        ## 10    10  5.68  6.75  3.53   5.68 0.419
        ## 11    11  5.72  6.97  3.88   5.74 0.418
        ## 12    12  5.73  6.88  4      5.73 0.407
        ## 13    13  5.77  7.27  3.88   5.80 0.411
        ## 14    14  5.79  6.93  4.49   5.81 0.398
        ## 15    15  5.76  6.94  4.26   5.79 0.396
        ## 16    16  5.81  6.97  4.78   5.81 0.344
        ## 17    96  5.68 12.4   4.55   5.69 0.653
        ## 18    97  5.63 15.6   4.19   5.65 0.868
        ## 19    98  5.63  7.24  2.91   5.74 0.571

    ``` r
    #summary statistics based on years for Song Sparrow for wingtoweight ratio
    sosp%>%
      group_by(year)%>% 
      summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))

    #summary statistics based on years for Bewick's Wren for wingtoweight ratio
    bewr%>%
      group_by(year)%>% 
      summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))

    #summary statistics based on years for Bushtit for wingtoweight ratio
    bush%>%
      group_by(year)%>% 
      summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))

    #summary statistics based on years for Chestnut-backed Chickadee for wingtoweight ratio
    cbch%>%
      group_by(year)%>% 
      summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))
    ```

17. Correlation between Weight and Wing length for each species

    ``` r
    #correlation between weight and wing length for Common Yellowthroat
    coye_cor = cor(coye$cleanWeight, coye$WingLength)
    coye_cor
    ```

        ## [1] 0.2834094

    ``` r
    #correlation between weight and wing length for Song Sparrow
    sosp_cor = cor(sosp$cleanWeight, sosp$WingLength,use="complete.obs")
    sosp_cor
    ```

        ## [1] 0.4907241

    ``` r
    #correlation between weight and wing length for Bewick's Wren
    bewr_cor = cor(bewr$cleanWeight, bewr$WingLength)
    bewr_cor
    ```

        ## [1] 0.3648109

    ``` r
    #correlation between weight and wing length for Bushtit
    bush_cor = cor(bush$cleanWeight, bush$WingLength)
    bush_cor
    ```

        ## [1] 0.04793779

    ``` r
    #correlation between weight and wing length for Chestnut-backed Chickadee
    cbch_cor = cor(cbch$cleanWeight, cbch$WingLength)
    cbch_cor
    ```

        ## [1] 0.427438

Contributorship Statement
-------------------------

Our contributions made to this dataset include analysis on various aspects using R scripts. We made sure that the data was thoroughly cleaned before working on it further. We agree to be held responsible for our work with this dataset.

Vineeth Reddy and Aishwarya Reddy met and discussed the research parts that could be analyzed using R scripts. As suggested by our clients, we worked on five species – Song Sparrow, Common Yellowthroat, Bewick’s Wren, Bushtit and Chestnut-backed Chickadee. We have performed analysis using R scripts for the following, a summary statistics for weight for all 5 species – per month of all years combined and also per year, a summary statisticcs for the wing to weight ratio for all 5 species – per month of all years combined and also per year, the mean of wing to weight ratio by month for each year for all 5 species, number of birds sighted – per month and in each year, number of male and female birds spotted every year, number of birds sighted based on their habitats and trap-sites, the correlation between wing length and weight was also observed for all 5 species. We have made various observations from all the results obtained by the above calculations and analysis. 

All the calculations were done by Vineeth and Aishwarya. The final document was proofrad by Aishwarya.

Proofreader
-----------

Aishwarya J Reddy has proofread the document. 
