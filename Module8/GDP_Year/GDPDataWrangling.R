library(tidyverse)
library(readxl)
library(tidyr)
library(stringr)
library(BBmisc)

# Data source
# http://www.imf.org/external/datamapper/NGDPDPC@WEO/OEMDC/ADVEC/WEOWORLD

#GDPByCountry <- read_excel("C:/Users/RWADE_HP/Documents/Visual Studio 2015/Projects/PowerBIWithR/Module8/Data/imf-dm-export-gdp.xlsx", sheet = "Data", na = "no data")
GDPByCountry <- read_excel("./Data/imf-dm-export-gdp.xlsx", sheet = "Data", na = "no data")
colnames(GDPByCountry)[1] <- "Country"
GDPByCountry <- GDPByCountry[-1,]
GDPByCountry$Stat <- "GDP"

#GDPByCountryPPP <- read_excel("C:/Users/RWADE_HP/Documents/Visual Studio 2015/Projects/PowerBIWithR/Module8/Data/imf-dm-export-gdp-ppp.xlsx", sheet = "Data", na = "no data")
GDPByCountryPPP <- read_excel("./Data/imf-dm-export-gdp-ppp.xlsx", sheet = "Data", na = "no data")
colnames(GDPByCountryPPP)[1] <- "Country"
GDPByCountryPPP <- GDPByCountryPPP[-1,]
GDPByCountryPPP$Stat <- "GDPPPP"

#GDPByCountryPC <- read_excel("C:/Users/RWADE_HP/Documents/Visual Studio 2015/Projects/PowerBIWithR/Module8/Data/imf-dm-export-gdp-pc.xlsx", sheet = "Data", na = "no data")
GDPByCountryPC <- read_excel("./Data/imf-dm-export-gdp-pc.xlsx", sheet = "Data", na = "no data")
colnames(GDPByCountryPC)[1] <- "Country"
GDPByCountryPC <- GDPByCountryPC[-1,]
GDPByCountryPC$Stat <- "GDPPC"

#GDPByCountryPPPPC <- read_excel("C:/Users/RWADE_HP/Documents/Visual Studio 2015/Projects/PowerBIWithR/Module8/Data/imf-dm-export-gdp-ppp-pc.xlsx", sheet = "Data", na = "no data")
GDPByCountryPPPPC <- read_excel("./Data/imf-dm-export-gdp-ppp-pc.xlsx", sheet = "Data", na = "no data")
colnames(GDPByCountryPPPPC)[1] <- "Country"
GDPByCountryPPPPC <- GDPByCountryPPPPC[-1,]
GDPByCountryPPPPC$Stat <- "GDPPPPPC"

# https://en.wikipedia.org/wiki/G20#cite_note-35
# The Human Development Index(HDI) is a composite statistic(composite index) of 
# life expectancy, education, and per capita income indicators, which are used 
# to rank countries into four tiers of human development. A country scores higher
# HDI when the lifespan is higher, the education level is higher, and the GDP 
# per capita is higher. The HDI was developed by Pakistani economist, 
# Mahbub ul Haq

G19Countries <-
	#read_csv("C:/Users/RWADE_HP/Documents/Visual Studio 2015/Projects/PowerBIWithR/Module8/Data/G19Countries.csv") %>%
	read_csv("./Data/G19Countries.csv") %>%
	mutate(
		Scaled.Population = round(normalize(Population, method = "range", range = c(0, 10)), 1)
	   ,Scaled.Area = round(normalize(Area, method = "range", range = c(0, 10)), 1)
	   ,Scaled.HDI = round(normalize(HDI, method = "range", range = c(0, 10)), 1)
	) %>%
	rename(Country = Member)

GDPData <-
	rbind(GDPByCountry, GDPByCountryPPP, GDPByCountryPC, GDPByCountryPPPPC) %>%
	mutate(Country = ifelse(Country == "Russian Federation", "Russia", Country)) %>%
	mutate(Country = ifelse(Country == "China, People's Republic of", "China", Country)) %>%
	mutate(Country = ifelse(Country == "Korea, Republic of", "South Korea", Country)) %>%
	gather(Year, Value, - Country, - Stat) %>%
	mutate(Value = as.numeric(Value)) %>%
	filter(Country != "©IMF, 2017" & !is.na(Country)) %>%
	inner_join(G19Countries, by = "Country")

