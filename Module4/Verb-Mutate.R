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
	dplyr::inner_join(
		CountriesByRegion, by = "Country") %>%
	dplyr::select(
		Region, Country, matches("201[0-4].*"))

RegionTradeBalanceDataWithoutNAs <-
	TradeBalanceData %>%
	group_by(Region) %>%
	summarise(
		`Total 2014 Exports` = sum(`2014 Exports`, na.rm = TRUE),
		`Total 2014 Imports` = sum(`2014 Imports`, na.rm = TRUE),
		`Total 2014 Trade Balance` = sum(`2014 Trade Balance`, na.rm = TRUE)
		)
RegionTradeBalanceDataWithoutNAs

RegionTradeBalanceDataInMillions <-
	RegionTradeBalanceDataWithoutNAs %>%
	mutate(
		`Scaled 2014 Exports` = `Total 2014 Exports` / 1000000,
		`Scaled 2014 Imports"` = `Total 2014 Imports` / 1000000,
		`Scaled 2014 Trade Balance` = `Total 2014 Trade Balance` / 1000000
	)
RegionTradeBalanceDataInMillions

RegionTradeBalanceDataInMillionsTransmute <-
	RegionTradeBalanceDataWithoutNAs %>%
	transmute(
	    Region = Region,
		`Scaled Total 2014 Exports` = `Total 2014 Exports` / 1000000,
		`Scaled Total 2014 Imports` = `Total 2014 Imports` / 1000000,
		`Scaled Total 2014 Trade Balance` = `Total 2014 Trade Balance` / 1000000
	)
RegionTradeBalanceDataInMillionsTransmute