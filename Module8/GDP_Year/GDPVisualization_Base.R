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

	# Base Bubble Chart
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
		 ) 
	p
} else {
	df <- data.frame()
	p <- ggplot(df)
	p
}