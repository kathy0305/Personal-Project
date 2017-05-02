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


## According to StackOverFlow changing the Chr to Factor 
## might do the trick to plot it in the right order
ByRegionSum <- ByRegionSum %>%
    mutate(Region = factor(Region, levels=unique(Region)))
##Plot
ggplot(ByRegionSum,aes(x=Region, y=AttdByRegion))+
       geom_bar(stat ="identity")




## Lets see each individual park,total attendance over the years
ByParkSum <-dfExp %>%
    group_by(PARK) %>%
    summarize(AttdByPark= sum(ATTENDANCE)) %>%
    arrange(desc(AttdByPark))
## change to factor
ByParkSum <- ByParkSum %>%
    mutate(PARK = factor(PARK, levels=unique(PARK)))

## plot the top 10
ggplot(ByParkSum[1:10,])+
    geom_bar(aes(x= PARK, y= AttdByPark), stat="identity")

## Lets try a different way
##plot the top 10 rows
ggplot(ByParkSum[1:10,])+
       geom_col(aes(x=PARK, y=AttdByPark/1000000, fill= PARK))+
        ylab("Attendance in Millions")+
        coord_flip() 

##There are two types of bar charts:
##geom_bar makes the height of the bar proportional to the number of cases
##in each group (or if the weight aesthetic is supplied,
##the sum of the weights). 

##If you want the heights of the bars to represent values in the data,
##use geom_col instead. geom_bar uses stat_count by default:
##it counts the number of cases at each x position.
##geom_col uses stat_identity: it leaves the data as is.

## Its not leaving data as is, its re-arranging it alphabetically
## so I'll change the variable Region to factor





## Wonder what the attendance rate over the years for each of the top 
## 10 parks

## I guess I first need to subset the original data to only include
## the data of the top 10 parks
TopTen <- as_vector( ByParkSum[1:10,1])

## now I need to extract the info on these top ten
## Base R
TopTenSubset <- dfExp[dfExp$PARK %in% TopTen,]

## Tidyverse using subset
TopTenSubsetB <- subset(dfExp, PARK %in% TopTen)

## Lets plot the attendance over the years
ggplot(TopTenSubset, aes(x=year, y=ATTENDANCE, color=PARK))+
    geom_line()


## Lets look at a boxplot to see outliers
ggplot(TopTenSubset, aes(x=year, y=ATTENDANCE, color=PARK))+
    geom_boxplot()

## I think an intercative plot will be more helpful
library(plotly)
plot_ly(TopTenSubset, y=~ATTENDANCE,color = ~PARK, type="box")


## Multi Line Graph
plot_ly(TopTenSubset, x=~year, y=~ATTENDANCE,color= ~PARK,type = "scatter",mode="lines+markers")

## Interesting finding
## Florida Keys Overseas Heritage Trail seems to do well 
##and only have data from year 2011

##2008 saw a peak attendance before the recession of 2008 , sharp drop in attendace in 2009
                

## Questions:
# What drives attendance to FL state parks?
# Weather, Economy, Gas Pricess ??

## What makes a park better than the other? 
# Activities? proximity to highway?
