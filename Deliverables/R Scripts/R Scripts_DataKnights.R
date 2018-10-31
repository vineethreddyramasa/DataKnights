setwd("C:/Users/ramas/Documents/ISQA 8086/R Scripts")

BandingData <- read.csv("cleanData.csv", header = TRUE, stringsAsFactors = FALSE)

# subset for Common Yellowthroat
coye <- subset(BandingData, SpeciesCode=="COYE")

# subset for Song Sparrow
sosp <- subset(BandingData, SpeciesCode=="SOSP")

# subset for Bewick's Wren 
bewr <- subset(BandingData, SpeciesCode=="BEWR")

# subset for  Bushtit 
bush <- subset(BandingData, SpeciesCode=="BUSH")

# subset for Chestnut-backed Chickadee 
cbch <- subset(BandingData, SpeciesCode=="CBCH")


# summary statistics for weight for each species
summary(coye$cleanWeight)
summary(sosp$cleanWeight)
summary(bewr$cleanWeight)
summary(bush$cleanWeight)
summary(cbch$cleanWeight)

# summary statistics for Wing to Weight Ratio for each species
summary(coye$wingToWeightRatio)
summary(sosp$wingToWeightRatio)
summary(bewr$wingToWeightRatio)
summary(bush$wingToWeightRatio)
summary(cbch$wingToWeightRatio)

library(plyr)
# Number of Birds sighted in different Habitats
count(sosp,c('Habitat'))
count(coye,c('Habitat'))
count(bewr,c('Habitat'))
count(bush,c('Habitat'))
count(cbch,c('Habitat'))

# Number of Birds sighted in different Trapsites
count(sosp,c('TrapSite'))
count(coye,c('TrapSite'))
count(bewr,c('TrapSite'))
count(bush,c('TrapSite'))
count(cbch,c('TrapSite'))

# Number of Male and Female birds spotted every year
count(sosp,c('year','sexRatio'))
count(coye,c('year','sexRatio'))
count(bewr,c('year','sexRatio'))
count(bush,c('year','sexRatio'))
count(cbch,c('year','sexRatio'))

######################################################################

#Number of sightings of Song Sparrow per month per year
count_sosp = count(sosp, c('month','year'))

#Number of sightings of Song Sparrow per year
count_sosp_year = count(sosp, c('year'))

#####################################################################

#Number of sightings of Common yellow throat per month per year
count_coye = count(coye,c('month','year'))

#Number of sightings of Common yellow throat per year
count_coye_year = count(coye,  c('year'))

######################################################################

#Number of sightings of Song Sparrow per month per year
count_bewr = count(bewr, c('month','year'))

#Number of sightings of Song Sparrow per year
count_bewr_year = count(bewr, c('year'))

######################################################################

#Number of sightings of Song Sparrow per month per year
count_bush = count(bush, c('month','year'))

#Number of sightings of Song Sparrow per year
count_bush_year = count(bush,  c('year'))

######################################################################

#Number of sightings of Song Sparrow per month per year
count_cbch = count(cbch, c('month','year'))

#Number of sightings of Song Sparrow per year
count_cbch_year = count(cbch,  c('year'))

####################################################################################################################################################

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

###################################################################################################

#mean of weights by month for each year for Song Sparrow
sosp_mean = data.frame()

for ( yr in unique(coye$year) )
{
  for ( mn in unique(coye$month) )
  {
    tmp1 = subset(sosp, year==yr & month==mn)
    mean1 = mean(tmp1$cleanWeight, na.rm=TRUE)
    sosp_mean = rbind(sosp_mean, data.frame(yr,mn, mean1))
  }
}

sosp_mean <- sosp_mean[with(sosp_mean, order(mn,yr)), ]

###################################################################################################

#mean of weights by month for each year for Bewick's Wren
bewr_mean = data.frame()

for ( yr in unique(bewr$year) )
{
  for ( mn in unique(bewr$month) )
  {
    tmp2 = subset(bewr, year==yr & month==mn)
    mean2 = mean(tmp2$cleanWeight, na.rm=TRUE)
    bewr_mean = rbind(bewr_mean, data.frame(yr,mn, mean2))
  }
}

bewr_mean <- bewr_mean[with(bewr_mean, order(mn,yr)), ]

###################################################################################################

#mean of weights by month for each year for Bushtit
bush_mean = data.frame()

for ( yr in unique(bush$year) )
{
  for ( mn in unique(bush$month) )
  {
    tmp3 = subset(bush, year==yr & month==mn)
    mean3 = mean(tmp3$cleanWeight, na.rm=TRUE)
    bush_mean = rbind(bush_mean, data.frame(yr,mn, mean3))
  }
}

bush_mean <- bush_mean[with(bush_mean, order(mn,yr)), ]


###################################################################################################

#mean of weights by month for each year for Chestnut-backed Chickadee 
cbch_mean = data.frame()

for ( yr in unique(cbch$year) )
{
  for ( mn in unique(cbch$month) )
  {
    tmp4 = subset(cbch, year==yr & month==mn)
    mean4 = mean(tmp4$cleanWeight, na.rm=TRUE)
    cbch_mean = rbind(cbch_mean, data.frame(yr,mn, mean4))
  }
}

cbch_mean <- cbch_mean[with(cbch_mean, order(mn,yr)), ]

####################################################################################################

#mean of wing to weight by month for each year for coye
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

####################################################################################################

#mean of wing to weight by month for each year for Song Sparrow
sosp_wtow_mean = data.frame()

for ( yr in unique(sosp$year) )
{
  for ( mn in unique(sosp$month) )
  {
    tmp6 = subset(sosp, year==yr & month==mn)
    mean_s_wtow = mean(tmp6$wingToWeightRatio)
    sosp_wtow_mean = rbind(sosp_wtow_mean, data.frame(yr,mn, mean_s_wtow))
  }
}

sosp_wtow_mean <- sosp_wtow_mean[with(sosp_wtow_mean, order(mn,yr)), ]

####################################################################################################

#mean of wing to weight by month for each year for Bewick's Wren
bewr_wtow_mean = data.frame()

for ( yr in unique(bewr$year) )
{
  for ( mn in unique(bewr$month) )
  {
    tmp7 = subset(bewr, year==yr & month==mn)
    mean_be_wtow = mean(tmp7$wingToWeightRatio)
    bewr_wtow_mean = rbind(bewr_wtow_mean, data.frame(yr,mn, mean_be_wtow))
  }
}

bewr_wtow_mean <- bewr_wtow_mean[with(bewr_wtow_mean, order(mn,yr)), ]

####################################################################################################

#mean of wing to weight by month for each year for Bushtit
bush_wtow_mean = data.frame()

for ( yr in unique(bush$year) )
{
  for ( mn in unique(bush$month) )
  {
    tmp8 = subset(bush, year==yr & month==mn)
    mean_bu_wtow = mean(tmp8$wingToWeightRatio)
    bush_wtow_mean = rbind(bush_wtow_mean, data.frame(yr,mn, mean_bu_wtow))
  }
}

bush_wtow_mean <- bush_wtow_mean[with(bush_wtow_mean, order(mn,yr)), ]

####################################################################################################

#mean of wing to weight by month for each year for Chestnut-backed Chickadee
cbch_wtow_mean = data.frame()

for ( yr in unique(cbch$year) )
{
  for ( mn in unique(cbch$month) )
  {
    tmp9 = subset(cbch, year==yr & month==mn)
    mean_cb_wtow = mean(tmp9$wingToWeightRatio)
    cbch_wtow_mean = rbind(cbch_wtow_mean, data.frame(yr,mn, mean_cb_wtow))
  }
}

cbch_wtow_mean <- cbch_wtow_mean[with(cbch_wtow_mean, order(mn,yr)), ]

##############################################################################################################################

detach(package:plyr)
library(dplyr)

#summary statistics based on months for coye
coye%>%
  group_by(month)%>% 
  summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))

#summary statistics based on months for sosp
sosp%>%
  group_by(month)%>% 
  summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))

#summary statistics based on months for bewr
bewr%>%
  group_by(month)%>% 
  summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))

#summary statistics based on months for bush
bush%>%
  group_by(month)%>% 
  summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))

#summary statistics based on months for cbch
cbch%>%
  group_by(month)%>% 
  summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))
  
################################################################################################################################################################################################################

#summary statistics based on years for coye
coye%>%
  group_by(year)%>% 
  summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))

#summary statistics based on years for sosp
sosp%>%
  group_by(year)%>% 
  summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))

#summary statistics based on years for bewr
bewr%>%
  group_by(year)%>% 
  summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))

#summary statistics based on years for bush
bush%>%
  group_by(year)%>% 
  summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))

#summary statistics based on years for cbch
cbch%>%
  group_by(year)%>% 
  summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))

#############################################################################################################################################################################################################3

#summary statistics based on months for coye for wingtoweight ratio
coye%>%
  group_by(month)%>% 
  summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))

#summary statistics based on months for sosp for wingtoweight ratio
sosp%>%
  group_by(month)%>% 
  summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))

#summary statistics based on months for bewr for wingtoweight ratio
bewr%>%
  group_by(month)%>% 
  summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))

#summary statistics based on months for bush for wingtoweight ratio
bush%>%
  group_by(month)%>% 
  summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))

#summary statistics based on months for cbch for wingtoweight ratio
cbch%>%
  group_by(month)%>% 
  summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))

#############################################################################################################################################################################################################3

#summary statistics based on years for coye for wingtoweight ratio
coye%>%
  group_by(year)%>% 
  summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))

#summary statistics based on years for sosp for wingtoweight ratio
sosp%>%
  group_by(year)%>% 
  summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))

#summary statistics based on years for bewr for wingtoweight ratio
bewr%>%
  group_by(year)%>% 
  summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))

#summary statistics based on years for bush for wingtoweight ratio
bush%>%
  group_by(year)%>% 
  summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))

#summary statistics based on years for cbch for wingtoweight ratio
cbch%>%
  group_by(year)%>% 
  summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))

#############################################################################################################################################################################################################3

#correlation between weight and wing length for Common Yellowthroat
coye_cor = cor(coye$cleanWeight, coye$WingLength)

#correlation between weight and wing length for Song Sparrow
sosp_cor = cor(sosp$cleanWeight, sosp$WingLength,use="complete.obs")

#correlation between weight and wing length for Bewick's Wren
bewr_cor = cor(bewr$cleanWeight, bewr$WingLength)

#correlation between weight and wing length for Bushtit
bush_cor = cor(bush$cleanWeight, bush$WingLength)

#correlation between weight and wing length for Chestnut-backed Chickadee
cbch_cor = cor(cbch$cleanWeight, cbch$WingLength)

#############################################################################################################################################################################################################3


