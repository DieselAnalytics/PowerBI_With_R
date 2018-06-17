library(readr)
read_csv_example <- read_csv("C:/Users/RWADE_HP/Documents/Visual Studio 2015/Projects/PowerBIWithR/Module3/Flatfiles/salaries-by-college-type-csv.csv")
read_csv_example


library(readr)
read_tsv_example <- read_tsv("C:/Users/RWADE_HP/Documents/Visual Studio 2015/Projects/PowerBIWithR/Module3/Flatfiles/salaries-by-college-type-tab.txt")
read_tsv_example


library(readr)
read_delim_example <- read_delim("C:/Users/RWADE_HP/Documents/Visual Studio 2015/Projects/PowerBIWithR/Module3/Flatfiles/salaries-by-college-type-tab.txt",
								 delim = "|"
					  )
read_delim_example


library(readxl)
readxl_example <- read_excel("C:/Users/RWADE_HP/Documents/Visual Studio 2015/Projects/PowerBIWithR/Module3/Flatfiles/salaries-by-college-type-xlsx.xlsx",
							 sheet = "salaries-by-college"
				  )
readxl_example


library(readr)
library(stringr)
column__names <- c("School", "Type", "Starting Median Salary", "MC Median Salary", 
                   "MC 10th Percentile Salary", "MC 25th Percentile Salary", 
				   "MC 75th Percentile Salary", "MC 90th Percentile Salary")
read_csv_example <- read_csv("C:/Users/RWADE_HP/Documents/Visual Studio 2015/Projects/PowerBIWithR/Module3/Flatfiles/salaries-by-college-type-csv.csv",
							 col_names = column__names,
							 skip = 1
					)
read_csv_example

x <- "$36,300,000.00"
as.numeric(x)
x <- str_replace_all("$36,300,000.00", "[\\$,]+", "")
as.numeric(x)

read_csv_example$"Starting Median Salary" <- as.numeric(str_replace_all(read_csv_example$"Starting Median Salary", "[\\$,]+", ""))
read_csv_example$"MC Median Salary" <- as.numeric(str_replace_all(read_csv_example$"MC Median Salary", "[\\$,]+", ""))
read_csv_example$"MC 10th Percentile Salary" <- as.numeric(str_replace_all(read_csv_example$"MC 10th Percentile Salary", "[\\$,]+", ""))
read_csv_example$"MC 25th Percentile Salary" <- as.numeric(str_replace_all(read_csv_example$"MC 25th Percentile Salary", "[\\$,]+", ""))
read_csv_example$"MC 75th Percentile Salary" <- as.numeric(str_replace_all(read_csv_example$"MC 75th Percentile Salary", "[\\$,]+", ""))
read_csv_example$"MC 90th Percentile Salary" <- as.numeric(str_replace_all(read_csv_example$"MC 90th Percentile Salary", "[\\$,]+", ""))
read_csv_example

