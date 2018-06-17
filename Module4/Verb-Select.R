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
	dplyr::select(Region, Country:`2014 Trade Balance`)

# Subset columns by name
ExplicitSelect <-
	TradeBalanceData %>%
	dplyr::select(Region, Country, `2000 Trade Balance`,`2000 Exports`, `2000 Imports`)
ExplicitSelect

# Subset columns by position
PositionSelect <-
	TradeBalanceData %>%
	dplyr::select(Region:`2000 Trade Balance`)
PositionSelect

# Subset columns by character vector
column.names <-	c("Region", "Country", "2000 Trade Balance", "2000 Exports", "2000 Imports")
VariableSelect <-
	TradeBalanceData %>%
	dplyr::select(column.names)
VariableSelect

# Subset columns using dplyr's "contains" function
ContainsSelect <-
	TradeBalanceData %>%
	dplyr::select(Region, Country, dplyr::contains("2000"))
ContainsSelect

# Subset columns using dplyr's "starts_with" function
StartsWithSelect <-
	TradeBalanceData %>%
	dplyr::select(Region, Country, dplyr::starts_with("2000"))
StartsWithSelect

# Subset columns using dplyr's "matches" function
MatchesSelect <-
	TradeBalanceData %>%
	select(Region, Country, dplyr::matches("^201[0-4].*"))
MatchesSelect
