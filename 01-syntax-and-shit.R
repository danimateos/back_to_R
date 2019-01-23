# Started with
# https://www.computerworld.com/article/2497143/business-intelligence/business-intelligence-beginner-s-guide-to-r-introduction.html?page=3

installed.packages()

?installed.packages

df = read.csv('~/repos/master-data-science/data/brain.csv')
df$Body.Weight

# Careful with multilevel factors
mydata <- read.table("~/repos/master-data-science/data/opentraveldata/optd_aircraft.csv", sep="^", header=TRUE, stringsAsFactor=FALSE)
mydata$iata_code

# Nice trick
x <- read.table(file = "clipboard", sep="\t", header=TRUE)

# Encoding is by default UTF-8
write.csv(df, "temp.csv")


## Exloration
head(mydata)
tail(mydata)

str(mydata)

colnames(mydata)
rownames(mydata)

max(mydata$nb_engines)
min(mydata$nb_engines)

max(na.exclude(mydata$nb_engines))
max(mydata$nb_engines, na.rm=TRUE)

# Correlation: TODO: make it work
cor(mydata)

# Combinations of three elements from a set of 14
choose(14,3)

# Get combinations
dudes = c("Marta", "Dani", "Mattis", "Elena")
combn(dudes, 2)

# Slicing
names(mydata)
mydata$iata_code

mydata$iata_code[2]
mydata$iata_code[2:19]

mydata[2:5,]

mydata[2:5, c(2,3,7)]

# Selecting
mydata[mydata$manufacturer == "BAe", "model"]

# Find only first
match("BAe", mydata$manufacturer)

# Find all occurrences 
mydata$manufacturer %in% c("BAe", "Boeing")
which(mydata$manufacturer %in% c("BAe", "Boeing"))

# WTF attach
mydata$model
model
attach(mydata)
model
detach(mydata)
model

# Alternative to brackets
subset(mydata, mydata$manufacturer == "Airbus", c(2,3))

cols = names(mydata)[c(2,3)]
mydata[mydata$manufacturer=="Airbus", "model"]
mydata[2:5,]

length(names(mydata)[c(2,3)])
mydata[mydata$manufacturer=="Airbus", names(mydata)[c(2,3)]]

# Length
length(unique(mydata$manufacturer))

# Useful Library 
library(dplyr)

# *To unload a library:
detach("package:dplyr", unload=TRUE)

# Use of dplyr: useful chaining operator %>%
# I don't quite get it in the example given in 
# https://www.computerworld.com/article/2598083/application-development/app-development-beginner-s-guide-to-r-easy-ways-to-do-basic-data-analysis.html?page=6
#mydata %>%
#  filter(mydata$manufacturer == "Airbus")) %>%
#  select(mydata$manufacturer, mydata$model)

filter(mydata,manufacturer=="Airbus")

# Table: crosstabulation
table(mydata$nb_engines)
table(mydata$nb_engines, mydata$manufacturer)

# Plotting
plot(df$Body.Weight, df$Brain.Weight, log="xy")

library(ggplot2)
qplot(df$Body.Weight, df$Brain.Weight, log="xy")


# Random
a <- b <- 6
b
a
b <- 3
a
b


