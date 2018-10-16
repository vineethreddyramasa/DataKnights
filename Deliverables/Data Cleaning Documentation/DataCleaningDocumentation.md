# Data Cleaning Documentation

## Description of the Data Source
The Data set consists of Bird Banding Data at Coyote Creek Field Station (CCFS) over the span of 20 years from 1996 to 2016. It consists of information such as Banding Number which is a unique number given to each bird, the different capture dates of the birds and various demographic details about the birds captured at CCFS. There are total 78642 records collected and each record contains 25 columns. There are a total of 1154 species of Birds in the Data set, we are planning to consider the data of 3 species which are of interest to the client. Some of the important columns which we are considering for our analysis are as follows:
* Band Number
* Capture Date
* First Capture Date
* Last Capture Date
* Capture Type
* Species 
* Age
* Sex
* Trapsite
* Fat
* BroodPatch
* CloacalProtuberance
* WingMolt
* PrimaryWear
* WingLength 
* Weight

We have access to supporting Meta Data Files files which help us understanding certain Codes within the main Data set. We also have a Data set indicating the Trap hours i.e. the operating hours of the trap sites over the past 20 years. We are planning to consider the data from the year 2002 as there has been a significant change in data collection pattern from that year.

## Intellectual Policy Constraints

The CCFS Bird Banding Dataset is owned by San Fransisco Bay Bird Observatory and we have been granted the permission to maintain an electronic copy of this dataset for analysis. This Data set can be uploaded to a publicly accessible repository on GitHub for collaborative data analysis purposes but should not be made available for use by third parties. SFBBO reserves the right to request that these data be moved into a private repository on GitHub at any time.

The results of the analysis can be used for inclusion in a professional portfolio but should not be published in any popular article or scientific manuscript without the permission of SFBBO. The data must be removed from all the sources upon the termination of the Data Sharing Agreement. This agreement is valid for the duration of the course, "From Data to Decisions".

Note: All this information has been fully extracted from the "Data Sharing Agreement". 

## Description of the Meta Data

This is a complete Bird Banding Data at CCFS over the past 20 years.The dataset contains various details collected when a bird is trapped in one of the trap sites. Meta Data about various fields is as follows:
