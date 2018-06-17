library(tidyverse)

# Imports Trade Balance Data
TradeBalanceData <-
	readr::read_csv("./Data/TradeBalanceData.csv")

# Imports Region Information
CountriesByRegion <-
	readr::read_csv("./Data/CountriesByRegion.csv")

# Combines Trade Balance and Region data
TradeBalanceData <-
	TradeBalanceData %>%
	dplyr::inner_join(CountriesByRegion, by = "Country") %>%
	dplyr::select(Region, Country ,`2010 Exports`,`2010 Imports`,`2010 Trade Balance`)

# Subsetting rows based on a particular value in the column
TradeBalanceData %>%
	filter(Region == "Africa")

# Subsetting rows based on the values in a column not equal to a particular value
TradeBalanceData %>%
	filter(Region != "Not Mapped")

# subsetting rows by removing rows with NAs in a column
TradeBalanceData %>%
	select(Region:`2010 Trade Balance`) %>%
	filter(!is.na(`2010 Trade Balance`))

# Subsetting rwos by only including rows where the value of the column
# equals one of the values in a character vector
region.list <- c("Africa", "Asia", "Europe")
TradeBalanceData %>%
	filter(Region %in% region.list)
 