library(tidyverse)
library(readxl)

path <- "./ExcelWorkbook/SportingStoreSales.xlsx"

# Workflow to combine data from multiple sheets into one dataframe
data <- path %>%
	excel_sheets() %>%
	set_names() %>%
	map_df(.f = ~read_excel(path = path, sheet = .x), .id = "sheet")

# File path for Power BI
path <- file.path(getwd(), "/ExcelWorkbook/SportingStoreSales.xlsx")