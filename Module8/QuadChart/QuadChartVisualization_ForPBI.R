library(tidyverse)
library(ggrepel)
library(ggthemes)

# Website that contains a list of 500 colors with their hex value
# http://cloford.com/resources/colours/500col.htm

dataset <-
	filter(
		combine.data.year
		, Year == 2017
	)

dataset <- combine.data

if (length(unique(dataset$Year)) == 1) {
	pos.col <-
		c(
			"RB" = "#4876FF", # royalblue 1
			"FB" = "#FF0000" # red 1
		)
	chart.title <- paste0(min(dataset$Year), " Combine Quad Chart for RBs and FBs")

	p <- ggplot(dataset, aes(x = Scaled.BenchReps, y = Scaled.40YD, col = Pos)) +
		 geom_point() +
		 geom_label_repel(aes(label = Player), size = 4, show.legend = FALSE) +
		 geom_hline(yintercept = 0) +
		 geom_vline(xintercept = 0) +

	# quad labels
	annotate("text", x = -5, y = -11, label = "Average", alpha = 0.2, size = 6) +
		 annotate("text", x = -5, y = 11, label = "Fast", alpha = 0.2, size = 6) +
		 annotate("text", x = 5, y = -11, label = "Strong", alpha = 0.2, size = 6) +
		 annotate("text", x = 5, y = 11, label = "Beast Mode", alpha = 0.2, size = 6) +

		 # Squares for quad labels
	     annotate("rect", xmin = -3.5, xmax = -6.5, ymin = -11.5, ymax = -10.5, alpha = .2) +
		 annotate("rect", xmin = -3.5, xmax = -6.5, ymin = 10.5, ymax = 11.5, alpha = .2) +
		 annotate("rect", xmin = 3.5, xmax = 6.5, ymin = -11.5, ymax = -10.5, alpha = .2) +
		 annotate("rect", xmin = 3.5, xmax = 6.5, ymin = 10.5, ymax = 11.5, alpha = .2) +

	     # Titles
	     xlab(bquote("Strength" ~ symbol('\256'))) +
		 ylab(bquote("Speed" ~ symbol('\256'))) +
		 ggtitle(chart.title) +

	     # Prettying things up
	     theme_tufte() +
		 theme(
			  plot.title = element_text(hjust = 0.5, size = 20)
			, panel.border = element_rect(colour = "black", size = 2, fill = NA)
			, axis.title.x = element_text(hjust = 0.1)
			, axis.title.y = element_text(hjust = 0.1)
		 ) +
		 scale_x_continuous(labels = NULL, breaks = NULL) +
		 scale_y_continuous(labels = NULL, breaks = NULL) +
		 scale_color_manual(values = pos.col)

	p
} else {
	p <- ggplot(dataset, aes(x = Scaled.BenchReps, y = Scaled.40YD)) +
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