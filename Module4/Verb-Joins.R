library(tidyverse)

# Imports Trade Balance Data
TradeBalanceData <- readr::read_csv("./Data/TradeBalanceData.csv")

# Imports Region Information
CountriesByRegion <- readr::read_csv("./Data/CountriesByRegion.csv")


# Combines Trade Balance and Region data using inner joins
CombinedData_innerjoin <-
	TradeBalanceData %>%
	dplyr::inner_join(CountriesByRegion, by = "Country")


# Combines Trade Balance and Region data using left joins
CombinedData_leftjoin <- TradeBalanceData %>%
	dplyr::left_join(CountriesByRegion, by = "Country") 