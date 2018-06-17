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

if (length(unique(dataset$Year))) { 

	p <- ggplot(dataset, aes(x = Scaled.BenchReps, y = Scaled.40YD, col = Pos)) +
		 geom_point() +
		 geom_label_repel(aes(label = Player), size = 3, show.legend = FALSE) +
		 geom_hline(yintercept = 0) +
		 geom_vline(xintercept = 0) +

		 # quad labels
		 annotate("text", x = -5, y = -10, label = "Average", alpha = 0.2) +
		 annotate("text", x = -5, y = 10, label = "Fast", alpha = 0.2) +
		 annotate("text", x = 5, y = -10, label = "Strong", alpha = 0.2) +
		 annotate("text", x = 5, y = 10, label = "Beast Mode", alpha = 0.2) +

		 # Squares for quad labels
		 annotate("rect", xmin = -3.5, xmax = -6.5, ymin = -10.5, ymax = -9.5, alpha = .2) +
		 annotate("rect", xmin = -3.5, xmax = -6.5, ymin = 9.5, ymax = 10.5, alpha = .2) +
		 annotate("rect", xmin = 3.5, xmax = 6.5, ymin = -10.5, ymax = -9.5, alpha = .2) +
		 annotate("rect", xmin = 3.5, xmax = 6.5, ymin = 9.5, ymax = 10.5, alpha = .2) 

	p
} else {
	df <- data.frame()
	p <- ggplot(df)
	p
}