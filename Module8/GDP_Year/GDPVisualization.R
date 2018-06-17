# Change the theme and center the chart title
library(ggplot2)
library(RColorBrewer)
library(ggthemes)
library(ggrepel)
library(dplyr)

dataset <-
	GDPData %>%
	mutate(Year = as.numeric(Year)) %>%
	filter(Year == 2017 & Stat == "GDP")

if (length(unique(dataset$Year)) == 1 & length(unique(dataset$Stat)) == 1) {

	ec.colors <- c(
		"Emerging/Developing" = "#FFD700", # Hex value for gold 
		"Advanced" = "#FF0000" # Hex value for red
	)

	chart.title = switch(
		  as.character(dataset$Stat[1])
		, "GDP" = "Gross Domestic Product"
		, "GDPPPP" = "Gross Domestic Product (Purchase Power Parity)"
		, "GDPPC" = "Gross Domestic Product Per Capita"
		, "GDPPPPPC" = "Gross Domestic Product Per Capita (Purchase Power Parity)"
	)

	gdp.legend.title = switch(
		  as.character(dataset$Stat[1])
		, "GDP" = "GDP ($Billions)"
		, "GDPPPP" = "GDP (PPP) ($Billions)"
		, "GDPPC" = "GDP Per Capita ($)"
		, "GDPPPPPC" = "GDP Per Capita (PPP) ($)"
	)

	p <- ggplot(dataset, aes(Scaled.Population, Scaled.Area, size = `Value`)) +
		 geom_point(
			shape = 21
			, stroke = 1
			, aes(fill = Scaled.HDI, color = `Economy Classification`)
		 ) +
		 geom_label_repel(
			aes(label = Country)
			, show.legend = FALSE
			, size = 4
		 ) +
		 scale_fill_continuous(
			guide =
				guide_colorbar(
					title = "2015 Human Development Index"
					, size = 18
				)
		 ) +
		 scale_color_manual(
					values = ec.colors
					, guide = guide_legend(title = "2017 Economy Classification")
			 ) +
		 scale_size_continuous(
			guide = guide_legend(title = gdp.legend.title)
		 ) +
		 labs(x = "Population", y = "Land Area") +
		 ggtitle(chart.title) +
		 theme_classic() +
		 theme(plot.title = element_text(hjust = 0.5, size = 20))
	p
} else {
	p <- ggplot(dataset, aes(x = Scaled.Population, y = Scaled.Area)) +
				 geom_blank() +
				 scale_x_continuous(
						  labels = NULL
						, breaks = NULL
					 ) +
				 scale_y_continuous(
					  labels = NULL
					, breaks = NULL
				 ) +
				 labs(x = NULL, y = NULL) +
				 theme_classic()
	p

}