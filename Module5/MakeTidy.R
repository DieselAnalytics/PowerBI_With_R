library(tidyverse)

untidy.data <- read_csv("./Data/SalesData.csv")

tidy.data <-
	untidy.data %>%
	separate(Location, c("City", "State"), sep = ",") %>%
	separate(`Store/Region`, c("Store", "Region"), sep = "-") %>%
	gather(key = "Year", value = "Statistic", `2015`:`2018`) %>%
	spread(key = Metric, value = Statistic)

