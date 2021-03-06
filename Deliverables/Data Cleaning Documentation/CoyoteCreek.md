Data Cleaning Document
================
Data Knights
October 16, 2018

-   [Data Cleaning Documentation](#data-cleaning-documentation)
    -   [Description of the Data Source](#description-of-the-data-source)
    -   [Intellectual Policy Constraints](#intellectual-policy-constraints)
    -   [Description of the Meta Data](#description-of-the-meta-data)
    -   [Issues Encountered within the Data](#issues-encountered-within-the-data)
    -   [Data Remediation](#data-remediation)
    -   [R Syntax with Step-by-Step Description](#r-syntax-with-step-by-step-description)
    -   [Contributorship Statement](#contributorship-statement)
    -   [Proofreader](#proofreader)

------------------------------------------------------------------------

Data Cleaning Documentation
===========================

Description of the Data Source
------------------------------

The Data set consists of Bird Banding Data at Coyote Creek Field Station (CCFS) over the span of 20 years from 1996 to 2016. It consists of information such as Banding Number which is a unique number given to each bird, the different capture dates of the birds and various demographic details about the birds captured at CCFS. There are total 78642 records collected and each record contains 25 columns. There are a total of 1154 species of Birds in the Data set, we are planning to consider the data of 2 species which are of interest to the client. Some of the important columns which we are considering for our analysis are as follows:

-   Band Number
-   Capture Date
-   First Capture Date
-   Last Capture Date
-   Capture Type
-   Species Code
-   Age
-   Sex
-   Trapsite
-   Fat
-   BroodPatch
-   CloacalProtuberance
-   WingMolt
-   PrimaryWear
-   WingLength
-   Weight

We have access to supporting Meta Data Files files which help us understanding certain Codes within the main Data set. We also have a Data set indicating the Trap hours i.e. the operating hours of the trap sites over the past 20 years.

Intellectual Policy Constraints
-------------------------------

The CCFS Bird Banding Dataset is owned by San Fransisco Bay Bird Observatory and we have been granted the permission to maintain an electronic copy of this dataset for analysis. This Data set can be uploaded to a publicly accessible repository on GitHub for collaborative data analysis purposes but should not be made available for use by third parties. SFBBO reserves the right to request that these data be moved into a private repository on GitHub at any time.

The results of the analysis can be used for inclusion in a professional portfolio but should not be published in any popular article or scientific manuscript without the permission of SFBBO. The data must be removed from all the sources upon the termination of the Data Sharing Agreement. This agreement is valid for the duration of the course, "From Data to Decisions".

Note: All this information has been fully extracted from the "Data Sharing Agreement".

Description of the Meta Data
----------------------------

This is a complete Bird Banding Data at CCFS over the past 20 years.The dataset contains various details collected when a bird is trapped in one of the trap sites. Meta Data about various fields is as follows:

-   **Band Number** is the a unique number given to each bird when they are first captured. It helps to identify each bird uniquely.<br/>
-   **Capture Date** is the date on which the bird was captured **First Captured Date** and **Last Captured Date** gives the first and last encounter date for the individual bird. **Capture Type** enables us to know if it is a newly captured bird or a returning bird. <br/>
-   **Species Code** is a unique code given to each species. (We are planning to replace this field with species name to avoid any confusion) <br/>
-   **Trap site** gives us the details about the site in which the bird was captured.
-   **Age**, **Sex**, **Fat**, **Weight** gives us the details of age, sex, fat stored in the furcular hollow of the birds body and Mass of the bird in grams respectively.<br/>
-   **BroodPatch** and **CloacalProtuberance** are the female and male breeding characteristics respectively. <br/>
-   **WingMolt** identifies molting feathers in the wing and tail of the bird.<br/>
-   **PrimaryWear** is the amount of wear in the wing feather tips.<br/>
-   **WingLength** is the length of the wing of the bird when captured in millimeters.

Issues Encountered within the Data
----------------------------------

From our Bird Banding data, we are using the "Data Banding Records" sheet for our data analysis. This data sheet has some missing values that we have eliminated in our data cleaning process. The data sheet has data from 1996-2016 and the data from 1999, 2002 has majority of the missing values as well as less data compared to the data from other years. So, for our analysis we will not be considering the data from the years 1999 and 2002.

According to our client, they are more interested in two specific species. Since the variety of species in the client's data is extremely vast, for our analysis we will use the two species mentioned by our client and if possible we will add a few more species later. The two species mentioned by our client are **Song Sparrow** and **Common Yellowthroat**. So, the data for other species will not be considered during our analysis. We also removed some columns that we do not need for our analysis and we will replace the shortforms or codes with their original names using the information from the given metadata sheets.

Major issues include:

-   Both 1999 and 2002 have missing records in the beginning of each year.
-   The coded values are too granular, which causes small n-sizes and uneven categories.
-   R natively reads the “-“ character instead of classifying as NA.
-   Several records from the weight column appear to be data entry errors with many standard deviations above sample norms.
-   Many of the bird attributes have missing data in the earlier years.

Data Remediation
----------------

Both 1999 and 2002 were removed, because our analysis will rely heavily on seasonal trends, which would be impacted by the months of missing data in these years. Attributes were recoded to either two or three categories, which helps sample sizes for trend analysis and future visual encoding decisions with fewer color representations. Weight observations that appeared to be data entry errors were replaced with NA. NA values were reentered into the data where the dash character was found. These data records were not removed, because the main frequency metrics and trends were not impacted by this issue.

R Syntax with Step-by-Step Description
--------------------------------------

1.  Remove meta tab and transform Excel files into .csv files (Completed outside of R)
    -   Metadata Trap.xlsx changes to habitat.csv
    -   Data BandingRecords 1996-2016.xslx changes to BandingRecords

2.  Read two data files

        habitat <- read.csv("C:/Users/ramas/Documents/ISQA 8086/Coyote Creek/Data and Metadata/habitat.csv")
        BandingRecords <- read.csv("C:/Users/ramas/Documents/ISQA 8086/Coyote Creek/Data and Metadata/BandingRecords.csv")

3.  Remove unneeded columns

        FilterVariables <- subset(BandingRecords, select=c("RowID","SpeciesCode", "BandNumber","CaptureDate","FirstCaptureDate","LastCaptureDate", "CaptureType","Age", "Sex", "TrapSite", "Fat", "BroodPatch", "CloacalProtuberance", "WingMolt", "PrimaryWear", "WingLength", "Weight"))

4.  Split date column

        dateBlock <- unlist(strsplit(as.character(FilterVariables$CaptureDate),"/"))

5.  Create year column

        yearBlock <- dateBlock[seq(3,length(dateBlock),3)]
        yearBlockClean <- substr(yearBlock,1,2)
        FilterVariables$year <- yearBlockClean

6.  Create month column

        monthBlock <- dateBlock[seq(1,length(dateBlock),3)]
        FilterVariables$month <- monthBlock

7.  Filter out years 1999 and 2002 due to incomplete data

        FilterData <- FilterVariables[FilterVariables$year != "99",]
        FilterData <- FilterData[FilterData$year != "02",]

8.  Create new data frame for recoding

        CleanedBirdData <- FilterData

9.  Create sosp column

        CleanedBirdData$sosp[CleanedBirdData$SpeciesCode == "SOSP"] <- 1
        CleanedBirdData$sosp[is.na(CleanedBirdData$sosp)] <- 0

10. Create coye column

        CleanedBirdData$coye[CleanedBirdData$SpeciesCode == "COYE"] <- 1
        CleanedBirdData$coye[is.na(CleanedBirdData$coye)] <- 0

11. Create ageRecode column with recoded values

        CleanedBirdData$ageRecode[CleanedBirdData$Age == 2] <- 0
        CleanedBirdData$ageRecode[CleanedBirdData$Age == 1] <- 1
        CleanedBirdData$ageRecode[CleanedBirdData$Age > 4] <- 1

12. Create sexRecode column with recoded values

        CleanedBirdData$sexRecode[CleanedBirdData$Sex == "M"] <- 1
        CleanedBirdData$sexRecode[CleanedBirdData$Sex == "F"] <- 0

13. Create fatRecode column with recoded values

        CleanedBirdData$fatRecode[CleanedBirdData$Fat == "0"] <- 0
        CleanedBirdData$fatRecode[CleanedBirdData$Fat == "1"] <- 1
        CleanedBirdData$fatRecode[CleanedBirdData$Fat == "2"] <- 1
        CleanedBirdData$fatRecode[CleanedBirdData$Fat == "3"] <- 2
        CleanedBirdData$fatRecode[CleanedBirdData$Fat == "4"] <- 2
        CleanedBirdData$fatRecode[CleanedBirdData$Fat == "5"] <- 2
        CleanedBirdData$fatRecode[CleanedBirdData$Fat == "6"] <- 2
        CleanedBirdData$fatRecode[CleanedBirdData$Fat == "7"] <- 2

14. Create broodRecode column with recoded values

        CleanedBirdData$broodRecode[CleanedBirdData$BroodPatch == "0"] <- 0
        CleanedBirdData$broodRecode[is.na(CleanedBirdData$broodRecode)] <- 1
        CleanedBirdData$broodRecode[CleanedBirdData$BroodPatch == "-"] <- NA

15. Create cloacalRecode with recoded values

        CleanedBirdData$cloacalRecode[CleanedBirdData$CloacalProtuberance == "0"] <- 0
        CleanedBirdData$cloacalRecode[is.na(CleanedBirdData$cloacalRecode)] <- 1
        CleanedBirdData$cloacalRecode[CleanedBirdData$CloacalProtuberance == "-"] <- NA

16. Create moltRecode with recoded values

        CleanedBirdData$moltRecode[CleanedBirdData$WingMolt == "0"] <- 0
        CleanedBirdData$moltRecode[CleanedBirdData$WingMolt == "S"] <- 1
        CleanedBirdData$moltRecode[CleanedBirdData$WingMolt == "A"] <- 1

17. Create wearRecode with recoded values

        CleanedBirdData$wearRecode[CleanedBirdData$PrimaryWear == "0"] <- 0
        CleanedBirdData$wearRecode[CleanedBirdData$PrimaryWear == "1"] <- 1
        CleanedBirdData$wearRecode[CleanedBirdData$PrimaryWear == "2"] <- 1
        CleanedBirdData$wearRecode[CleanedBirdData$PrimaryWear == "3"] <- 2
        CleanedBirdData$wearRecode[CleanedBirdData$PrimaryWear == "4"] <- 2
        CleanedBirdData$wearRecode[CleanedBirdData$PrimaryWear == "5"] <- 2

18. Remove replace SOSP weight outliers with NA

        CleanedBirdData$cleanWeight[CleanedBirdData$Weight > 40 & CleanedBirdData$SpeciesCode == "SOSP"] <- NA

19. Create wingToWeightRatio Column

        CleanedBirdData$wingToWeightRatio <- CleanedBirdData$WingLength / CleanedBirdData$cleanWeight

20. Left join BandingData and Habitat on TrapSite

        fullData <- merge(x = CleanedBirdData, y = habitat, by = "TrapSite", all.x = TRUE)

21. Remove unnecessary columns from the Habitat file

        FullDataFilter <- subset(fullData, select=c("RowID.x","SpeciesCode", "BandNumber","CaptureDate","FirstCaptureDate","LastCaptureDate", "CaptureType","Age", "Sex", "TrapSite", "Fat", "BroodPatch", "CloacalProtuberance", "WingMolt", "PrimaryWear", "WingLength", "Weight", "year", "month", "sosp", "coye", "ageRecode", "sexRecode", "fatRecode", "broodRecode", "cloacalRecode", "moltRecode", "wearRecode", "cleanWeight", "wingToWeightRatio", "Habitat"))

22. (Optional) If desired, remove all observations with at least one null value

        FullDataRemoveNA <- FullDataFilter[complete.cases(FullDataFilter), ]

Contributorship Statement
-------------------------

We made substantial contributions to this dataset by addressing several data quality issues and by preparing the data to be ready for future statistical and visualization work. We made important decisions throughout this process to ensure data accuracy, which our future analysis and visualization work will rely on. We agree to be held responsible for the accuracy of our work.

Vineeth Reddy and David Krupp met to discuss the data issues that needed to be addressed, and how to organize the data to better support our project’s research questions. Following additional study, Vineeth authored several sections regarding the data source details and metadata information. David tested and documented numerous lines of R syntax to help improve several data quality issues and to prepare the data for future analytical work. Aishwarya updated some of the issues and proofread the final deliverable.

Proofreader
-----------

-   Aishwarya J Reddy has proofread the document.
