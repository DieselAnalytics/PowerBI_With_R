library(tidyverse)
library(readxl)
library(tidyr)
library(stringr)
library(BBmisc)

GDPByCountry <- read_excel("./Data/imf-dm-export-gdp.xlsx", sheet = "Data", na = "no data")
colnames(GDPByCountry)[1] <- "Country"
GDPByCountry <- GDPByCountry[-1,]
GDPByCountry$Stat <- "GDP"

GDPByCountryPPP <- read_excel("./Data/imf-dm-export-gdp-ppp.xlsx", sheet = "Data", na = "no data")
colnames(GDPByCountryPPP)[1] <- "Country"
GDPByCountryPPP <- GDPByCountryPPP[-1,]
GDPByCountryPPP$Stat <- "GDP PPP"

# G20 data
# https://en.wikipedia.org/wiki/G20#cite_note-35
TopPopCountryData <-
	read_csv("./Data/Top12CountriesByPop.csv") %>%
	mutate(
		Scaled.Population = round(normalize(Population, method = "range", range = c(0, 10)), 1)
	   ,Scaled.Area = round(normalize(Area, method = "range", range = c(0, 10)), 1)
	   ,Scaled.HDI = as.factor(round(normalize(HDI, method = "range", range = c(0, 10)), 1))
	) %>%
	rename(Country = Member)

GDPData <-
	rbind(GDPByCountry, GDPByCountryPPP) %>%
	mutate(Country = ifelse(Country == "Russian Federation", "Russia", Country)) %>%
	mutate(Country = ifelse(Country == "China, People's Republic of", "China", Country)) %>%
	mutate(Country = ifelse(Country == "Korea, Republic of", "South Korea", Country)) %>%
	gather(Year, Value, - Country, - Stat) %>%
	mutate(Value = as.numeric(Value)) %>%
	spread(Stat, Value) %>%
	filter(Country != "©IMF, 2017" & !is.na(Country)) %>%
	inner_join(TopPopCountryData, by = "Country") %>%
	filter(Year == 2017)

library(RColorBrewer)
library(ggplot2)
library(ggthemes)
library(ggrepel)

ec.colors <- c("Emerging/Developing" = "#FF0000", "Advanced" = "#9ACD32")
country.pallete <- brewer.pal(9, "Greys")

p <- ggplot(GDPData, aes(Scaled.Population, Scaled.Area, size = `GDP`)) +
	 geom_point(shape = 21, stroke = 1, aes(fill = Scaled.HDI, color = `Economy Classification`)) +
	 geom_label_repel(aes(label = Country), show.legend = FALSE, size = 4) +
	 scale_fill_manual(values = country.pallete) +
	 scale_color_manual(values = ec.colors) +
	 scale_x_continuous(labels = NULL) +
	 scale_y_continuous(labels = NULL) +
	 labs(x = "Population", y = "Land Area") +
	 ggtitle("GDP Per Capital") +
     theme(plot.title = element_text(hjust = 0.5)) #+
     theme_classic()
p	
