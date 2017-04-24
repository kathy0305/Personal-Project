library(tidyverse)
library(readxl)
##read files 
## data is in Excel and Attendance is in worksheet "Sheet1"
df2002 <- read_excel("FinalReport2002.xlsx", sheet = "Sheet1")
df2003 <- read_excel("FinalReport2003.xls", sheet = "Sheet1")
df2004 <- read_excel("FinalReport2004.xls", sheet = "Sheet1")
df2005 <- read_excel("FinalReport2005.xls", sheet = "Sheet1")
df2006 <- read_excel("FinalReport2006.xls", sheet = "Sheet1")
df2007 <- read_excel("FinalReport2007.xls", sheet = "Sheet1")
df2008 <- read_excel("FinalReport2008.xls", sheet = "Sheet1")
df2009 <- read_excel("FinalReport2009.xls", sheet = "Sheet1")
df2010 <- read_excel("FinalReport2010.xlsx", sheet = "Sheet1")
df2011 <- read_excel("FinalReport2011.xls", sheet = "Sheet1")
df2012 <- read_excel("FinalReport2012.xls", sheet = "Sheet1")
df2013 <- read_excel("FinalReport2013.xlsx", sheet = "Sheet1")
df2014 <- read_excel("FinalReport2014.xls", sheet = "Sheet1")

## add a column with the corresponding year
df2002 <- mutate(df2002, year=2002)
df2003 <- mutate(df2003, year=2003)
df2004 <- mutate(df2004, year=2004)
df2005 <- mutate(df2005, year=2005)
df2006 <- mutate(df2006, year=2006)
df2007 <- mutate(df2007, year=2007)
df2008 <- mutate(df2008, year=2008)
df2009 <- mutate(df2009, year=2009)
df2010 <- mutate(df2010, year=2010)
df2011 <- mutate(df2011, year=2011)
df2012 <- mutate(df2012, year=2012)
df2013 <- mutate(df2013, year=2013)
df2014 <- mutate(df2014, year=2014)

## join all the dfs from all years
## 
dfall <- full_join(df2002,df2003) %>%
    full_join(df2004) %>%
    full_join(df2005) %>%
    full_join(df2006) %>%
    full_join(df2007) %>%
    full_join(df2008) %>%
    full_join(df2009) %>%
    full_join(df2010) %>%
    full_join(df2011) %>%
    full_join(df2012) %>%
    full_join(df2013) %>%
    full_join(df2014) 

## Clean names
## Many had inconsistance naming
## Alfred B. Maclay vs. Alfred B. Maclay Gardens
## Addison Blockhouse Museum vs. Addison Blockhouse 
## Cedar Key Museum vs. Cedar Key State Museum
## Note: most of naming inconsistency were in 2007 year(wonder why??)
## so I decided to rename to the most used name format in other years
## it would have a lot easier to simply fix name inconsistency direclty in Excel
## but for the sake of reproducibility I decided to do it in r


dfall$PARK[dfall$PARK=="Alfred B. Maclay"] <- "Alfred B. Maclay Gardens"
dfall$PARK[dfall$PARK=="Alfred B.Maclay Gardens"] <-"Alfred B. Maclay Gardens"
dfall$PARK[dfall$PARK=="Alafia River State Park"] <- "Alafia River"
dfall$PARK[dfall$PARK=="Avalon "] <-"Avalon"
dfall$PARK[dfall$PARK=="Catfish Creek "] <-"Catfish Creek"
dfall$PARK[dfall$PARK=="Cedar Key Museum"] <- "Cedar Key State Museum"
dfall$PARK[dfall$PARK=="Charlotte Harbor Preserve"] <- "Charlotte Harbor"              
dfall$PARK[dfall$PARK=="Colt Creek State Park"] <-"Colt Creek"
dfall$PARK[dfall$PARK=="Cross Florida Greenway(East/West & Sharpes Ferry Office)"]<-"Cross Florida Greenway"
dfall$PARK[dfall$PARK=="Addison Blockhouse"]<- "Addison Blockhouse Museum"
dfall$PARK[dfall$PARK=="Coral Reef (John Pennekamp)"] <- "John Pennekamp Coral Reef"
dfall$PARK[dfall$PARK=="John Pennekamp"] <- "John Pennekamp Coral Reef"
dfall$PARK[dfall$PARK=="Crystal River"] <- "Crystal River Preserve"
dfall$PARK[dfall$PARK=="Crystal River  Preserve"]<- "Crystal River Preserve"
dfall$PARK[dfall$PARK=="Crystal River Preserve "]<-"Crystal River Preserve"
dfall$PARK[dfall$PARK=="Curry Hammock "]<-"Curry Hammock"
dfall$PARK[dfall$PARK=="Eden"] <- "Eden State Gardens"
dfall$PARK[dfall$PARK=="Estero Bay Preserve SP"]<- "Estero Bay"              
dfall$PARK[dfall$PARK=="Florida Keys Trail"] <-"Florida Keys Overseas Heritage Trail"
dfall$PARK[dfall$PARK=="Fort Clinch & Fernandina Plaza"] <-"Fort Clinch"
dfall$PARK[dfall$PARK=="Fort Clinch (incl.Fernandina Plaza)"] <-"Fort Clinch"
dfall$PARK[dfall$PARK=="Fort Clinch "] <-"Fort Clinch"
dfall$PARK[dfall$PARK=="Homosassa Springs "] <-"Homosassa Springs"
dfall$PARK[dfall$PARK=="Gamble Plantation "] <-"Gamble Plantation"
dfall$PARK[dfall$PARK=="Homossassa Springs "] <-"Homosassa Springs"
dfall$PARK[dfall$PARK=="John Gorrie" ] <- "John Gorrie Museum" 
dfall$PARK[dfall$PARK=="John Pennekamp Coral Reef "]<-"John Pennekamp Coral Reef"
dfall$PARK[dfall$PARK=="Lafayette Blue Spring"] <- "Lafayette Blue Springs"              
dfall$PARK[dfall$PARK=="Lake June in Winter"  ] <- "Lake June Scrub"       
dfall$PARK[dfall$PARK=="Little Talbot Islands "] <- "Little Talbot Island"
dfall$PARK[dfall$PARK=="Lk Jackson Mounds"] <- "Lake Jackson Mounds"
dfall$PARK[dfall$PARK=="Lake Jackson Mounds "] <- "Lake Jackson Mounds"
dfall$PARK[dfall$PARK=="Lover's Key "]<-"Lover's Key"
dfall$PARK[dfall$PARK=="Lower Wekiwa River"] <-"Lower Wekiva River"
dfall$PARK[dfall$PARK=="Manatee Springs & Anderson's Landing"] <- "Manatee Springs"
dfall$PARK[dfall$PARK== "Manatee Springs "] <- "Manatee Springs"
dfall$PARK[dfall$PARK=="MacArthur Beach"] <- "John D MacArthur Beach"
dfall$PARK[dfall$PARK=="Madison Blue Spring" ]<-"Madison Blue Springs"
dfall$PARK[dfall$PARK=="Madison Blue Springs" ] <-"Madison Blue Springs"
dfall$PARK[dfall$PARK=="Mound Key Archaeological"] <- "Mound Key"
dfall$PARK[dfall$PARK=="Mound Key Archaeological "] <- "Mound Key"
dfall$PARK[dfall$PARK=="Nat/Heritage Tourism Center"] <- "Nature & Heritage Tourism Center"
dfall$PARK[dfall$PARK=="Nature & Heritage Tourism"] <-  "Nature & Heritage Tourism Center"
dfall$PARK[dfall$PARK=="Nat/Heritage Tourism Ctr"] <- "Nature & Heritage Tourism Center"
dfall$PARK[dfall$PARK=="Nature Coast Trail"]<-"Nature Coast State Trail"
dfall$PARK[dfall$PARK=="Navarre Beach" ]<- "Navarre Beach State Park"
dfall$PARK[dfall$PARK=="North Peninsula "] <-"North Peninsula"
dfall$PARK[dfall$PARK=="Palatka-Lake Butler State Trail"] <- "Palatka-Lake Butler Trail"
dfall$PARK[dfall$PARK=="Paynes Prairie & Prices Scrub"] <-"Paynes Prairie"
dfall$PARK[dfall$PARK=="Paynes Prairie (Inc.Price Scrub)"] <- "Paynes Prairie"
dfall$PARK[dfall$PARK=="Paynes Prairie "] <- "Paynes Prairie"
dfall$PARK[dfall$PARK=="River Rise State Preserve"] <- "River Rise"
dfall$PARK[dfall$PARK=="Rocky Bayou (Fred Gannon)"]<- "Rocky Bayou"
dfall$PARK[dfall$PARK=="San Felasco"] <- "San Felasco Hammock"
dfall$PARK[dfall$PARK=="Skyway State Fishing Piers"] <- "Skyway State Fishing Piers"
dfall$PARK[dfall$PARK=="Skyway State Pier"] <-"Skyway State Fishing Piers"
dfall$PARK[dfall$PARK=="St. Andrews/Shell Island"] <- "St. Andrews"          
dfall$PARK[dfall$PARK=="St. Sebastian River Preserve"] <- "St. Sebastian River"
dfall$PARK[dfall$PARK=="St.Sebastian River"] <- "St. Sebastian River"
dfall$PARK[dfall$PARK=="Stump Pass"] <- "Stump Pass Beach"
dfall$PARK[dfall$PARK=="Suwannee River Wild Trail"]<- "Suwannee River Wilderness Trail" 
dfall$PARK[dfall$PARK=="Savannas "] <- "Savannas"
dfall$PARK[dfall$PARK=="Seabranch "] <- "Seabranch"
dfall$PARK[dfall$PARK=="Silver River "] <- "Silver Springs State Park"
dfall$PARK[dfall$PARK=="Silver River"] <- "Silver Springs State Park"
dfall$PARK[dfall$PARK=="Skyway State Fishing Piers"] <- "Skyway State Fishing Pier"
dfall$PARK[dfall$PARK=="Tallahassee-St.Marks R/R State Trail"] <- "Tallahassee/St. Marks Trail"
dfall$PARK[dfall$PARK=="Tallahassee-St.Marks Trail"] <- "Tallahassee/St. Marks Trail"
dfall$PARK[dfall$PARK=="Terra Ceia Preserve"] <- "Terra Ceia"
dfall$PARK[dfall$PARK=="Tomoka & Addison Blockhouse"] <- "Tomoka"
dfall$PARK[dfall$PARK=="Topsail Hill "] <- "Topsail Hill State Preserve"
dfall$PARK[dfall$PARK=="Van Fleet Trail"] <- "Van Fleet State Trail"
dfall$PARK[dfall$PARK=="Wakulla Springs "] <- "Wakulla Springs State Park"
dfall$PARK[dfall$PARK=="Wakulla Springs Park/Lodge"] <- "Wakulla Springs State Park"
dfall$PARK[dfall$PARK=="Werner-Boyce Salt Springs"] <-"Werner-Boyce"
dfall$PARK[dfall$PARK=="Wekiwa Springs "] <-"Wekiwa Springs"
dfall$PARK[dfall$PARK=="Yulee Sugar Mill Ruins"] <- "Yulee Sugar Mills"
dfall$PARK[dfall$PARK=="Topsail Hill"] <- "Topsail Hill State Preserve"

# I have to make a decision about Fernandina Plaza 2004
# its the only attendance listed for that park
# on Florida State Parks website it states that:
 
#"The property is now managed by Fort Clinch State Park as 
#part of the Florida Park Service 
#and has been a state managed property since 1941".

## so I need to add Fernandina Plaza's attendance to Fort Clinchs' for the year 2004
# and remove Fernandina Plaza's lone entry

## first find the attendance for Fernandina Plaza
x <- as.numeric(dfall %>% 
    filter(PARK == "Fernandian Plaza") %>% 
    select(ATTENDANCE))

## extract the attendance for Fort Clinch for year 2007               
y <- as.numeric(dfall %>%
    filter(PARK == "Fort Clinch" & year=="2007")%>%
    select(ATTENDANCE))

## add the two  
z=x+y

## replace the value with the new attendance 
dfall$ATTENDANCE[dfall$PARK == "Fort Clinch" & dfall$year=="2007"] <- z

## remove row/observation  Fernandina Plaza   
dfall <- dfall %>%
    filter(PARK !="Fernandian Plaza")

## I would like to summarize data based on regions
## could not get the state to send me location and region 
## so I had  do it manually http://www.stateparks.com
## 

NorthWestCond <- c("Bald Point","Big Lagoon","Blackwater Heritage Trail", "Blackwater River",
                   "Camp Helen","Constitution Convention","Deer Lake","St. George Island",
                   "Eden State Gardens","Falling Waters","Florida Caverns","Navarre Beach State Park",
                   "Grayton Beach","Henderson Beach","Perdido Key","Ponce de Leon", "Rocky Bayou",
                   "St. Andrews","St. Joseph","Tarkiln Bayou","Three Rivers",
                   "Topsail Hill State Preserve","Torreya","Yellow River Marshes")

NorthEastCond <- c("Amelia Island","Big Talbot Island","Dunn's Creek","Fort Clinch",
                   "Faver-Dykes", "Flagler Beach","Fort George Island","Fort Mose",
                    "George Crady Fishing Pier", "Gold Head Branch","Guana River","Haw Creek",
                    "Little Talbot Island","Palatka-St. Augustine Rail Trail",
                   "Pumpkin Hill Creek","Ravine Gardens","Shell Island",
                    "Washington Oaks")

NorthCentralCond <- c("Alfred B. Maclay Gardens","Anderson's Landing", "Big Shoals","Cedar Key Scrub",
                      "Cedar Key State Museum","Devil's Millhopper","Dudley Farm",
                      "Econfina River","Fanning Springs","Forest Capital","Ichetucknee Springs",
                      "John Gorrie Museum","Lafayette Blue Springs","Lake Jackson Mounds",
                      "Letchworth Mounds",
                      "Lake Talquin/River Bluff","Madison Blue Springs","Manatee Springs",
                      "Marjorie Kinnan Rawlings","Natural Bridge Battlefield","Nature & Heritage Tourism Center",
                     "Nature Coast State Trail","O'Leno","Ochlockonee River",
                    "Olustee Battlefield","Orman House","Palatka-Lake Butler Trail","Paynes Prairie","Peacock Springs",
                    "River Rise","Rock Springs Run",
                      "San Felasco Hammock","San Marcos de Apalache","Stephen Foster",
                    "Suwannee River","Suwannee River Wilderness Trail",
                    "Tallahassee/St. Marks Trail","Troy Springs","Wacasassa Bay","Wakulla Springs State Park")

CentralCond <- c( "Catfish Creek", "Dade Battlefield","Highlands Hammock","Hontoon Island","Lake Griffin",
                 "Lake June Scrub","Lake Kissimmee","Lake Louisa","Lower Wekiva River","Paynes Creek",
                 "Rainbow Springs","Silver Springs State Park", "Tosohatchee", "Van Fleet State Trail", "Wekiwa Springs")

CentralWestCond <- c("Alafia River","Anastasia", "Anclote Key","Caladesi Island","Crystal River Arch. Site",
                     "Crystal River Preserve","Colt Creek","Cross Florida Greenway","Egmont Key", "Fort Cooper",
                     "Gamble Plantation","Hernando DeSoto","Homosassa Springs", "Hillsborough River","Honeymoon Island",
                     "Lake Manatee","Little Manatee River", "Madira Bickel Mound",
                     "Manatee Springs","Myakka River" ,"Oscar Scherer", "Skyway State Fishing Pier",
                      "Terra Ceia","Weeki Wachee Springs","Withlacoochee State Trail", "Werner-Boyce",
                     "Ybor City","Yulee Sugar Mills")
CentralEastCond <-c("Addison Blockhouse Museum","Avalon","Avalon","'Avalon ",  "Beker","Blue Spring", "Bulow Creek","Bulow Plantation Ruins",
                    "De Leon Springs", "Fort Pierce Inlet", "Kissimmee Prairie", "Jack Island", "North Peninsula",
                    "Savannas", "Seabranch", "Sebastian Inlet","St. Lucie Inlet", "St. Sebastian River","Tomoka")
SouthWestCond <- c("Cayo Costa","Charlotte Harbor","Collier-Seminole","Delnor-Wiggins Pass",
                  "Don Pedro Island","Estero Bay","Fakahatchee Strand", "Gasparilla Island","Koreshan",
                  "Lover's Key",  "Mound Key","Stump Pass Beach")
SouthEastCond <- c( "Atlantic Ridge", "Bahia Honda","Cape Florida", "Curry Hammock",
                    "Florida Keys Overseas Heritage Trail","Fort Zachary Taylor", "Hugh Taylor Birch",
                     "Indian Key", "John D MacArthur Beach","John Pennekamp Coral Reef",
                    "John U. Lloyd Beach", "Jonathan Dickinson","Key Largo Hammock","Lake Okeechobee Scenic Trail",
                    "Lignumvitae Key","Lloyd Beach",
                 "Long Key","Oleta River","Oleta River", "San Pedro","The Barnacle", "Windley Key")


dfall <-    mutate(dfall, Region = ifelse(PARK %in% NorthWestCond,  "NorthWest" ,
                      ifelse(PARK %in% NorthEastCond,"NorthEast",
                             ifelse(PARK %in% NorthCentralCond,"NorthCentral",
                                ifelse(PARK %in% CentralCond, "Central",
                                    ifelse(PARK %in% CentralWestCond, "CentralWest",
                                           ifelse(PARK %in% CentralEastCond ,"CentralEast",
                                                  ifelse(PARK %in% SouthWestCond ,"SouthWest",
                                                         ifelse(PARK %in% SouthEastCond,"SouthEast",
                                                                NA)))))))))
                             

## save the tidy dataframe "dfall" as csv file
write_csv(dfall, "FLParksAttendance.csv")

 ##http://www.stateparks.com/images/maps/FLregions.gif  
    
#dfall %>%
   # filter(ATTENDANCE > 1000000) %>%
    #plot_ly (x=~year, y=~ATTENDANCE,color= ~PARK, sizes = ATTENDANCE)
 
