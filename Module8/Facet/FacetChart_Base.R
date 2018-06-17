library(readr)
library(ggplot2)

dataset <- read_csv("./Data/FacetChartData.csv")

if (length(unique(dataset$Stat)) == 1) {

	ggplot(dataset, aes(Year, Value)) +
	geom_line() +
	facet_wrap(~Country)
	
} else {

	df <- data.frame()
	p <- ggplot(df)
	p
}