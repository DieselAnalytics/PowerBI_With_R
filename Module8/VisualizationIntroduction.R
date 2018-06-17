library(ggplot2)
library(dplyr)
library(RColorBrewer)

diamond.subset <-
	diamonds %>%
	filter(color == "D") %>%
	sample_n(500)
 
ggplot(diamond.subset, aes(carat, price)) +
geom_point(aes(color = clarity)) +
geom_smooth(method = "lm", se = TRUE, level = 0.9) +
scale_color_brewer(palette = "Set1") +
theme_bw() +
labs(title = "Diamonds", x = "Carat", y = "Price")
