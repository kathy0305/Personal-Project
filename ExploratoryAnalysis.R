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

    
