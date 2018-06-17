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

# Generates the GDP legend title based on the selected GDP 
# statistics
gdp.legend.title = switch(
		  as.character(dataset$Stat[1])
		, "GDP" = "GDP ($Billions)"
		, "GDPPPP" = "GDP (PPP) ($Billions)"
		, "GDPPC" = "GDP Per Capita ($)"
		, "GDPPPPPC" = "GDP Per Capita (PPP) ($)"
	)

if (length(unique(dataset$Year)) == 1 & length(unique(dataset$Stat)) == 1) {

	p <- ggplot(
			dataset
			, aes(
				x = Scaled.Population
				, y = Scaled.Area
				, size = Value
			  )
		 ) +
		# Common shapes for points
		# http://www.sthda.com/english/wiki/ggplot2-point-shapes
		geom_point(
			shape = 21
			, stroke = 1
			, aes(
				fill = Scaled.HDI
				, color = `Economy Classification`
			  )
		 ) +
		#geom_label(
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
		 # Website that has hex codes for 500+ colors
	     # http://cloford.com/resources/colours/500col.htm
		 scale_color_manual(
					values = c(
							   "Emerging/Developing" = "#FFD700", # Hex value for gold 
							   "Advanced" = "#FF0000" # Hex value for red
					          )
					, guide = guide_legend(title = "2017 Economy Classification")
		) +
		 scale_size_continuous(
			guide = guide_legend(title = gdp.legend.title)
	    ) 

	p

} else {
	df <- data.frame()
	p <- ggplot(df)
	p

}