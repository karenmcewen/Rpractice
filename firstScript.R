library("tidyverse")
download.file("https://ndownloader.figshare.com/files/11492171",
              "data/SAFI_clean.csv", mode = "wb")
interviews <- read_csv("data/SAFI_clean.csv", na = "NULL")
#R runs one line at a time - it is similar to a calculator
#here are some simple mathematical operations
3+5
12/7
3*8
tan(35)
sqrt(9)
area_hectares<-1.0
area_hectares
2.4*area_hectares
2.4*
6  
area_hectares<-8*area_hectares
round(4.768)

#args tells you what arguments a function can take
args(round)
round(4.76554,2)
args(sqrt)
round(4.76548,digits=2)

#creating a vector
hh_members<-c(2,4,5,6,7)
hh_members


interviews$no_membrs

hh_members*5
wall_type<-c("muddaub","burntbricks","sunbricks")

length(hh_members)
?length
?ggplot

class(hh_members)
str(wall_type)

#create a new character vector
possessions<-c("bicycle","radio","TV")
#to add something to the vector use the vector name not in quotes
possessions<-c(possessions,"phone")

#what happens when we mix class types?
#defaults to the simpler thing "character">number>logical
#num will default to char
num_char<-c(1,2,3,"a")

#logical will default to num (1 for TRUE 0 for FALSE)
num_log<-c(1,2,3,TRUE)

#logical will default to char
char_log<-c("a","b","c",FALSE)

wall_type<-c("muddaub","burntbricks","sunbricks")
#subsetting uses square brackets
wall_type[2]
#this will return just the given columns
wall_type[c(2,3)]
#this will give a range from column a to b
wall_type[2:3]
#this will give everything except the given column
wall_type[-2]

#creating a new vector from another vector
more_walls<-wall_type[c(1,2,3,2,1,2,1,2,3,2,1)]
more_walls

#let's get just a few members of each numeric data set
hh_members<-c(4,5,6,7,8)
hh_members[c(TRUE,FALSE,TRUE,TRUE,FALSE)]
hh_members>5
hh_members[hh_members>5]
# single vertical line is logical OR
hh_members[hh_members == 4 | hh_members >= 6 ]

#let's do the same with character vectors
possessions<-c("car","TV","bicycle","segway","computer")
possessions[possessions=="car"|possessions=="TV"]

# Logical operators 
# | is logical "or"
# & is logical "and"
# == is logical "equal to"
# $ is to pull a vector from a larger object
# : is through, i.e., (1:5) is equivelent to 1,2,3,4,5
# [ ] is for subsetting from a vector or data frame or matrix
# %in% is for allowing any value from within a range

#logical operator %in%
possessions %in% c("car","segway","computer", "truck")

#create a new numerical vector
hh_members<-c(3,7,10,6)
#to make sure the data was put in correctly 
#just type the name of the vector 
#will show in R window and the global environment
hh_members

#Now we'll put both in a single line using parenthesis
#(vector assignment)
(hh_members<-c(3,7,10,6))

#create new character vector
respondent_wall_type<-c("muddaub","burntbricks","sunbricks")
respondent_wall_type
(respondent_wall_type<-c("muddaub","burntbricks","sunbricks"))

#length of the data
length(hh_members)
length(respondent_wall_type)

#type of the data
class(hh_members)
class(respondent_wall_type)

#structure str gives class, number, and data
str(hh_members)
str(respondent_wall_type)

#types of vectors - 6 types total
#An atomic vector is the simplest R data type and is a linear vector of a single type. 
#"character" 
#"numeric"(or "double"). 
#"logical" for TRUE and FALSE (the boolean data type)
#"integer" for integer numbers must use 'L' or will automatically be numeric
# (e.g., 2L, the L indicates to R that it’s an integer)
#"complex" to represent complex numbers with real and imaginary parts (e.g., 1 + 4i)
#"raw" for bitstreams that we won’t discuss further

#typeof - may give more detail than class (eg. double not just numeric)
typeof(hh_members)
typeof(respondent_wall_type)
typeof(HH_members)#R is case sensitive (HH != hh)

#Challenge 1 - mixing up types to see how R does automatic conversion
(num_char <- c(1, 2, 3, "a")) #converts all to chars
(num_logical <- c(1, 2, 3, TRUE)) #converts TRUE to numeric 1, FALSE to num 0

(char_logical <- c("a", "b", "c", TRUE)) #converts TRUE to char "true"
(tricky <- c(1, 2, 3, "4"))# converts all other numbers to chars

(num_integers<-c(1L,2L,3L,TRUE)) #using integers requires 'L' converts T to 1L
typeof(num_integers)

#subsetting - taking a portion of a vector or data set - using keyword or index
#index in R begins with 1 (not zero like in C#, python and others)
#subsetting uses square brackets when using indexing
hh_members[3]
#if put in an index bigger than the amount of data you have you get NA (missing)
hh_members[5]
#can assign an element to the missing space - can't do that with other programming languages!
(hh_members[5]<-8)

#to extract more than one element using indexes put c function inside square vector
#can't use two or more numbers because a vector is one-dimensional
hh_members[c(2,3)]

#useful hint -typing function without() gives definition of function
#             typing vector without [] will give you the data in the vector

#1)create a new vector from another vector
hh_members1 <- hh_members[c(2,2,1,3,3,3,4,5)]
hh_members1

#2)extracting elements from a vector using logical or comparison
hh_members>6  #this just compares each element to the number 3
hh_members[hh_members>3] #this creates a new logical vector w/only true
hh_members[c(FALSE,TRUE,TRUE,TRUE,TRUE)]

#when R does a comparison it implicit/automatically does the cycling 
#of the shorter vector (like 3) to match the longer vector (hh_members)
#I think this is like an automatic for loop working in the background

#3)using names for elements of the vectors to extract
#in python this is a key-value pair or dictionary
names(hh_members) <-c('d1','d2','d3','d4','d5')
hh_members[c('d1','d5')]

#single number is scalar which has zero dimensions

#MISSING DATA
#R uses NA to represent missing data - we need to know what we mean by this

rooms <- c(2,1,1,NA,4)
rooms
typeof(rooms)
mean(rooms) #will result in NA because R hasn't been told how to handle NA
is.na(rooms)#tells you where the NA exists
which(is.na(rooms))

#common way to handle missing data - omit/ignore it -  na.rm omits na from calc
mean(rooms, na.rm=TRUE)

#can tell what the na should be - assign a value to it that makes sense 
# eg every house has at least one room
rooms[4]<-1
mean(rooms)

#imputation - can use the mean or median or prediction to decide what the missing data could be

#CHALLENGE
#Using this vector of rooms, create a new vector with the NAs removed.
#rooms <- c(1, 2, 1, 1, NA, 3, 1, 3, 2, 1, 1, 8, 3, 1, NA, 1)
rooms <- c(1, 2, 1, 1, NA, 3, 1, 3, 2, 1, 1, 8, 3, 1, NA, 1)
rooms
rooms_no_na<-c(na.omit(rooms))
rooms_no_na

#Use the function median() to calculate the median of the rooms vector. Two ways
median(rooms, na.rm=TRUE)
median(rooms_no_na)

#Use R to figure out how many households in the set use more than 2 rooms for sleeping.
rooms_morethan_2<-rooms_no_na[rooms_no_na>2]
length(rooms_morethan_2)


#----------------------
#Starting with Data
#need to reload tidyverse and data set because we closed the file yesterday
library(tidyverse)
interviews<-read_csv("data/SAFI_clean.csv", na="NULL")

#dataframe is basically a table of data - interviews is a dataframe
#tibble is a subset of the dataframe tells you what type of data you have & extra info
View(interviews) #note that View is capitalized - allows you to see the dataset in above tab
head(interviews) #shows first 6 observations
tail(interviews) #shows last 6 observations
head(interviews, 20) #shows first x observations

#now need two indexes - row & column
interviews[1,1] #first row, first column
interviews[1:3,7] #rows 1-3 and column 7
interviews[,6] #all rows and column 6 (can leave out comma)
interviews[c(2,5,6),c(1,3)] #use c function to get noncontiguous rows or columns
interviews$village #dollar sign $ brings up a list of columns to choose from!

#if there is no header row, R will give dummy names c1,c2,c3 etc. or you can give column names

#you have lots of data - do you need it all? subset the data you actually need

#how many rows are in the data set? length gives you the #columns 
dim(interviews) #dim gives rows and columns
nrow(interviews) #nrow gives the number of rows
ncol(interviews) #ncolumn gives the number of columns

#if you only want a few rows, you can exclude the others using -c
interviews[-c(7:131),]
interviews[,"village"]


#FACTORS - for categorical variables with limited possible values (eg gender)
class(interviews$respondent_wall_type)
interviews$respondent_wall_type<-as.factor(interviews$respondent_wall_type)

#convert character variable to a vector using as - so we can group our data and compare them
class(interviews$memb_assoc)
interviews$memb_assoc<-as.factor(interviews$memb_assoc)
class (interviews$memb_assoc)

#plot the data
plot(interviews$memb_assoc)

#dates in R need to be specially delineated as dates not characters
library(lubridate)
dates <-interviews$interview_date
interviews$day <-day(dates)
interviews$month <-month(dates)
interviews$year <-year(dates)
#these are new columns created at the end of the dataset


#------------------------------------------------------------
#DATA WRANGLING 
#will use package dplyr from tidyverse
select(interviews, village, no_membrs, years_liv) #columns with all rows
filter(interviews, village=="God") #rows with all columns

#combine these two steps using a pipe (ctrl-shift-m) %>% 
#new dataframe <- old dataframe pipe filter(rows) pipe select(columns)
interviews_god <-interviews %>%  filter(village=="God") %>%  select(no_membrs, years_liv)
interviews_god
interviews %>%  filter(!is.na(memb_assoc)) %>%
  mutate(people_per_room = no_membrs/rooms) #mutate creates a new column based on other columns

#group_by() function 
interviews %>%  group_by(village, memb_assoc) %>%  summarise(mean_no_membrs = mean(no_membrs))

#arrange() function is used to sort your data - ascending is the default
interviews %>% filter(!is.na(memb_assoc)) %>% group_by(village, memb_assoc) %>% 
  summarise(mean_no_membrs = mean(no_membrs), min_membrs=min(no_membrs)) %>%
  arrange(desc(min_membrs))

#count() function is simpler than doing a group_by and arrange
interviews %>% count(village)



###########################DATA FOR PLOTTING###################
#Make plotting dataset
interviews_plotting<- interviews %>%
  mutate(split_items=strsplit(items_owned,";"))%>%
  unnest()%>%
  mutate(items_owned_logical = TRUE)%>%
  spread(key=split_items,value=items_owned_logical,
         fill=F)%>%
  rename(no_listed_items='<NA>')%>%
  mutate(split_months=strsplit(months_lack_food,";"))%>%
  unnest()%>%
  mutate(months_lack_food_logical=TRUE)%>%
  spread(key=split_months, value=months_lack_food_logical,
         fill=FALSE)%>%
  mutate(number_months_lack_food=rowSums(select(.,Apr:Sept)))%>%
  mutate(number_items=rowSums(select(.,bicycle:television)))

#create a place for data we have created
dir.create("data_output")

#write the csv
write_csv(interviews_plotting,path="data_output/interviews_plotting.csv")

head(interviews_plotting)

#data visualization using ggplot
ggplot(data=interviews_plotting, aes(x=no_membrs,y=number_items))+
  geom_jitter(aes(color=village), alpha=0.5)

#aes tells ggplot to look in the dataset not in ggplot

ggplot(data=interviews_plotting, aes(x=village,y=rooms))+
  geom_jitter(aes(color=respondent_wall_type), alpha=0.5)

#boxplot
ggplot(data=interviews_plotting, aes(x=village,y=rooms))+
  geom_boxplot()

#boxplot with jitter layer on top
ggplot(data=interviews_plotting, aes(x=respondent_wall_type,y=rooms))+
  geom_boxplot(alpha=0.0)+
  geom_jitter(color="tomato", alpha=0.5)

#violin plot
ggplot(data=interviews_plotting, aes(x=respondent_wall_type,y=rooms))+
  geom_violin(alpha=0.0)+
  geom_jitter(aes(color=memb_assoc), alpha=0.5)

#bar plots - does not have a y axis
ggplot(data=interviews_plotting, aes(x=respondent_wall_type))+
  geom_bar(aes(fill=village))

ggplot(data=interviews_plotting, aes(x=respondent_wall_type))+
  geom_bar(aes(fill=village), position="dodge")

#change count to percentage per village
percent_wall_type<-interviews_plotting %>% 
  filter(respondent_wall_type!="cement") %>% 
  count(village, respondent_wall_type) %>% 
  group_by(village) %>% 
  mutate(percent=n/sum(n)) %>% 
  ungroup()
#count always defaults to the letter n
#need to ungroup at the end because we don't want it grouped

ggplot(percent_wall_type, aes(x=village, y=percent, 
                              fill=respondent_wall_type))+
  geom_bar(stat = "identity", position="dodge")

