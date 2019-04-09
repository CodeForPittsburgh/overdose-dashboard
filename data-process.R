library(jsonlite)
library(ggplot2)
library(dplyr)
library(tidyr)
library(shiny)

# call api
data <- fromJSON("https://data.wprdc.org/api/3/action/datastore_search?resource_id=ff33ca18-2e0c-4cb5-bdcd-60a5dc3c0418&limit=780698", 
                 flatten = TRUE)$result

# pull data from api response
data <- data$records
tail(data)

# filter just ODs, convert to dataframe
ods <- as.data.frame(subset(data, data$DESCRIPTION_SHORT=='OVERDOSE'))
# add a count column for charting
ods$COUNT <- 1
str(ods)
