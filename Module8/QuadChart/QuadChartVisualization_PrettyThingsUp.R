library(tidyverse)
library(ggrepel)
library(ggthemes)

dataset <-
	filter(
		combine.data
		, Year == 2016
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
		 annotate("rect", xmin = 3.5, xmax = 6.5, ymin = 9.5, ymax = 10.5, alpha = .2) +

	     # Titles
		 xlab(bquote("Strength" ~ symbol('\256'))) +
		 ylab(bquote("Speed" ~ symbol('\256'))) +
	     ggtitle(paste0("Combine Quad Chart for ", min(dataset$Year))) +

		 # Prettying things up
		 theme_tufte() +
		 theme(
			  plot.title = element_text(hjust = 0.5)
			, panel.border = element_rect(colour = "black", size = 2, fill = NA)
			, axis.title.x = element_text(hjust = 0.1)
			, axis.title.y = element_text(hjust = 0.1)
		 ) +
		 scale_x_continuous(labels = NULL, breaks = NULL) +
		 scale_y_continuous(labels = NULL, breaks = NULL) +

		# Website that contains a list of 500 colors with their hex value
		# http://cloford.com/resources/colours/500col.htm
		 scale_color_manual(values = c(
										"RB" = "#4876FF", # royalblue 1
										"FB" = "#FF0000" # red 1
									 )
		)

	p
} else {
	df <- data.frame()
	p <- ggplot(df)
	p
}