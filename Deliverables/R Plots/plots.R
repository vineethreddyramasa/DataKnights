#Setting the Working Directory
setwd("C:/Users/ramas/Documents/ISQA 8086/R Plots")

#Reading the csv file and loading it in a Data Frame
BandingData <- read.csv("cleanData.csv", header = TRUE, stringsAsFactors = FALSE)

#Recoding year
BandingData$year[BandingData$year == 0] <- 2000
BandingData$year[BandingData$year == 1] <- 2001
BandingData$year[BandingData$year == 3] <- 2003
BandingData$year[BandingData$year == 4] <- 2004
BandingData$year[BandingData$year == 5] <- 2005
BandingData$year[BandingData$year == 6] <- 2006
BandingData$year[BandingData$year == 7] <- 2007
BandingData$year[BandingData$year == 8] <- 2008
BandingData$year[BandingData$year == 9] <- 2009
BandingData$year[BandingData$year == 10] <- 2010
BandingData$year[BandingData$year == 11] <- 2011
BandingData$year[BandingData$year == 12] <- 2012
BandingData$year[BandingData$year == 13] <- 2013
BandingData$year[BandingData$year == 14] <- 2014
BandingData$year[BandingData$year == 15] <- 2015
BandingData$year[BandingData$year == 16] <- 2016
BandingData$year[BandingData$year == 96] <- 1996
BandingData$year[BandingData$year == 97] <- 1997
BandingData$year[BandingData$year == 98] <- 1998

# Creating subset for Common Yellowthroat species
coye <- subset(BandingData, SpeciesCode=="COYE")

# Creating subset for Song Sparrow species
sosp <- subset(BandingData, SpeciesCode=="SOSP")

# Creating subset for Bewick's Wren species
bewr <- subset(BandingData, SpeciesCode=="BEWR")

# Creating subset for  Bushtit species
bush <- subset(BandingData, SpeciesCode=="BUSH")

# Creating subset for Chestnut-backed Chickadee species 
cbch <- subset(BandingData, SpeciesCode=="CBCH")



library(plyr)

# Number of Male and Female birds spotted every year
sosp_count_year=count(sosp,c('year','sexRatio'))
coye_count_year=count(coye,c('year','sexRatio'))
bewr_count_year=count(bewr,c('year','sexRatio'))
bush_count_year=count(bush,c('year','sexRatio'))
cbch_count_year=count(cbch,c('year','sexRatio'))

# comparision of gender ratio
library(tidyr)
library(ggplot2)


######################################################################################
# Change in the Sex Ratio of Different species over the years

sosp_count_year$sexRatio[sosp_count_year$sexRatio == 0] <- "F"
sosp_count_year$sexRatio[sosp_count_year$sexRatio == 1] <- "M"


ggplot(data=sosp_count_year, aes(x=year, y=freq, fill=sexRatio)) +
  geom_bar(stat="identity", position=position_dodge())+xlab("Year")+ylab("Count")+
  labs(title="Change in Sex Ratio of Song Sparrow",fill="Sex")+
  theme(plot.title = element_text(hjust = 0.5))


########################################################################################

coye_count_year$sexRatio[coye_count_year$sexRatio == 0] <- "F"
coye_count_year$sexRatio[coye_count_year$sexRatio == 1] <- "M"

ggplot(data=coye_count_year, aes(x=year, y=freq, fill=sexRatio)) +
  geom_bar(stat="identity", position=position_dodge())+xlab("Year")+ylab("Count")+
  labs(title="Change in Sex Ratio of Common Yellowthroat",fill="Sex")+
  theme(plot.title = element_text(hjust = 0.5))

######################################################################################

bewr_count_year$sexRatio[bewr_count_year$sexRatio == 0] <- "F"
bewr_count_year$sexRatio[bewr_count_year$sexRatio == 1] <- "M"

ggplot(data=bewr_count_year, aes(x=year, y=freq, fill=sexRatio)) +
  geom_bar(stat="identity", position=position_dodge())+xlab("Year")+ylab("Count")+
  labs(title="Change in Sex Ratio of Bewick's Wren",fill="Sex")+
  theme(plot.title = element_text(hjust = 0.5))

######################################################################################

bush_count_year$sexRatio[bush_count_year$sexRatio == 0] <- "F"
bush_count_year$sexRatio[bush_count_year$sexRatio == 1] <- "M"

ggplot(data=bush_count_year, aes(x=year, y=freq, fill=sexRatio)) +
  geom_bar(stat="identity", position=position_dodge())+xlab("Year")+ylab("Count")+
  labs(title="Change in Sex Ratio of Bushtit",fill="Sex")+
  theme(plot.title = element_text(hjust = 0.5))

######################################################################################

cbch_count_year$sexRatio[cbch_count_year$sexRatio == 0] <- "F"
cbch_count_year$sexRatio[cbch_count_year$sexRatio == 1] <- "M"

ggplot(data=cbch_count_year, aes(x=year, y=freq, fill=sexRatio)) +
  geom_bar(stat="identity", position=position_dodge())+xlab("Year")+ylab("Count")+
  labs(title="Change in Sex Ratio of Chestnut-backed Chickadee",fill="Sex")+
  theme(plot.title = element_text(hjust = 0.5))

######################################################################################
#Number of Sightings of different species over the years

count_sosp_year = count(sosp, c('year'))
count_coye_year = count(coye,  c('year'))
count_bewr_year = count(bewr, c('year'))
count_bush_year = count(bush,  c('year'))
count_cbch_year = count(cbch,  c('year'))


ggplot(data=count_sosp_year, aes(x=year, y=freq)) +
  geom_line()+
  geom_point()


ggplot(data=count_coye_year, aes(x=year, y=freq)) +
  geom_line()+
  geom_point()


ggplot(data=count_bewr_year, aes(x=year, y=freq)) +
  geom_line()+
  geom_point()


ggplot(data=count_bush_year, aes(x=year, y=freq)) +
  geom_line()+
  geom_point()


ggplot(data=count_cbch_year, aes(x=year, y=freq)) +
  geom_line()+
  geom_point()


############################################################
# All above plots in a single plot

ggplot() + 
  geom_line(data=count_sosp_year, aes(x=year, y=freq, color="Song sparrow"),size=1) +
  geom_line(data=count_coye_year, aes(x=year, y=freq, color="Common Yellow Throat"),size=1)+
  geom_line(data=count_bewr_year, aes(x=year, y=freq, color="Bewick's Wren"),size=1) +
  geom_line(data=count_bush_year, aes(x=year, y=freq, color="Bushtit"),size=1)+
  geom_line(data=count_cbch_year, aes(x=year, y=freq, color="Chestnut-backed Chickadee"),size=1)+xlab("Year")+ylab("Count")+labs(title="Sightings by Year",colour="Species Name")+
  theme(plot.title = element_text(hjust = 0.5))



####################################################################################################################
#Number of Sightings of different Species by month over the span of 5 years

count_sosp = count(sosp, c('month','year'))
count_coye = count(coye,c('month','year'))
count_bewr = count(bewr, c('month','year'))
count_bush = count(bush, c('month','year'))
count_cbch = count(cbch, c('month','year'))


a <- subset(count_sosp, year=="2016"|year=="2015"|year=="2014"|year=="2013"|year=="2012")
a$year<-factor(a$year)
ggplot(data = a, aes(x = month, y = freq, color=year)) + 
  geom_line()+ geom_point()+
  xlab("Month")+ylab("Count")+labs(title="Sightings per month for Song Sparrow",colour="Year")+
  theme(plot.title = element_text(hjust = 0.5))+scale_x_continuous(breaks=c(1,2,3,4,5,6,7,8,9,10,11,12))

b <- subset(count_coye, year=="2016"|year=="2015"|year=="2014"|year=="2013"|year=="2012")
b$year<-factor(b$year)
ggplot(data = b, aes(x = month, y = freq, color=year)) + 
  geom_line()+ geom_point()+
  xlab("Month")+ylab("Count")+labs(title="Sightings per month for Common Yellowthroat",colour="Year")+
  theme(plot.title = element_text(hjust = 0.5))+scale_x_continuous(breaks=c(1,2,3,4,5,6,7,8,9,10,11,12))

c <- subset(count_bewr, year=="2016"|year=="2015"|year=="2014"|year=="2013"|year=="2012")
c$year<-factor(c$year)
ggplot(data = c, aes(x = month, y = freq, color=year)) + 
  geom_line()+ geom_point()+
  xlab("Month")+ylab("Count")+labs(title="Sightings per month for Bewick's Wren",colour="Year")+
  theme(plot.title = element_text(hjust = 0.5))+scale_x_continuous(breaks=c(1,2,3,4,5,6,7,8,9,10,11,12))

d <- subset(count_bush, year=="2016"|year=="2015"|year=="2014"|year=="2013"|year=="2012")
d$year<-factor(d$year)
ggplot(data = d, aes(x = month, y = freq, color=year)) + 
  geom_line()+ geom_point()+
  xlab("Month")+ylab("Count")+labs(title="Sightings per month for Bushtit",colour="Year")+
  theme(plot.title = element_text(hjust = 0.5))+scale_x_continuous(breaks=c(1,2,3,4,5,6,7,8,9,10,11,12))

e <- subset(count_cbch, year=="2016"|year=="2015"|year=="2014"|year=="2013"|year=="2012")
e$year<-factor(e$year)
ggplot(data = e, aes(x = month, y = freq, color=year)) + 
  geom_line()+ geom_point()+
  xlab("Month")+ylab("Count")+labs(title="Sightings per month for Chestnut-backed Chickadee",colour="Year")+
  theme(plot.title = element_text(hjust = 0.5))+scale_x_continuous(breaks=c(1,2,3,4,5,6,7,8,9,10,11,12))


########################################################################################################
detach(package:plyr)
library(dplyr)
#summary statistics based on years for Common Yellowthroat
f =coye%>%
  group_by(year)%>% 
  summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))

#summary statistics based on years for Song Sparrow
g=sosp%>%
  group_by(year)%>% 
  summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))

#summary statistics based on years for Bewick's Wren
h=bewr%>%
  group_by(year)%>% 
  summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))

#summary statistics based on years for Bushtit
i=bush%>%
  group_by(year)%>% 
  summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))

#summary statistics based on years for Chestnut-backed Chickadee
j=cbch%>%
  group_by(year)%>% 
  summarise(Mean=mean(cleanWeight, na.rm=TRUE),Max=max(cleanWeight, na.rm=TRUE), Min=min(cleanWeight, na.rm=TRUE), Median=median(cleanWeight, na.rm=TRUE), Std=sd(cleanWeight, na.rm=TRUE))

##################################################################################################################
#Change in the average weight of each species over the span of 20 years

ggplot() + 
  geom_line(data=f, aes(x=year, y=Mean, color="Song sparrow"),size=1) +
  geom_line(data=g, aes(x=year, y=Mean, color="Common Yellow Throat"),size=1)+
  geom_line(data=h, aes(x=year, y=Mean, color="Bewick's Wren"),size=1) +
  geom_line(data=i, aes(x=year, y=Mean, color="Bushtit"),size=1)+
  geom_line(data=j, aes(x=year, y=Mean, color="Chestnut-backed Chickadee"),size=1)+xlab("Year")+ylab("Mean of Weights")+labs(title="Weight changes by Year",colour="Species Name")+
  theme(plot.title = element_text(hjust = 0.5))


############################################################################################################################################
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

#Change in the average weight of each species by month over the span of 5 years

k <- subset(sosp_mean, yr=="2016"|yr=="2015"|yr=="2014"|yr=="2013"|yr=="2012")
k$yr<-factor(k$yr)
ggplot(data = k, aes(x = mn, y = mean1, color=yr)) + 
  geom_line()+ geom_point()+
  xlab("Month")+ylab("Weight")+labs(title="Weight changes per month for Song Sparrow",colour="Year")+
  theme(plot.title = element_text(hjust = 0.5))+scale_x_continuous(breaks=c(1,2,3,4,5,6,7,8,9,10,11,12))


l <- subset(coye_mean, yr=="2016"|yr=="2015"|yr=="2014"|yr=="2013"|yr=="2012")
l$yr<-factor(l$yr)
ggplot(data = l, aes(x = mn, y = mean, color=yr)) + 
  geom_line()+ geom_point()+
  xlab("Month")+ylab("Weight")+labs(title="Weight changes per month for Common Yellowthroat",colour="Year")+
  theme(plot.title = element_text(hjust = 0.5))+scale_x_continuous(breaks=c(1,2,3,4,5,6,7,8,9,10,11,12))

m <- subset(bewr_mean, yr=="2016"|yr=="2015"|yr=="2014"|yr=="2013"|yr=="2012")
m$yr<-factor(m$yr)
ggplot(data = m, aes(x = mn, y = mean2, color=yr)) + 
  geom_line()+ geom_point()+
  xlab("Month")+ylab("Weight")+labs(title="Weight changes per month for Bewick's Wren",colour="Year")+
  theme(plot.title = element_text(hjust = 0.5))+scale_x_continuous(breaks=c(1,2,3,4,5,6,7,8,9,10,11,12))

n <- subset(bush_mean, yr=="2016"|yr=="2015"|yr=="2014"|yr=="2013"|yr=="2012")
n$yr<-factor(n$yr)
ggplot(data = n, aes(x = mn, y = mean3, color=yr)) + 
  geom_line()+ geom_point()+
  xlab("Month")+ylab("Weight")+labs(title="Weight changes per month for Bushtit",colour="Year")+
  theme(plot.title = element_text(hjust = 0.5))+scale_x_continuous(breaks=c(1,2,3,4,5,6,7,8,9,10,11,12))

o <- subset(cbch_mean, yr=="2016"|yr=="2015"|yr=="2014"|yr=="2013"|yr=="2012")
o$yr<-factor(o$yr)
ggplot(data = o, aes(x = mn, y = mean4, color=yr)) + 
  geom_line()+ geom_point()+
  xlab("Month")+ylab("Weight")+labs(title="Weight changes per month for Chestnut-backed Chickadee",colour="Year")+
  theme(plot.title = element_text(hjust = 0.5))+scale_x_continuous(breaks=c(1,2,3,4,5,6,7,8,9,10,11,12))

###########################################################################################################################


#summary statistics based on years for Common Yellowthroat for wingtoweight ratio
p=coye%>%
  group_by(year)%>% 
  summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))

#summary statistics based on years for Song Sparrow for wingtoweight ratio
q=sosp%>%
  group_by(year)%>% 
  summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))

#summary statistics based on years for Bewick's Wren for wingtoweight ratio
r=bewr%>%
  group_by(year)%>% 
  summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))

#summary statistics based on years for Bushtit for wingtoweight ratio
s=bush%>%
  group_by(year)%>% 
  summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))

#summary statistics based on years for Chestnut-backed Chickadee for wingtoweight ratio
t=cbch%>%
  group_by(year)%>% 
  summarise(Mean=mean(wingToWeightRatio, na.rm=TRUE),Max=max(wingToWeightRatio, na.rm=TRUE), Min=min(wingToWeightRatio, na.rm=TRUE), Median=median(wingToWeightRatio, na.rm=TRUE), Std=sd(wingToWeightRatio, na.rm=TRUE))

################################################################################################################################################

#Change in the average Wing to Weight Ratio of each species over the span of 20 years
ggplot() + 
  geom_line(data=p, aes(x=year, y=Mean, color="Song sparrow"),size=1) +
  geom_line(data=q, aes(x=year, y=Mean, color="Common Yellow Throat"),size=1)+
  geom_line(data=r, aes(x=year, y=Mean, color="Bewick's Wren"),size=1) +
  geom_line(data=s, aes(x=year, y=Mean, color="Bushtit"),size=1)+
  geom_line(data=t, aes(x=year, y=Mean, color="Chestnut-backed Chickadee"),size=1)+xlab("Year")+ylab("Mean of Wing to Weight Ratios")+labs(title="Wing to Weight Ratio changes by Year",colour="Species Name")+
  theme(plot.title = element_text(hjust = 0.5))

#############################################################################################################################################
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

#############################################################################################################

#Change in the average Wing to Weight Ratio of each species by month over the span of 5 years

u <- subset(sosp_wtow_mean, yr=="2016"|yr=="2015"|yr=="2014"|yr=="2013"|yr=="2012")
u$yr<-factor(u$yr)
ggplot(data = u, aes(x = mn, y = mean_s_wtow, color=yr)) + 
  geom_line()+ geom_point()+
  xlab("Month")+ylab("Wing to Weight Ratio")+labs(title="Change in Wing to weight Ratio per month for Song Sparrow",colour="Year")+
  theme(plot.title = element_text(hjust = 0.5))+scale_x_continuous(breaks=c(1,2,3,4,5,6,7,8,9,10,11,12))

v <- subset(coye_wtow_mean, yr=="2016"|yr=="2015"|yr=="2014"|yr=="2013"|yr=="2012")
v$yr<-factor(v$yr)
ggplot(data = v, aes(x = mn, y = mean_c_wtow, color=yr)) + 
  geom_line()+ geom_point()+
  xlab("Month")+ylab("Wing to Weight Ratio")+labs(title="Change in Wing to weight Ratio per month for Common Yellowthroat",colour="Year")+
  theme(plot.title = element_text(hjust = 0.5))+scale_x_continuous(breaks=c(1,2,3,4,5,6,7,8,9,10,11,12))

w <- subset(bewr_wtow_mean, yr=="2016"|yr=="2015"|yr=="2014"|yr=="2013"|yr=="2012")
w$yr<-factor(w$yr)
ggplot(data = w, aes(x = mn, y = mean_be_wtow, color=yr)) + 
  geom_line()+ geom_point()+
  xlab("Month")+ylab("Wing to Weight Ratio")+labs(title="Change in Wing to weight Ratio per month for Bewick's Wren",colour="Year")+
  theme(plot.title = element_text(hjust = 0.5))+scale_x_continuous(breaks=c(1,2,3,4,5,6,7,8,9,10,11,12))

x <- subset(bush_wtow_mean, yr=="2016"|yr=="2015"|yr=="2014"|yr=="2013"|yr=="2012")
x$yr<-factor(x$yr)
ggplot(data = x, aes(x = mn, y = mean_bu_wtow, color=yr)) + 
  geom_line()+ geom_point()+
  xlab("Month")+ylab("Wing to Weight Ratio")+labs(title="Change in Wing to weight Ratio per month for Bushtit",colour="Year")+
  theme(plot.title = element_text(hjust = 0.5))+scale_x_continuous(breaks=c(1,2,3,4,5,6,7,8,9,10,11,12))

y <- subset(cbch_wtow_mean, yr=="2016"|yr=="2015"|yr=="2014"|yr=="2013"|yr=="2012")
y$yr<-factor(y$yr)
ggplot(data = y, aes(x = mn, y = mean_cb_wtow, color=yr)) + 
  geom_line()+ geom_point()+
  xlab("Month")+ylab("Wing to Weight Ratio")+labs(title="Change in Wing to weight Ratio per month for Chestnut-backed Chickadee",colour="Year")+
  theme(plot.title = element_text(hjust = 0.5))+scale_x_continuous(breaks=c(1,2,3,4,5,6,7,8,9,10,11,12))


















