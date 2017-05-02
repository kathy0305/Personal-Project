## Lets group parks by the type of activity 
## Study parks that have "Springs" in their name

library(tidyverse)
library(stringr)

Springs <- dfExp %>%
    filter(str_detect(PARK, 'Springs|Spring|springs'))

## sum attendance 
TotalAttendaceSprings <- Springs %>%
    summarize(Total=sum(ATTENDANCE))

## Total attendance of parks by year
ByYearSumSprings <- Springs %>%
    count(year, wt=ATTENDANCE) %>% ## default col is called n
    rename(Total=n) ## so just rename

## lets try it as barplot
ggplot (ByYearSumSprings)+
    geom_bar(aes(x= year, y= Total), stat="identity")

## Group springs by name
BySpringSum <-Springs %>%
    group_by(PARK) %>%
    summarize(AttdBySpring= sum(ATTENDANCE))%>%
    arrange(desc(AttdBySpring))
BySpringSum <- BySpringSum %>%
mutate(PARK = factor(PARK, levels=unique(PARK)))
#plot
ggplot(BySpringSum,aes(x=PARK, y=AttdBySpring, fill=PARK))+
    geom_bar(stat ="identity")+
    coord_flip()

