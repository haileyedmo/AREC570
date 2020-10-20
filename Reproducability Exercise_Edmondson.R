##AREC570: Reproducability Exercise##

rm(list=ls())

#Import Datasets (1952-1967)
gdp_52.67 <- read.csv("~/Documents/AREC570-Research Methods/Reproducability Exercise/gdp_52-67.csv")
View(gdp_52.67)
le_52.67 <- read.csv("~/Documents/AREC570-Research Methods/Reproducability Exercise/le_52-67.csv")
View(le_52.67)


#Create & Name Dataframes

GDP <- data.frame(gdp_52.67)
LE <- data.frame(le_52.67)
GDPLEcombo <- merge(GDP, LE, by = c("continent", "country", "year"))

#GDP per capita & add to data frame w other variables

GDPLEcombo["gdpPercap"] = 
  GDPLEcombo["gdp"] / GDPLEcombo["pop"]

#Creating dataframe for Canada subset

Canada <- GDPLEcombo[which(GDPLEcombo$'country'=='Canada'),]

#Graphing GDP Per Capita and Life Expectancy over time (Canada)

library(ggplot2)
library(reshape2)

ggplot(Canada) +
  geom_line(aes(x = year, y = gdpPercap))

ggplot(Canada) +
  geom_line(aes(x = year, y = lifeExp))





