library(tidyverse)
library(BBmisc)
library(readxl)

combine.workbook.path <- "C:/Users/RWADE_HP/documents/visual studio 2015/Projects/PowerBIWithR/Module8/Data/CombineData.xlsx"

for (i in 2010:2017) {
	combine.data.year <-
		read_excel(
			path = combine.workbook.path,
			sheet = as.character(i),
			na = "0"
		) %>%
	mutate(
		 Scaled.40YD =
			round(
				normalize(
					 `40YD` * -1
					, method = "range"
					, range = c(-10, 10)
				)
			, 1)
		, Scaled.BenchReps =
			round(
				normalize(
					`BenchReps`
					, method = "range"
					, range = c(-10, 10)
				)
			, 1)
	)

	ifelse(
		 i == 2010
		,combine.data <- combine.data.year
		,combine.data <- rbind(combine.data, combine.data.year)
	)
}
