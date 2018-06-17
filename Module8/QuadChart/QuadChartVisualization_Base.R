library(tidyverse)
library(ggrepel)
library(ggthemes)

# Website that contains a list of 500 colors with their hex value
# http://cloford.com/resources/colours/500col.htm

dataset <-
	filter(
		combine.data
		, Year == 2017
	)

if (length(unique(dataset$Year))==1) { 

	p <- ggplot(dataset, aes(x = Scaled.BenchReps, y = Scaled.40YD, col = Pos)) +
		 geom_point() +
	     geom_label_repel(aes(label = Player), size = 3, show.legend = FALSE) +
		 geom_hline(yintercept = 0) +
		 geom_vline(xintercept = 0)
	p
} else {
	df <- data.frame()
	p <- ggplot(df)
	p
}