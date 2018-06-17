library(tidyverse)
library(BBmisc)
library(readxl)

wb.path <- "./Data/CombineData.xlsx"

combine.data <- wb.path %>%
	excel_sheets() %>%
	map_df(.f = ~read_excel(path = wb.path, sheet = .x)) %>%
	filter(!is.na(`40YD`) & !is.na(`BenchReps`))

combine.data <-
	combine.data %>%
	split(combine.data$Year) %>%
	map_df(.f =
		~mutate(
			 .x
			 ,Scaled.40YD =
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
	)