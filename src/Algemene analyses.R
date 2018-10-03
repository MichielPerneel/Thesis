#--------- Algemene analysen --------------------
library(tidyverse)
library(data.table)
library(lubridate)
library(ggplot2)

rawdata <- read.csv("data/raw/Glass eel stock deepfreeze 2017.csv", header = TRUE, sep = ";")
rawdata <- data.table(rawdata)
rawdata <- rawdata[,Tube.N.:remarks]
rawdata$Date <- dmy(rawdata$Date)
attach(rawdata)

### Aantal paling per maand, week 
#     -> Barplot inspiratie: http://www.sthda.com/english/wiki/ggplot2-barplots-quick-start-guide-r-software-and-data-visualization#data

plot_month <- ggplot(data=rawdata, aes(x=month(Date,label=TRUE))) +
  geom_bar(width=0.2, fill='steelblue') +
  #geom_text(aes(label=rawdata),vjust=-0.3,size=3.5) Count labels boven barplot <- lukt niet
  theme_light()
plot_month

plot_week <- ggplot(data=rawdata,aes(x=week(Date))) +
  geom_bar(width=0.2, fill='steelblue') +
  #geom_text(aes(label=rawdata),vjust=-0.3,size=3.5) Count labels boven barplot <- lukt niet
  theme_light()
plot_week

### Pigmentatiestadium tov tijd

### Gewicht tov tijd

### Lengte tov tijd

### Condition Factor tov tijd

plot <- qplot(x=Date, y=condition.factor, data=rawdata, geom="point")
plot
