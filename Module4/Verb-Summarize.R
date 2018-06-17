library(tidyverse)

# Imports Trade Balance Data
TradeBalanceData <- readr::read_csv("./Data/TradeBalanceData.csv")

# Imports Region Information
CountriesByRegion <- readr::read_csv("./Data/CountriesByRegion.csv")

# Combines Trade Balance and Region data
TradeBalanceData <- TradeBalanceData %>%
	dplyr::inner_join(CountriesByRegion, by = "Country") %>%
	dplyr::select(Region, Country, matches("201[0-4].*"))

# Summing Trade Balance data by Region including the NAs
RegionTradeBalanceDataWithNAs <- TradeBalanceData %>%
	group_by(Region) %>%
	summarise(
		`Total 2010 Exports` = sum(`2010 Exports`),
		`Total 2010 Imports` = sum(`2010 Imports`),
		`Total 2010 Trade Balance` = sum(`2010 Trade Balance`),
		`Total 2011 Exports` = sum(`2011 Exports`),
		`Total 2011 Imports` = sum(`2011 Imports`),
		`Total 2011 Trade Balance` = sum(`2011 Trade Balance`),
		`Total 2012 Exports` = sum(`2012 Exports`),
		`Total 2012 Imports` = sum(`2012 Imports`),
		`Total 2012 Trade Balance` = sum(`2012 Trade Balance`),
		`Total 2013 Exports` = sum(`2013 Exports`),
		`Total 2013 Imports` = sum(`2013 Imports`),
		`Total 2013 Trade Balance` = sum(`2013 Trade Balance`),
		`Total 2014 Exports` = sum(`2014 Exports`),
		`Total 2014 Imports"` = sum(`2014 Imports`),
		`Total 2014 Trade Balance` = sum(`2014 Trade Balance`)
		)
RegionTradeBalanceDataWithNAs

# Summing Trade Balance data by Region excluding the NAs
RegionTradeBalanceDataWithoutNAs <-
	TradeBalanceData %>%
	dplyr::group_by(Region) %>%
	dplyr::summarise(
		`Total 2010 Exports` = sum(`2010 Exports`, na.rm = TRUE),
		`Total 2010 Imports` = sum(`2010 Imports`, na.rm = TRUE),
		`Total 2010 Trade Balance` = sum(`2010 Trade Balance`, na.rm = TRUE),
		`Total 2011 Exports` = sum(`2011 Exports`, na.rm = TRUE),
		`Total 2011 Imports` = sum(`2011 Imports`, na.rm = TRUE),
		`Total 2011 Trade Balance` = sum(`2011 Trade Balance`, na.rm = TRUE),
		`Total 2012 Exports` = sum(`2012 Exports`, na.rm = TRUE),
		`Total 2012 Imports` = sum(`2012 Imports`, na.rm = TRUE),
		`Total 2012 Trade Balance` = sum(`2012 Trade Balance`, na.rm = TRUE),
		`Total 2013 Exports` = sum(`2013 Exports`, na.rm = TRUE),
		`Total 2013 Imports` = sum(`2013 Imports`, na.rm = TRUE),
		`Total 2013 Trade Balance` = sum(`2013 Trade Balance`, na.rm = TRUE),
		`Total 2014 Exports` = sum(`2014 Exports`, na.rm = TRUE),
		`Total 2014 Imports"` = sum(`2014 Imports`, na.rm = TRUE),
		`Total 2014 Trade Balance` = sum(`2014 Trade Balance`, na.rm = TRUE)
		)
RegionTradeBalanceDataWithoutNAs