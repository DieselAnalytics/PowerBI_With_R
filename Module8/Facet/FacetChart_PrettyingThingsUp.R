library(readr)
library(ggplot2)
library(ggthemes)

dataset <- read_csv("./Data/FacetChartData.csv")

chart.title = switch(
		  as.character(dataset$Stat[1])
		, "GDP" = "Gross Domestic Product Comparison by Country By Year ($ Billions)"
		, "GDPPPP" = "Gross Domestic Product Comparison by Country By Year (Purchase Power Parity) ($ Billions)"
		, "GDPPC" = "Gross Domestic Product Per Capita by Country By Year ($)"
		, "GDPPPPPC" = "Gross Domestic Product Per Capita by Country By Year (Purchase Power Parity) ($)"
	)

if (length(unique(dataset$Stat)) == 1) {

	ggplot(dataset, aes(x = Year, y = Value)) +
	geom_line() +
	facet_wrap(~Country) +
	theme_economist_white() +
	ggtitle(chart.title)
	
} else {

	df <- data.frame()
	p <- ggplot(df)
	p

}