## Exploratory Analysis

## required pkgs
library (tidyverse)
library (readxl)

## read the file
dfExp <- read_csv("FLParksAttendance.csv")
## Count how many parks are in each year
ByYearAtten <- dfExp %>%
    group_by(year) %>%
    summarize(count=n()) 

## Total attendance of all the park all the years
TotalAttendace <- dfExp %>%
    summarize(Total=sum(ATTENDANCE))

## Total attendance of parks by year
ByYearSum <- dfExp %>%
    count(year, wt=ATTENDANCE) %>% ## default col is called n
    rename(Total=n) ## so just rename

    
## simple plot of attendance numbers by year
ggplot(ByYearSum) +
    geom_line (aes(year,Total))

## lets try it as barplot
ggplot (ByYearSum)+
    geom_bar(aes(x= year, y= Total), stat="identity")

## lets plot with added region
ggplot(dfExp, aes(x=year,y= ATTENDANCE))+
    geom_point(aes(color=Region))+
    geom_smooth()
## that didnt tell me much

## How many parks in each region
ByRegion <- dfExp %>%
    group_by(Region)%>%
    summarize(count= n())

## Total Attendance for each region
ByRegionSum <-dfExp %>%
    group_by(Region) %>%
    summarize(AttdByRegion= sum(ATTENDANCE))

## Total Attendance for each region ranked
ByRegionSum <-dfExp %>%
    group_by(Region) %>%
    summarize(AttdByRegion= sum(ATTENDANCE)) %>%
    arrange(desc(AttdByRegion)) ##arrange by largest 


## having a problem with the arrangment of x-axis
## The bars are not dsplaying in desc order
ggplot(ByRegionSum,aes(x=Region, y=AttdByRegion))+
  #  coord_cartesian(ylim = c(1000000, 100000000))+
    #discrete_scale(ylim = c(1000000, 100000000))+
    #scale_y_continuous(limits=c(1000000, 100000000), oob=rescale_none)
    geom_bar(stat ="identity")
    

##By default, geom_bar uses stat="count" which makes the height of the bar
##proportion to the number of cases in each group (or if the weight 
##aethetic is supplied, the sum of the weights).
##If you want the heights of the bars to represent values in the data, 
##use stat="identity" and map a variable to the y aesthetic.
    
